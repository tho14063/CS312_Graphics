uniform mat4 u_MVP;
uniform mat4 u_Projection;
uniform mat4 u_ModelView;
uniform bool u_isBillboard;
uniform mat3 u_UVMat;
attribute vec3 a_Position;
attribute vec2 a_UV;
attribute vec3 a_Normal;


varying vec4 v_Position;
varying vec2 v_UV;
varying vec3 v_Normal;

void main()
{
    vec4 norm = vec4(a_Normal, 0.0);
    v_UV.xy = (u_UVMat * vec3(a_UV, 1.0)).xy;
    mat4 billboard = u_ModelView;
    if (false)
    {
	    billboard[0][0] = 1.0;
	    billboard[0][1] = 0.0;
	    billboard[0][2] = 0.0;

        billboard[1][0] = 0.0;
	    billboard[1][1] = 1.0;
	    billboard[1][2] = 0.0;

	    billboard[2][0] = 0.0;
	    billboard[2][1] = 0.0;
	    billboard[2][2] = 1.0;
    }
    if (u_isBillboard)
    {
        v_Position = u_Projection * billboard * vec4(a_Position, 1.0);
    }
    else
    {
        v_Position = u_MVP * vec4(a_Position, 1.0);
    }
    
    gl_Position = v_Position;
    v_Normal.xyz = (normalize(u_MVP * norm)).xyz;
}
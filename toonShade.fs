uniform sampler2D u_Texture;
uniform vec3 u_LightColor;
uniform vec3 u_LightPos;
uniform vec3 u_CameraPos;
uniform vec3 u_Ambient;
uniform vec3 u_Diffuse;
uniform vec3 u_Specular;
uniform float u_Shiny;

varying vec4 v_Position;
varying vec2 v_UV;
varying vec3 v_Normal;

void main()
{
    gl_FragColor = texture2D(u_Texture, v_UV);
}
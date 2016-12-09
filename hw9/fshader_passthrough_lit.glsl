#version 120

// light properties
uniform vec4 light_diffuse;
uniform vec4 light_specular;
uniform vec4 light_ambient;
uniform vec4 light_position;

// material properties
uniform vec4 material_diffuse;
uniform vec4 material_specular;
uniform vec4 material_ambient;
uniform float material_shininess;

varying vec4 f_vNorm;
varying vec4 f_light_direction;
varying vec4 f_view_vec;
//varying vec4 color;

void main()
{
    vec4 ambient_color = material_ambient * light_ambient;
    float dd1 = max(0, dot(f_vNorm, f_light_direction));
    vec4 diffuse_color = material_diffuse * light_diffuse * dd1;

    vec4 bisector = normalize(f_light_direction + f_view_vec);
    float dd2 = max(0, dot(f_vNorm, bisector));
    vec4 specular_color = material_specular * light_specular * pow(dd2, material_shininess);

    vec4 vColor = ambient_color + diffuse_color + specular_color;
    vColor[3] = 1.0;

    gl_FragColor = vColor;
}

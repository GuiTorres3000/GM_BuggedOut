//
// Wind ripple fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

uniform float Time;
uniform vec2 Size;
uniform vec2 Wave;

void main()
{
    // Centralizando o efeito na tela
    vec2 Coord = v_vTexcoord + vec2(
        cos((v_vPosition.y / Size.y + Time) * 6.2831) * Wave.y, 
        sin((v_vPosition.x / Size.x + Time) * 6.2831) * Wave.x
    ) / Size;

    // Aplica a cor e textura normalmente
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, Coord);
}
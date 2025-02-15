//
// Simple passthrough vertex shader
//
attribute vec4 in_Position;
attribute vec2 in_TextureCoord;
attribute vec4 in_Colour;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * in_Position;
    v_vTexcoord = in_TextureCoord;
    v_vColour = in_Colour;
    v_vPosition = in_Position.xy; // Passa a posição dos vértices para o fragment shader
}
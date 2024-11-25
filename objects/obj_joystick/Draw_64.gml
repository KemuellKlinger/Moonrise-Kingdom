/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _x1 = 160;
var _y1 = 640;
var _escala = 1;

draw_sprite_ext(spr_Joystick, 0, _x1, _y1, _escala, _escala, 0, c_white, .3);

var _x2 = lengthdir_x(vel, direcao);
var _y2 = lengthdir_y(vel, direcao);

////Bolinha
draw_sprite_ext(spr_Joystick, 0, _x1 + _x2, _y1 + _y2, _escala/4, _escala/4, 0, c_red, .8);


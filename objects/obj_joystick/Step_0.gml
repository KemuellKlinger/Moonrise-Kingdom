/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Posição do joystick fixo
var _x1 = 160;
var _y1 = 640;
var _escala = 1;

var _sprit_size = sprite_get_width(spr_Joystick);
var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);
var mouse_sobre = point_in_circle(_mouse_x, _mouse_y, _x1, _y1, _sprit_size / 2);
var mouse_click = mouse_check_button(mb_left);

if (mouse_sobre || arrastar) {
    if (mouse_click) {
        arrastar = true;
        vel = min(point_distance(_x1, _y1, _mouse_x, _mouse_y), (_sprit_size / 2) * _escala);
        direcao = point_direction(_x1, _y1, _mouse_x, _mouse_y);
    }
}
if (!mouse_click) {
    arrastar = false;
    vel = lerp(vel, 0, .2);
}

var _x2 = lengthdir_x(vel, direcao);
var _y2 = lengthdir_y(vel, direcao);

// Atualizar valores no personagem
if (instance_exists(obj_personagem)) {
	
	var _val_max = (_sprit_size/2) *(_escala);
	var _velh = (_x2 / _val_max) * max_velo;
	var _velv = (_y2 / _val_max) * max_velo;
	
    obj_personagem.hveloc = _velh;
    obj_personagem.vveloc = _velv;
  
}
// Desenhar o joystick
draw_sprite_ext(spr_Joystick, 0, _x1, _y1, _escala, _escala, 0, c_white, .3);
draw_sprite_ext(spr_Joystick, 0, _x1 + _x2, _y1 + _y2, _escala / 4, _escala / 4, 0, c_red, .8);

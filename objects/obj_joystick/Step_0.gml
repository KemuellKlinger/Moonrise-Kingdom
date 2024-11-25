// Posição fixa do joystick e escala
var _x1 = 160;
var _y1 = 640;
var _escala = 1;

// Tamanho do sprite do joystick
var _sprit_size = sprite_get_width(spr_Joystick);
var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

// Verifica se o mouse está sobre o joystick
var mouse_sobre = point_in_circle(_mouse_x, _mouse_y, _x1, _y1, _sprit_size / 2);
var mouse_click = mouse_check_button(mb_left);

if (mouse_sobre || arrastar) {
    global.usando_joystick = true;
    if (mouse_click) {
        arrastar = true;
        // Calcula velocidade e direção do joystick
        vel = min(point_distance(_x1, _y1, _mouse_x, _mouse_y), (_sprit_size / 2) * _escala);
        direcao = point_direction(_x1, _y1, _mouse_x, _mouse_y);
    }
} else {
    global.usando_joystick = false;
}

if (!mouse_click) {
    arrastar = false;
    vel = 0; // Para quando o joystick não está sendo pressionado
}

// Atualiza deslocamento visual do joystick
// Calcula deslocamentos com base no joystick
var _x2 = lengthdir_x(vel, direcao);
var _y2 = lengthdir_y(vel, direcao);

// Limita os deslocamentos para evitar valores residuais que causem bugs
var _val_max = sprite_get_width(spr_Joystick) / 2;
var _velh = clamp((_x2 / _val_max) * max_velo, - max_velo, max_velo);
var _velv = clamp((_y2 / _val_max) * max_velo, - max_velo, max_velo);

// Aplica ao personagem, mas verifica se ele pode se mover
if (instance_exists(obj_personagem)) {
    obj_personagem.hveloc = _velh;
    obj_personagem.vveloc = _velv;
}

// Desenha o joystick na tela
//draw_sprite_ext(spr_Joystick, 0, _x1, _y1, _escala, _escala, 0, c_white, .3);
//draw_sprite_ext(spr_Joystick, 0, _x1 + _x2, _y1 + _y2, _escala / 4, _escala / 4, 0, c_white, .8);

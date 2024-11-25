// Variáveis de movimento do joystick
var _x1 = 160; // Posição fixa do joystick no eixo X
var _y1 = 640; // Posição fixa do joystick no eixo Y
var _escala = 1;

var _sprit_size = sprite_get_width(spr_Joystick); // Tamanho do sprite do joystick
var _mouse_x = device_mouse_x_to_gui(0); // Posição do mouse no eixo X
var _mouse_y = device_mouse_y_to_gui(0); // Posição do mouse no eixo Y

// Verifica se o mouse está dentro da área do joystick
var mouse_sobre = point_in_circle(_mouse_x, _mouse_y, _x1, _y1, _sprit_size / 2);
var mouse_click = mouse_check_button(mb_left); // Verifica se o mouse foi pressionado

if (mouse_sobre || arrastar) {
    global.usando_joystick = true;
    if (mouse_click) {
        arrastar = true;
        // Calcula a velocidade do joystick e a direção
        vel = min(point_distance(_x1, _y1, _mouse_x, _mouse_y), (_sprit_size / 2) * _escala);
        direcao = point_direction(_x1, _y1, _mouse_x, _mouse_y); 
    }
} else {
    global.usando_joystick = false;
}

if (!mouse_click) {
    arrastar = false;
    //vel = lerp(vel, 0, .2); // Desacelera quando o joystick não está sendo pressionado
	vel = 0;
}

// Calcula os deslocamentos no eixo X e Y com base no joystick
var _x2 = lengthdir_x(vel, direcao);
var _y2 = lengthdir_y(vel, direcao);

// Atualiza as variáveis de velocidade no personagem
if (instance_exists(obj_personagem)) {
    var _val_max = (_sprit_size / 0.5) * (_escala); // Ajusta a velocidade conforme a escala
    var _velh = (_x2 / _val_max); // Movimentação horizontal
    var _velv = (_y2 / _val_max); // Movimentação vertical

    // Verifica a colisão horizontal (X)
    if (!place_meeting(obj_personagem.x + _velh, obj_personagem.y, obj_bloco)) {
        obj_personagem.hveloc = _velh; // Aplica o movimento horizontal
    } else {
        obj_personagem.hveloc = 0; // Se houver colisão, não move horizontalmente
    }

    // Verifica a colisão vertical (Y)
    if (!place_meeting(obj_personagem.x, obj_personagem.y + _velv, obj_bloco)) {
        obj_personagem.vveloc = _velv; // Aplica o movimento vertical
    } else {
        obj_personagem.vveloc = 0; // Se houver colisão, não move verticalmente
    }
}

// Atualiza a posição do personagem
obj_personagem.x += obj_personagem.hveloc;
obj_personagem.y += obj_personagem.vveloc;

// Desenhar o joystick na tela
draw_sprite_ext(spr_Joystick, 0, _x1, _y1, _escala, _escala, 0, c_white, .3);
draw_sprite_ext(spr_Joystick, 0, _x1 + _x2, _y1 + _y2, _escala / 4, _escala / 4, 0, c_red, .8);

/// Evento Draw GUI: Visualização e depuração do botão virtual

var _escala = 4;

// Opcional: Desenhar o sprite no centro do botão virtual
var sprite_x_atk = button_x_atk  +(button_w_atk - sprite_get_width(spr_ataque)) / 2;
var sprite_y_atk = button_y_atk + (button_h_atk - sprite_get_height(spr_ataque)) / 2;

//draw_sprite(spr_esquerdo, 0, sprite_x, sprite_y);
draw_sprite_ext(spr_ataque, 0, sprite_x_atk, sprite_y_atk, _escala, _escala, 0, c_white, .8);


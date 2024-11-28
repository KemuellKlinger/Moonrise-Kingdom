/// Evento Draw GUI: Visualização e depuração do botão virtual

var _escala = 4;

// Desenhar um retângulo no local do botão

// Opcional: Desenhar o sprite no centro do botão virtual
var sprite_x_pulo = button_x_pulo + 10 + (button_w_pulo - sprite_get_width(spr_cima)) / 2;
var sprite_y_pulo = button_y_pulo + 15 + (button_h_pulo - sprite_get_height(spr_cima)) / 2;

//draw_sprite(spr_esquerdo, 0, sprite_x, sprite_y);
draw_sprite_ext(spr_cima, 0, sprite_x_pulo, sprite_y_pulo, _escala, _escala, 0, c_white, .8);



/// Evento Draw GUI: Visualização e depuração do botão virtual

var _escala = 2;

// Desenhar um retângulo no local do botão

// Opcional: Desenhar o sprite no centro do botão virtual
var sprite_x_bt = button_x_bt + 10 + (button_w_bt - sprite_get_width(spr_pause)) / 2;
var sprite_y_bt = button_y_bt + 15 + (button_h_bt - sprite_get_height(spr_pause)) / 2;

//draw_sprite(spr_esquerdo, 0, sprite_x, sprite_y);
draw_sprite_ext(spr_pause, 0, sprite_x_bt, sprite_y_bt, _escala, _escala, 0, c_white, 1);


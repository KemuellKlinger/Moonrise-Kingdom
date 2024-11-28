/// Evento Draw GUI: Visualização e depuração do botão virtual

var _escala = 4;

// Desenhar um retângulo no local do botão

// Opcional: Desenhar o sprite no centro do botão virtual
var sprite_x = button_x_esque + 10 + (button_w_esque - sprite_get_width(spr_esquerdo)) / 2;
var sprite_y = button_y_esque + 15+ (button_h_esque - sprite_get_height(spr_esquerdo)) / 2;

//draw_sprite(spr_esquerdo, 0, sprite_x, sprite_y);
draw_sprite_ext(spr_esquerdo, 0, sprite_x, sprite_y, _escala, _escala, 0, c_white, .8);


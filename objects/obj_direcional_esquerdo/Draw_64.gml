/// Evento Draw GUI: Visualização e depuração do botão virtual

// Desenhar um retângulo no local do botão
draw_set_color(c_white);
draw_rectangle(button_x, button_y, button_x + button_w, button_y + button_h, false);

// Opcional: Desenhar o sprite no centro do botão virtual
var sprite_x = button_x + (button_w - sprite_get_width(spr_esquerdo)) / 2;
var sprite_y = button_y + (button_h - sprite_get_height(spr_esquerdo)) / 2;

//draw_sprite(spr_esquerdo, 0, sprite_x, sprite_y);
draw_sprite_ext(spr_esquerdo, 0, sprite_x, sprite_y, 2, 2, 0, c_white, .8);


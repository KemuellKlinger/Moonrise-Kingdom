/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _escala = 4;

// Desenhar um retângulo no local do botão

// Opcional: Desenhar o sprite no centro do botão virtual
var sprite_x = button_x + 10 + (button_w - sprite_get_width(spr_direito)) / 2;
var sprite_y = button_y + 15 + (button_h - sprite_get_height(spr_direito)) / 2;

//draw_sprite(spr_esquerdo, 0, sprite_x, sprite_y);
draw_sprite_ext(spr_direito, 0, sprite_x, sprite_y, _escala, _escala, 0, c_white, .8);


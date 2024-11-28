/// @description Configuração do botão virtual para controle esquerdo

// Tamanho do sprite
var _sprite_size_w = sprite_get_width(spr_esquerdo);
var _sprite_size_h = sprite_get_height(spr_esquerdo);

// Posição do botão virtual
var _key_x = x; // Ajuste conforme necessário
var _key_y = display_get_height() - (_sprite_size_h * 12) - 20; // Baseado na tela

// Criação da tecla virtual
esquerda = virtual_key_add(_key_x, _key_y, _sprite_size_w * 2, _sprite_size_h * 2, ord("A"));

// Salvar as dimensões do botão para depuração
button_x_esque = _key_x;
button_y_esque = _key_y;
button_w_esque = _sprite_size_w * 2;
button_h_esque = _sprite_size_h * 2;

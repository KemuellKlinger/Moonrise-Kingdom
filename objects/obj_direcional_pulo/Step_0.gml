// Tamanho do sprite
var _sprite_size_w_pulo = sprite_get_width(spr_cima);
var _sprite_size_h_pulo = sprite_get_height(spr_cima);

// Posição do botão virtual
var _key_x_pulo = x + 1000; // Ajuste conforme necessário
var _key_y_pulo = display_get_height() - (_sprite_size_h_pulo * 12) - 20; // Baseado na tela
 
// Criação da tecla virtual
pulo = virtual_key_add(_key_x_pulo, _key_y_pulo, _sprite_size_w_pulo * 2, _sprite_size_h_pulo * 2, vk_space);

// Salvar as dimensões do botão para depuração
button_x_pulo = _key_x_pulo;
button_y_pulo = _key_y_pulo;
button_w_pulo = _sprite_size_w_pulo * 2;
button_h_pulo = _sprite_size_h_pulo * 2;

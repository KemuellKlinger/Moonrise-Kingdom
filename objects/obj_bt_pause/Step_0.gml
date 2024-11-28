/// @description Configuração do botão virtual para controle esquerdo

// Tamanho do sprite
var _sprite_size_w_bt = sprite_get_width(spr_pause);
var _sprite_size_h_bt = sprite_get_height(spr_pause);

// Posição do botão virtual
var _key_x_bt = x + 1100; // Ajuste conforme necessário
var _key_y_bt= display_get_height() - (_sprite_size_h_bt * 30) - 20; // Baseado na tela

// Criação da tecla virtual
bt = virtual_key_add(_key_x_bt, _key_y_bt, _sprite_size_w_bt * 2, _sprite_size_h_bt * 2, vk_escape);

// Salvar as dimensões do botão para depuração
button_x_bt = _key_x_bt;
button_y_bt = _key_y_bt;
button_w_bt = _sprite_size_w_bt * 2;
button_h_bt = _sprite_size_h_bt * 2;

// Tamanho do sprite
var _sprite_size_w_atk = sprite_get_width(spr_ataque);
var _sprite_size_h_atk = sprite_get_height(spr_ataque);

// Posição do botão virtual
var _key_x_atk = x + 1000; // Ajuste conforme necessário
var _key_y_atk = display_get_height() - (_sprite_size_h_atk * 12) - 20; // Baseado na tela
 
// Criação da tecla virtual
atk = virtual_key_add(_key_x_atk, _key_y_atk, _sprite_size_w_atk * 4, _sprite_size_h_atk * 4, ord("L"));

// Salvar as dimensões do botão para depuração
button_x_atk = _key_x_atk;
button_y_atk = _key_y_atk;
button_w_atk = _sprite_size_w_atk * 2;
button_h_atk = _sprite_size_h_atk * 2;

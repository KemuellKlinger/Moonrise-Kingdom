/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Função para o movimento do jogador

var esquerda, direita, direcaoX;
var _sprit_size_w = sprite_get_width(spr_direito);
var _sprit_size_h = sprite_get_height(spr_direito);
   
var _key_x = x + 100; // Ajuste conforme necessário
var _key_y = display_get_height() - (_sprit_size_h * 12) - 20 ; // Baseado na tela

direita = virtual_key_add(_key_x, _key_y, _sprit_size_w * 2, _sprit_size_h * 2, ord("D"));  // Isso retorna 1 se a tecla "D" estiver pressionada (ou o botão virtual)
  
direcaoX = direita;  // Aqui direcaoX será 1 se a tecla "D" (ou botão virtual) estiver pressionada, 0 caso contrário
  
// Verificação de colisões
var noChao = place_meeting(_key_x, _key_y + 1, obj_bloco);
  
// Atualização da escala da imagem para refletir a direção (virado para a direita)
if (direcaoX != 0) {
    image_xscale = 1;  // Como o movimento é apenas para a direita, garantimos que a imagem esteja virada para a direita
}

// Lógica de movimento no chão
if (noChao) {
    vel_vest = 0; // Redefine gravidade quando o personagem está no chão
}
      
button_x = _key_x;
button_y = _key_y;
button_w = _sprit_size_w * 2;
button_h = _sprit_size_h * 2;



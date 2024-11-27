/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Função para o movimento do jogador

    var esquerda, direita, direcaoX;
	var _sprit_size_w = sprite_get_width(spr_direito);
	var _sprit_size_h = sprite_get_height(spr_direito);
   
    direita = virtual_key_add(x, 600, _sprit_size_w * 2, _sprit_size_h * 2, ord("D"));  // Isso retorna 1 se a tecla "D" estiver pressionada (ou o botão virtual)
  
	
    // Define que a direção X será sempre positiva, pois o movimento é somente para a direita
    direcaoX = direita;  // Aqui direcaoX será 1 se a tecla "D" (ou botão virtual) estiver pressionada, 0 caso contrário
  

    // Verificação de colisões
    var noChao = place_meeting(x, y + 1, obj_bloco);
   

    // Atualização da escala da imagem para refletir a direção (virado para a direita)
    if (direcaoX != 0) {
        image_xscale = 1;  // Como o movimento é apenas para a direita, garantimos que a imagem esteja virada para a direita
    }

    // Lógica de movimento no chão
    if (noChao) {
        vel_vest = 0; // Redefine gravidade quando o personagem está no chão
	}
      
/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Função para o movimento do jogador

    var esquerda, direita, direcaoX;
	var _sprit_size_w = sprite_get_width(spr_direito);
	var _sprit_size_h = sprite_get_height(spr_direito);
    // Aqui você cria a tecla virtual para mover para a direita (usando virtual_key_add)
    // Isso cria um botão virtual para a direita, que é um retângulo de 250x100 na posição (x, y)
    direita = virtual_key_add(130, 620, _sprit_size_w, _sprit_size_h, ord("D"));  // Isso retorna 1 se a tecla "D" estiver pressionada (ou o botão virtual)
  
	
    // Define que a direção X será sempre positiva, pois o movimento é somente para a direita
    direcaoX = direita;  // Aqui direcaoX será 1 se a tecla "D" (ou botão virtual) estiver pressionada, 0 caso contrário

    // A velocidade horizontal do personagem será 0 se não houver movimento
  

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
        //// Define a animação de movimento (run) ou inatividade (idle)
        //if (direcaoX != 0) {
        //    sprite_index = sprite_run;
        //} else {
        //    sprite_index = sprite_idle;
        //}

    //    quant_pulo = max_pulo; // Reseta o contador de pulo duplo

    //    if (pulo) {
    //        vel_vest = forcaPulo;
    //        quant_pulo--;
    //    }
    //} else {
    //    // Controle de pulo duplo
      

    //   // Gravidade quando o personagem está no ar

    //    // Animação de pulo
     

    //    // Animação de queda
     

    //    // Verificação de colisão com a parede
     
    //}

    // Atualiza a posição do personagem




// Chama a função de controle do personagem


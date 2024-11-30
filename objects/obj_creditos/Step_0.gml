if (estado == "creditos") {
    // Move os créditos para cima
    posicao_y -= velocidade_rolagem;
    
    // Transição para agradecimentos quando os créditos saírem da tela
    if (posicao_y + string_height(texto_creditos) < 0) {
        estado = "agradecimentos";
        opacidade = 0; // Reinicia a opacidade para o fade-in
    }
}
else if (estado == "agradecimentos") {
    // Efeito fade-in
    if (opacidade < 1) {
        opacidade += fade_velocidade;
    }

    // Aguarda um tempo e começa fade-out
    if (opacidade >= 1 && keyboard_check_pressed(vk_escape)) {
        estado = "fadeout";
    }
}
else if (estado == "fadeout") {
    // Efeito fade-out
    if (opacidade > 0) {
        opacidade -= fade_velocidade;
    }
    else {
        // Retorna ao menu quando o fade-out terminar
        room_goto(RoomMenu);
    }
}

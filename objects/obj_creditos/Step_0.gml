/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Atualiza a posição para cima
posicao_y -= velocidade;

// Verifica se o texto já saiu da tela
if (posicao_y + string_height(texto_creditos) < 0) {
    room_goto(Room_Menu); // Volta ao menu principal ou outra sala
}

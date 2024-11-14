/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Checa se o objeto que colidiu é o jogador
if (other.object_index == obj_player) {
    other.vel_vest = 0; // Zera a velocidade vertical
    other.vel_hori = 0; // Zera a velocidade horizontal
}

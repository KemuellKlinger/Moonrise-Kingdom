/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (other.id == obj_personagem_hitbox) {
    // Reduz a vida do inimigo ou ativa o estado de dano
    vida -= dano; 
    if (vida <= 0) {
        instance_destroy(); // Destroi o inimigo
    }
}

/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

script_execute(estado)

/// Evento Etapa

// Verificar se a vida chegou a 0
if (vida <= 0) {
	
    // Alterar para o sprite de animação de morte
    sprite_index = boss_morrendo;
    image_speed = 1; // Velocidade da animação de morte

    // Garantir que a animação de morte está rodando
    if (image_index >= image_number - 1) {
        // Se a animação chegou ao fim, destruir a instância
        instance_destroy();
    }
}

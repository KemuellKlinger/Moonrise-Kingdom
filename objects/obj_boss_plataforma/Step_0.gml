/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Executa o estado atual
script_execute(estado_boss);

depth = -y;

// Aplica gravidade
if (!place_meeting(x, y + 1, obj_chao)) {
    vveloc_boss = min(vveloc_boss + gravidade_boss, veloc_terminal_boss);
} else {
    vveloc_boss = 0; // Reseta a velocidade vertical ao tocar o chão
}

// Movimentação horizontal e colisões
if place_meeting(x + sign(hveloc_boss), y, obj_chao) {
    while (!place_meeting(x + sign(hveloc_boss), y, obj_chao)) {
        x += sign(hveloc_boss);
    }
    hveloc_boss = 0; // Para o movimento horizontal ao colidir
}

x += hveloc_boss;
y += vveloc_boss;

// Verifica se o personagem morreu
if (vida_boss <= 0) {
    instance_destroy();
}

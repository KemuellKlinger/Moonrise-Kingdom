/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Inicialização
randomize();

// Estados
estado_boss = scr_boss_escolher_estado;
prox_estado_boss = 0;

// Movimentação
hveloc_boss = 0;
vveloc_boss = 0;
veloc_boss = 2; // Velocidade horizontal padrão
veloc_perseg_boss = 3; // Velocidade de perseguição

dest_x_boss = 0;
dest_y_boss = 0;

// Gravidade
gravidade_boss = 0.4; // Força da gravidade
veloc_terminal_boss = 8; // Velocidade máxima de queda

// Agressividade
dist_agressivo_boss = 50;
dist_nao_agressivo_boss = 100;

// Combate
vida_boss = 5;
empurrar_dir_boss = 0;
empurrar_veloc_boss = 0;
hit_boss = false;

// Alarmes
alarm[0] = 1;

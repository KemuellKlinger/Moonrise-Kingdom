/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
randomize();

estado = scr_inimigo_escolher_estado;

prox_estado = 0;

hveloc = 0;
vveloc = 0;
veloc = 0.2;

veloc_perseg = 0.5;

dest_x = 0;
dest_y = 0;

alarm[0] = 1;

dist_agressivo = 10;
dist_nao_agressivo = 100;

//Combate
vida = 10;
empurrar_dir = 0;
empurrar_veloc = 0;
hit = false;

ambiente = rm_batalha_plataforma;
		
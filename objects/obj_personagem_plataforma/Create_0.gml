/// @description Inserir descrição aqui
event_inherited();

velocidade = 1;
forcaPulo = -8;
quant_pulo = 0;
max_pulo = 2;


estado = scr_personagem_andando;



//Combate
max_vida = 10;
vida = max_vida;
empurrar_dir = 0;
tomar_dano = true;

dano = 1;
atacar = false;

dano_alfa = -1;

input_direcaoX = 0; // 0 = parado, -1 = esquerda, 1 = direita


sprite_run = spr_andando_direita;
sprite_idle = spr_personagem_parado_direita;
sprite_wall_jump = spr_personagem_parado_cima;
sprite_jump = spr_personagem_parado_cima;
sprite_double_jump = spr_personagem_parado_cima;
sprite_fall = spr_personagem_parado_baixo;

atacar = false;
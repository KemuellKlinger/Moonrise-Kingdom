/// @description Controle principal do personagem

scr_personagem_colisao();


depth = -y;


//Src_colisao_perfeita();

//Limpa pequenas velocidades residuais (se necessário)

if (abs(vveloc) < 0.1) vveloc = 0;
if (abs(hveloc) < 0.1) hveloc = 0;


//// Executa o estado atual
script_execute(estado);

// Controle de estados
switch (estado) {
    case scr_personagem_andando:
        scr_personagem_andando();
        break;

    case scr_personagem_atacando:
			scr_personagem_atacando();
	        break;

    case scr_personagem_hit:
        scr_personagem_hit();
        break;
}

//// Controle para transição de sala e posicionamento
var distancia = 50;
var boss = obj_boss;

if (distance_to_object(boss) <= distancia) {
    room_goto(rm_batalha_plataforma);
    x = 86;
    y = 276;
	instance_destroy();
}

if vida <=0{
	instance_destroy();
}
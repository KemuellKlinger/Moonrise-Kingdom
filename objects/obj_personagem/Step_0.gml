/// @description Controle principal do personagem

scr_personagem_colisao();


depth = -y;

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
var distancia = 10;
var boss = obj_inimigo_transicao;

if (distance_to_object(boss) <= distancia) {
    room_goto(rm_batalha_plataforma);
    x = 86;
    y = 276;
	instance_destroy();
}

// Verificar se o personagem está se movendo
var is_moving = (hveloc != 0 || vveloc != 0);

if (is_moving) {
	if (room == rm_batalha_plataforma) {
		audio_stop_sound(running_on_concrete);
	}
	else if (!audio_is_playing(running_on_concrete)) {
        audio_play_sound(running_on_concrete, 1, true, 0.8); // Toca o som com o pitch calculado
    }else {
        // Se o som já estiver tocando, ajustar o pitch dinamicamente
        audio_sound_pitch(running_on_concrete, 0.8); // Altera o pitch do som em loop
    }
} else {
    if (audio_is_playing(running_on_concrete)) {
        audio_stop_sound(running_on_concrete); // Para o som
    }
}


if vida <=0{
	instance_destroy();
}
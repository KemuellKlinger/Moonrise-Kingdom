function inputPlayer() {
    var esquerda, direita, pulo, direcaoX;

    // Retorna valor booleano (0 ou 1) para o teclado
    esquerda = keyboard_check(ord("A"));
    direita = keyboard_check(ord("D"));
    pulo = keyboard_check_pressed(vk_space);
	ataque = keyboard_check_pressed(ord("j"));

    // Verifica se o input do teclado ou da seta está ativo
    direcaoX = direita - esquerda; // Teclado
    if (direcaoX == 0) {
        direcaoX = input_direcaoX; // Prioriza input externo (seta)
    }

    var _vel_hori = direcaoX * velocidade;

    // Resto da lógica permanece igual...
    var noChao = place_meeting(x, y + 1, obj_bloco);
    var naParede = place_meeting(x + direcaoX, y, obj_bloco);

    if (direcaoX != 0) {
        image_xscale = direcaoX;
    }

    if (noChao) {
        vel_vest = 0;

        if (direcaoX != 0) {
            sprite_index = sprite_run;
        } else {
            sprite_index = sprite_idle;
        }

        quant_pulo = max_pulo;

        if (pulo) {
            vel_vest = forcaPulo;
            quant_pulo--;
        }
    } else {
        if (pulo && quant_pulo > 0) {
            vel_vest = forcaPulo;
            quant_pulo--;
        }

        vel_vest += gravidade;

        if (quant_pulo == (max_pulo - 1)) {
            sprite_index = sprite_jump;
        } else if ataque{
			estado = "parado";
			vel_hori = 0;
		} else {
            sprite_index = sprite_double_jump;
        }

        if (vel_vest > 0) {
            sprite_index = sprite_fall;
        }

    }

    x += _vel_hori;
    y += vel_vest;
}

inputPlayer();

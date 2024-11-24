// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_personagem_andando() {
    // Verificar teclas de direção
    direita = keyboard_check(ord("D"));
    cima = keyboard_check(ord("W"));
    esquerda = keyboard_check(ord("A"));
    baixo = keyboard_check(ord("S"));

    // Movimentação horizontal e vertical
    hveloc = (direita - esquerda);
    vveloc = (baixo - cima);
    
    // Determinar a direção com base na movimentação
    veloc_dir = point_direction(x, y, x + hveloc, y + vveloc);

    if (hveloc != 0 or vveloc != 0) {
        veloc = 1.2;

        // Atualiza a última direção baseada na movimentação atual
        if direita {
            dir = "direita";
        } else if cima {
            dir = "cima";
        } else if esquerda {
            dir = "esquerda";
        } else if baixo {
            dir = "baixo";
        }
    } else {
        veloc = 0;
    }
    
    hveloc = lengthdir_x(veloc, veloc_dir);
    vveloc = lengthdir_y(veloc, veloc_dir);
	
	script_execute(scr_colisao);

    // Selecionar sprite com base na direção de movimento
    if veloc == 0 {
        // Parado: Selecionar sprites de personagem parado com base na última direção
        switch (dir) {
            case "direita":
                sprite_index = spr_personagem_parado_direita;
                break;
            case "cima":
                sprite_index = spr_personagem_parado_cima;
                break;
            case "esquerda":
                sprite_index = spr_personagem_parado_esquerda;
                break;
            case "baixo":
                sprite_index = spr_personagem_parado_baixo;
                break;
        }
    } else {
        // Movendo: Selecionar sprites de personagem correndo com base na direção atual
        switch (dir) {
            case "direita":
                sprite_index = spr_andando_direita;
                break;
            case "cima":
                sprite_index = spr_andando_cima;
                break;
            case "esquerda":
                sprite_index = spr_andando_esquerda;
                break;
            case "baixo":
                sprite_index = spr_andando_baixo;
                break;
        }
    } 
	
	if mouse_check_button_pressed(mb_left){
		image_index = 0;
		 switch (dir) {
            default:
                sprite_index = spr_personagem_atacando_direita;
                break;
            case  "cima":
                sprite_index = spr_personagem_atacando_cima;
                break;
            case  "esquerda":
                sprite_index = spr_personagem_atacando_esquerda;
                break;
            case "baixo":
                sprite_index = spr_personagem_atacando_baixo;
                break;
        }
		estado = scr_personagem_atacando;
	}
	
	
}

function scr_personagem_atacando(){
	if image_index >= 1{
		if atacar == false{
		 switch (dir) {
            default:
               instance_create_layer(x + 10, y, "Instances", obj_personagem_hitbox); 
               break;
            case "cima":
				instance_create_layer(x, y  - 10, "Instances", obj_personagem_hitbox); 
                break;
            case "esquerda":
                instance_create_layer(x - 10, y, "Instances", obj_personagem_hitbox); 
                break;
            case "baixo":
                 instance_create_layer(x, y  + 10, "Instances", obj_personagem_hitbox); 
                break;
			}
		
		atacar = true;
		}
	}

	if fim_da_animacao(){
		estado = scr_personagem_andando;
		atacar = false;
	}
	
			//estado = scr_personagem_atacando;
}

function scr_personagem_hit(){
	 
	if alarm[0] > 0{
		hveloc = lengthdir_x(3, empurrar_dir);
		vveloc = lengthdir_y(3, empurrar_dir);
	
		scr_colisao();
	}else{
		estado = scr_personagem_andando;
	}

}

//function inputPlayer() {
//	velocidade = 4;
//	forcaPulo = -8;
//	quant_pulo = 0;
//	max_pulo = 2;

//	sprite_run = spr_andando_direita;
//	sprite_idle = spr_personagem_parado_direita;
//	sprite_jump = spr_personagem_parado_cima;
//	sprite_fall = spr_personagem_parado_baixo;

//	moveCheckpoint = false;

//    var esquerda, direita, pulo, direcaoX;    

//    // Retorna valor booleano (0 ou 1)
//    esquerda = keyboard_check(ord("A"));
//    direita = keyboard_check(ord("D"));
//    pulo = keyboard_check_pressed(vk_space);
    
//    // Verifica a direção no eixo X, sendo -1, 0 ou 1
//    direcaoX = direita - esquerda;
//    var _vel_hori = (direita - esquerda) * velocidade;

//    // Verificações de colisão
//    var noChao = place_meeting(x, y + 1, obj_bloco);
//    var naParede = place_meeting(x + direcaoX, y, obj_bloco);   
    
//    // Define a escala da imagem para refletir a direção
//    if direcaoX != 0 {
//        image_xscale = direcaoX;
//    }
    
//    // Controle de movimento no chão
//    if noChao {
//        vel_vest = 0; // Redefine gravidade ao tocar no chão
//        if direcaoX != 0 {
//            sprite_index = sprite_run;
//        } else {
//            sprite_index = sprite_idle;
//        }
//        quant_pulo = max_pulo; // Reseta o contador de pulo duplo
        
//        if pulo {
//            vel_vest = forcaPulo;
//            quant_pulo--;
//        }
//    } else {
//        // Controle de pulo duplo no ar
//        if (pulo && quant_pulo > 0) { // Certifica-se de que quant_pulo seja maior que 0
//            vel_vest = forcaPulo;
//            quant_pulo--;
//        }
        
//        vel_vest += gravidade;
        
//        if quant_pulo == (max_pulo - 1) {
//            sprite_index = sprite_jump;
//        } else {
//            sprite_index = sprite_double_jump;
//        }
        
//        // Animação de queda
//        if vel_vest > 0 {
//            sprite_index = sprite_fall;
//        }

//        // Controle de pulo na parede
//        if naParede {
//            vel_vest = 1; // Reduz a velocidade de queda
//            sprite_index = sprite_wall_jump;
            
//            // Se o jogador pular enquanto está na parede
//            if pulo {
//                vel_vest = forcaPulo;
//                _vel_hori = (20 * direcaoX) * -1; // Inverte a direção horizontal
//                quant_pulo = max_pulo - 1; // Reseta o pulo duplo
//            }
//        }
//    }
 
//    // Suavização do movimento horizontal
//    vel_hori = lerp(vel_hori, _vel_hori, 0.35); 
//}



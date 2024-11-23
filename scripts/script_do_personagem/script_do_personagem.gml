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

	


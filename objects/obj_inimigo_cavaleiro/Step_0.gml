/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var distancia_ativa = 100;
var velocidade = 1;        

// Verificar se o player existe
if (instance_exists(obj_player_plataforma)) {
	
    var dx = obj_player_plataforma.x - x;
    var dy = obj_player_plataforma.y - y;
    var distancia = point_distance(x, y, obj_player_plataforma.x, obj_player_plataforma.y);

  
    if (distancia <= distancia_ativa) {
        var angulo = point_direction(x, y, obj_player_plataforma.x, obj_player_plataforma.y);
        x += lengthdir_x(velocidade, angulo);
        y += lengthdir_y(velocidade, angulo);

        if (dx > 0) {
            image_xscale = 1; // Direita
			
        } else if (dx < 0) {
            image_xscale = -1; // Esquerda
        }
    }
}


var chao = place_meeting(x, y +1, obj_bloco);

if(!chao){
	velv += GRAVIDADE * massa;
}

switch(estado){
	case "parado":{
		
		velh = 0;
		timer_estado++;
		
		if(sprite_index != spr_inimigo_cavaleiro_parado){
			image_index = 0;
		}
		sprite_index = spr_inimigo_cavaleiro_parado;
		
		if(position_meeting(mouse_x, mouse_y, self)){
			if(mouse_check_button_pressed(mb_right)){
				estado = "hit";
			}
		}
		if(irandom(timer_estado) > 300){
			estado = choose("walk","parado","walk");
			timer_estado = 0;
		}
		ataca_player_plataforma(obj_player_plataforma, dist, xscale);
	
		
		break;
	}
	
		case "walk":{
			
		timer_estado++;
		if(sprite_index != spr_inimigo_cavaleiro_andando){
			image_index = 0;
			velh = choose(1, -1);
		}
		
		sprite_index = spr_inimigo_cavaleiro_andando;
		
		if(irandom(timer_estado ) > 300){
			estado = choose("parado","parado","walk");
			timer_estado = 0;
		}
		ataca_player_plataforma(obj_player_plataforma, dist, xscale);
		break;
	}
	
	case "attack":{
		velh = 0;
		if(sprite_index != spr_inimigo_cavaleiro_ataque2){
			image_index = 0;
			posso = true;
		}
		
		sprite_index = spr_inimigo_cavaleiro_ataque2;
		
		if (image_index > image_number - 1){
			estado = "parado";
			posso = true;
			if(dano){
				instance_destroy(dano, false);
				dano = noone;
			}
		}
			
		//Criando o dano
		
		if (image_index >= 2 && dano == noone && image_index <= 4 && posso){
			dano = instance_create_layer(x + sprite_width/4, y - sprite_height /4, layer, obj_dano);
			dano.dano = ataque;
			dano.pai = id;
			posso = false;
			if(obj_player_plataforma.vida_atual > 0){
				obj_player_plataforma.estado = "hit";
			obj_player_plataforma.vida_atual -= ataque;
			}else{
				estado = "parado";
			}
			
		}
		
		if(dano != noone && image_index >= 4 && image_index <=8){
			instance_destroy(dano);
			dano = noone;
		}
		

		break;
	}
	
	case "hit":{
		
		if(sprite_index != spr_inimigo_cavaleiro_hit){
			image_index = 0;
		
		}
		sprite_index = spr_inimigo_cavaleiro_hit;
		
		if(vida_atual > 0){
			if(	image_index > image_number - 1){
				estado ="parado";
			}
		}		
		else{
			if(image_index >= 3){
				estado = "morto";
			}
		}
		break;
	}
	
	case "morto":{
		if(sprite_index != spr_inimigo_cavaleiro_morrendo){
		image_index = 0;
			
		}
		sprite_index = spr_inimigo_cavaleiro_morrendo
		
		if(image_index > image_number -1){
			image_speed = 0;
			image_alpha -= .01
			
			if(image_alpha <= 0) instance_destroy();
			
		}
		
		
	}
}
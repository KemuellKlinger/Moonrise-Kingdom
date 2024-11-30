/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var chao = place_meeting(x, y +1, obj_bloco);

if(!chao){
	velv += GRAVIDADE * massa;
}

//if(mouse_check_button_pressed(mb_right)){
//	estado = "attack";
//}

//Diferente mais igual, NÂO MEXA!!!!!
//scr_ataque_player_plataforma(obj_player_plataforma, dist, xscale);



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
		if(sprite_index != spr_inimigo_cavaleiro_atacando){
			image_index = 0;
		}
		
		sprite_index = spr_inimigo_cavaleiro_atacando;
		
		if (image_index > image_number - 1){
			estado = "parado";
		}
		break;
	}
	
	case "hit":{
		
		if(sprite_index != spr_inimigo_cavaleiro_hit){
			image_index = 0;
			//vida_atual--;
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
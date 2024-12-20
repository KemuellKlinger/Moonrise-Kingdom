/// @description Movimentação

var right, left, jump, attack;
var chao = place_meeting(x, y + 1 , obj_bloco);


right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(ord("K"));
attack = keyboard_check(ord("L"))

if(ataque_buffer > 0){
	ataque_buffer -= 5;
}

velh = (right - left) * max_velh;

//gravidade

if(!chao){
	if(velv < max_velv * 2){
		velv += GRAVIDADE * massa; 
	}

}


//maquinas de estados

 switch (estado) {
	 
	 #region parado
	case "parado":{
				
		sprite_index = spr_personagem_parado_direita;
				
		if(right || left){
			estado = "movendo"; 
				
		}else if(jump || velv != 0){
			estado = "pulando";
			velv = (-max_velv * jump);
			image_index = 0
		}else if (attack){
			estado = "ataque";
			velh = 0;
			image_index = 0
		}
		break;
	}
	
	#endregion
	

	
	#region ataque
			
	case "ataque":{
		velh = 0;
		
		if(combo == 0){
			sprite_index = spr_personagem_atacando_direita;
		}else if(combo == 1){
			sprite_index = spr_personagem_atacando_baixo;
			
		}else if(combo == 2){
			sprite_index = spr_personagem_atacando_cima;
		}
		
		if(image_index >= 2 && dano == noone && posso){
			dano = instance_create_layer(x + sprite_width/2, y- sprite_height/2, layer, obj_dano);
			dano.dano = ataque *ataque_mult;
			dano.pai = id;
			posso = false;
		}
		
		if(attack && combo < 2){
			ataque_buffer = room_speed;
		}
		
		if(ataque_buffer && combo < 2 && image_index >= image_number-1){
			combo ++;
			image_index = 0;
			posso = true;
			ataque_mult += .5;
			
			if(dano){
				instance_destroy(dano, false);
				dano = noone;
			}
			
			ataque_buffer = 0;
		}
		
		if(image_index > image_number - 1){
			estado = "parado";
			velh = 0;
			combo = 0;
			posso = true;
			ataque_mult = 1;
			
			if(dano){
				instance_destroy(dano, false);
				dano = noone;
			}
		}
		
		
		if(velv != 0){
			estado = "pulando";			
			image_index = 0
		}
	}break;
	
	#endregion	
			
	#region movendo
	case "movendo": {
		sprite_index = spr_andando_direita;
				
		if(abs(velh) < .1){
			estado = "parado";
			velh = 0;
		}else if(jump || velv != 0){
			estado = "pulando";
			velv = (-max_velv * jump);
			image_index = 0
		}else if(attack){
			estado = "ataque";
			velh = 0;
			image_index = 0
		}
				
		break;
				
		}
		
		#endregion
				
	#region pulando
	case "pulando":{
				
		if(velv > 0){
			sprite_index = spr_andando_baixo;
		}else{
			sprite_index = spr_andando_cima;
					
			if(image_index >= image_number - 1){
						
				image_index = image_number - 1
			}
		}
				
		if(chao){
			estado = "parado";
			velh = 0;
		}
		
		break;
	}

	#endregion     
	}

// Verificar se o personagem está se movendo
var is_moving = (right != 0 || left != 0);

if (is_moving) {
	if (!audio_is_playing(running_on_concrete)) {
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
if(keyboard_check(vk_enter)) room_restart();
	
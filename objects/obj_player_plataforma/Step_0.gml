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
		
		//Criando dano do player
		if(image_index >= 2 && dano == noone && posso){
			dano = instance_create_layer(x + sprite_width/2, y- sprite_height/2, layer, obj_dano);
			dano.dano = ataque * ataque_mult;
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
	
	case "hit":{
		
		if(sprite_index != spr_personagem_hit){
			image_index = 0;
			
		}
		sprite_index = spr_personagem_hit;
		
		if(vida_atual > 0){
			if(	image_index > image_number - 1){
				estado ="parado";
			}
		}		
		else{
			if(vida_atual <=0){
				estado = "morto";
			}
		}
		break;
	}
	case "morto":{
		if(sprite_index != spr_inimigo_cavaleiro_morrendo){
		image_index = 0;
		obj_inimigo_cavaleiro.estado = "parado";
		}
		sprite_index = spr_inimigo_cavaleiro_morrendo
		
		if(image_index > image_number -1){
			image_speed = 0;
			image_alpha -= .01
			
			if(image_alpha <= 0 and vida_atual <=0) {
				instance_destroy();
				
				
			}
				
		}
		
		
	}
	
	//Estado padrão	
	//default: 
	//	estado = "parado";
          
	}
		
if(keyboard_check(vk_enter)) room_restart();
	
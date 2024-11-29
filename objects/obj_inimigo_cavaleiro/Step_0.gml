/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var chao = place_meeting(x, y +1, obj_bloco);

if(!chao){
	velv += GRAVIDADE * massa;
}

switch(estado){
	case "parado":{
		
		if(sprite_index != spr_inimigo_cavaleiro_parado){
			image_index = 0;
		}
		sprite_index = spr_inimigo_cavaleiro_parado;
		
		if(position_meeting(mouse_x, mouse_y, self)){
			if(mouse_check_button_pressed(mb_right)){
				estado = "hit";
			}
		}
		
		break;
	}
	
	case "hit":{
		
		if(sprite_index != spr_inimigo_cavaleiro_hit){
			image_index = 0;
		}
		sprite_index = spr_inimigo_cavaleiro_hit;
		
		if(image_index > image_number -1){
			estado = "parado";
		}
		
		break;
	}
}
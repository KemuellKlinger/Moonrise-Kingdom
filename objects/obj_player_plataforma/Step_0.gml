/// @description Movimentação

var right, left, jump, attack;
var chao = place_meeting(x, y + 1 , obj_bloco);


right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(ord("K"));

velh = (right - left) * max_velh;

//gravidade

if(!chao){
	if(velv < max_velv * 2){
		velv += GRAVIDADE * massa; 
	}

}else{
	if(jump){
		velv -= max_velv
	}
}


//maquinas de estados

 switch (estado) {
            case "parado":{
				
				sprite_index = spr_personagem_parado_direita;
				
				if(right || left){
					estado = "movendo"; 
				
					}
				}break;
			
            case "movendo": {
				sprite_index = spr_andando_direita;
				
				if(abs(velh) < .1){
					estado = "parado";
					velh = 0;
				}
				
				} break;
          
        }


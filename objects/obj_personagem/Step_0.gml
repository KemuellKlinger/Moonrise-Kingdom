/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//movimentação

direita = keyboard_check(ord("D"));
cima = keyboard_check(ord("W"));

esquerda = keyboard_check(ord("A"));
baixo = keyboard_check(ord("S"));

hveloc = (direita - esquerda) * veloc;
colisaoX = place_meeting(x + hveloc, y, obj_bloco);
if colisaoX{
	while !place_meeting(x + sign(hveloc), y, obj_bloco){
		x += sign(hveloc);
	}
	hveloc = 0;
}

x += hveloc;

vveloc = (baixo - cima) * veloc;

colisaoY = place_meeting(x, y + vveloc, obj_bloco);

if colisaoY{
	while !place_meeting(x , y + sign(vveloc), obj_bloco){
		y += sign(vveloc);
	}
	vveloc = 0;
}

y += vveloc;

//mudar sprints

dir = floor((point_direction(x, y, mouse_x, mouse_y)+ 45) / 90);

if hveloc == 0 and vveloc == 0{
	switch dir {
	default:
		sprite_index = spr_personagem_parado_direita;
	break;
	case 1:
		sprite_index = spr_personagem_parado_cima;
		
	break;
	case 2:
		sprite_index = spr_personagem_parado_esquerda;
	
	break;
	case 3:
		sprite_index = spr_personagem_parado_baixo;
	
	break;
	}
	
}else{
	switch dir {
	default:
		sprite_index = spr_andando_direita;
	break;
	case 1:
		sprite_index = spr_andando_cima;
		
	break;
	case 2:
		sprite_index = spr_andando_esquerda;
	
	break;
	case 3:
		sprite_index = spr_andando_baixo;
	
	break;
	
	}

}




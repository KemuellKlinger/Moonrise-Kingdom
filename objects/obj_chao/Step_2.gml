//Controlador de colisao

var colx, coly;

colx = instance_place(x+vel_hori, y, obj_bloco); //verifica colisao no eixo x
coly = instance_place(x, y + vel_vest, obj_bloco);//verifica colisao no eixo y

if colx{
	//Colisao a direita (vel_hori é positivo)
	if vel_hori > 0{
		x = colx.bbox_left + (x - bbox_right );
		
	}
	//Colisao a esquerda (vel_hori é negativo)
	else if vel_hori < 0{
	x = colx.bbox_right + (x - bbox_left);
		
	}
	vel_hori = 0;
}
if coly{
	//Colisao a direita
	if vel_vest > 0{
		y = coly.bbox_top+ (y - bbox_bottom);
	}
	//Colisao a esquerda
	if vel_vest < 0{
		y = coly.bbox_bottom + (y - bbox_top);
	}
	vel_vest=0;	
}

x += vel_hori;
y += vel_vest;



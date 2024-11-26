//Controlador de colisao

var _colx, _coly;

_colx = instance_place(x+vel_hori, y, obj_bloco); //verifica colisao no eixo x
_coly = instance_place(x, y + vel_vest, obj_bloco);//verifica colisao no eixo y

if _colx{
	//Colisao a direita (vel_hori é positivo)
	if vel_hori > 0{
		x = _colx.bbox_left + (x - bbox_right );
		
	}
	//Colisao a esquerda (vel_hori é negativo)
	else if vel_hori < 0{
	x = _colx.bbox_right + (x - bbox_left);
		
	}
	vel_hori = 0;
}
if _coly{
	//Colisao a direita
	if vel_vest > 0{
		y = _coly.bbox_top+ (y - bbox_bottom);
	}
	//Colisao a esquerda
	if vel_vest < 0{
		y = _coly.bbox_bottom + (y - bbox_top);
	}
	vel_vest=0;	
}

x += vel_hori;
y += vel_vest;



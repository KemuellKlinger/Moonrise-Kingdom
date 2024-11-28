/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _velh = sign(velh);
var _velv = sign(velv);

repeat(abs(velh)){
	if(place_meeting(x + _velh, y, obj_bloco)){
		velh = 0;
		break;
	}
	x += velh;
}

//Vertical

repeat(abs(velv)){
	if(place_meeting(x, y + _velv, obj_bloco)){
		velv = 0;
		break;
	}
	y += _velv
}
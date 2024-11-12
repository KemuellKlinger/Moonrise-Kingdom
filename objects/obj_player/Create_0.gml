/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

velocidade = 5;
gravidade = 0.3;

forca_pulo = -7;

function input_player(){
	var _left, _right, _jump;
	
	_left = keyboard_check(vk_left);
	_right = keyboard_check(vk_right);
	_jump = keyboard_check(vk_space);
	
	velh = (_right - _left) *velocidade;
	
	var _no_chao = place_meeting(x, y + 1, obj_bloco);
	
	if(_no_chao){
		if(_jump){
			velv = forca_pulo;
		}
	}
	else{
		velv += gravidade;
	}

}
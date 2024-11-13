/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

velocidade = 5;
gravidade = 0.45;

forca_pulo = -9;

function input_player(){
	var _left, _right, _jump;
	
	_left = keyboard_check(vk_left);
	_right = keyboard_check(vk_right);
	_jump = keyboard_check(vk_space);
	
	velh = (_right - _left) * velocidade;
	
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

// Identifique o tilemap do chão e armazene seu ID
tilemap_id = layer_tilemap_get_id("Tiles_Terra"); // Substitua pelo nome exato da camada de tile

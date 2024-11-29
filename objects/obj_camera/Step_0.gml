if(instance_exists(obj_personagem)){
	var _alvo = obj_personagem;
	
	x = lerp(x, _alvo.x, 0.05);
	y = lerp(y, _alvo.y, 0.05);

}

camera_set_view_border(view_camera[0], 390, 220){

}


if(instance_exists(obj_player_plataforma)){
	var _alvo = obj_player_plataforma;
	
	x = lerp(x, _alvo.x, 0.05);
	y = lerp(y, _alvo.y, 0.05);

}

camera_set_view_border(view_camera[0], 390, 220){

}
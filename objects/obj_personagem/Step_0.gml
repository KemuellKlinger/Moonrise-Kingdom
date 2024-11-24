/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

script_execute(estado);

//depth = -y;
	
dest_x = obj_personagem.x;
dest_y = obj_personagem.y;
	
//var _dir = point_direction(x, y, dest_x, dest_y);
//hveloc = lengthdir_x(veloc_perseg, _dir);
//vveloc = lengthdir_y(veloc_perseg, _dir);

var distancia = 100;
var boss = obj_boss;

if distance_to_object(boss) <= distancia{
	room_goto(rm_batalha_plataforma);
	x = 86;
	y = 276;
}


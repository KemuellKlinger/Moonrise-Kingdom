/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(obj_menu.index == 0){
	room_goto_next()
}else if(obj_menu.index == 1){

}else if(obj_menu.index == 2){
	room_goto(RoomConfig);
}else if(obj_menu.index == 3) {
	room_goto(RoomCreditos);
}
else if(obj_menu.index == 4){
	game_end();
}

/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(obj_pause.index_pause == 0){
	room_goto(Room1);
}else if(obj_pause.index_pause == 1){
	room_goto(RoomConfig);
}else if(obj_pause.index_pause == 2){
	room_goto(RoomMenu);
}else if(obj_pause.index_pause == 3){
	game_end();
}

// Tocar som do menu
audio_play_sound(menu_button_user_interface_pack, 1, false);
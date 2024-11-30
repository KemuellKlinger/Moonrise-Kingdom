/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
obj_pause.index_pause--;

if(obj_pause.index_pause<= 0){
	obj_pause.index_pause = 0;
}

// Tocar som do menu
audio_play_sound(menu_button_user_interface_pack, 1, false);
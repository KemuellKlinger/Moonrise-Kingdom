/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

obj_menu.index++;

if(obj_menu.index >= obj_menu.op_maxima){
	obj_menu.index = obj_menu.op_maxima-1;
}

// Tocar som do menu
	audio_play_sound(menu_button_user_interface_pack, 1, false);
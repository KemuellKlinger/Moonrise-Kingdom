/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (index_pause == 0) {
	 if (global.sala_anterior != noone) {
        room_goto(global.sala_anterior);
    }
} else if (index_pause == 1) {
	room_goto(RoomConfig);
} else if (index_pause == 2) {
   game_restart();
} else if (index_pause == 3) {
    // Sai do jogo
    game_end();
}




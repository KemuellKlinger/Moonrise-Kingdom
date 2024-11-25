/// @description Inserir descrição aqui
// Verifica se a tecla ESC foi pressionada
var key_pause = keyboard_check_pressed(vk_escape);

if (key_pause) {
    if (room != RoomPause) {  // Se não estamos na sala de pausa
        if (instance_exists(obj_personagem)) {  // Verifica se o personagem existe
            obj_personagem.persistent = false;  // Torna o personagem não persistente (opcional)
            isPause = true;  // Marca que o jogo está em pausa
            instance_activate_all();  // Ativa todos os objetos na sala
        }
        room_previous(room);  // Guarda a sala anterior
        room_goto(RoomPause);  // Vai para a sala de pausa
    } else {  // Se já estamos na sala de pausa
        room_goto_previous();  // Volta para a sala anterior
        instance_deactivate_all(true);  // Desativa todas as instâncias (opcional)
    }
}

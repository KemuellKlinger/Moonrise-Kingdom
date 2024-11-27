/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// @description Gerenciar transição da introdução
if (fade_in) {
    if (alpha < 1) {
        alpha += fade_speed;        // Fade-in da imagem
        text_alpha += fade_speed;  // Fade-in do texto
    } else {
        fade_in = false;
        fade_out = true; // Iniciar o fade-out
    }
} else if (fade_out) {
    if (alpha > 0) {
        alpha -= fade_speed;        // Fade-out da imagem
        text_alpha -= fade_speed;  // Fade-out do texto
    } else {
        instance_destroy();
        room_goto(RoomMenu); // Trocar para o menu principal
    }
}

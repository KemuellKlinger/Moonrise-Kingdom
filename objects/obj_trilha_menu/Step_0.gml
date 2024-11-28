// Incrementa o volume gradativamente
if (fade_volume < 1) { // 1 é o volume máximo
    fade_volume += fade_speed;
    audio_sound_gain(musica_menu, fade_volume, 0); // Atualiza o volume
}

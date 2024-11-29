// Inicializa o som no volume 0
audio_play_sound(musica_menu, 10, true);
audio_sound_gain(musica_menu, 0, 0); // Volume inicial a 0
fade_volume = 0; // Controle do volume
fade_speed = 0.01; // Velocidade do fade-in (ajuste conforme necessário)
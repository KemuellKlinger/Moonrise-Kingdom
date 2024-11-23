depth = -1000;

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var player = instance_find(obj_personagem, 0);

if (player != noone) {
    // Configurações da barra de vida
    var bar_width = 100; // Largura da barra
    var bar_height = 10; // Altura da barra
    var bar_x = cam_x + 5; // Posição X fixa na tela
    var bar_y = cam_y + 5; // Posição Y fixa na tela

    // Desenha a barra de fundo
    draw_set_color(c_black);
    draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

    // Desenha a barra de vida proporcional
    draw_set_color(c_red);
    draw_rectangle(bar_x, bar_y, bar_x + (player.vida / player.max_vida) * bar_width, bar_y + bar_height, false);

    // Opcional: Desenha o texto da vida por cima da barra com escala reduzida
    draw_set_color(c_white);
    draw_text_transformed(bar_x + bar_width / 2, bar_y + bar_height / 2, 
        string(player.vida) + "/" + string(player.max_vida), 
        0.5, 0.5, 0); // Escala reduzida (50% do tamanho original)
}

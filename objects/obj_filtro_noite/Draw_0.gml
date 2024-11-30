/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Define a cor e o nível de transparência do filtro
if (room == Room1) {
	depth = -1600; // O objeto será desenhado acima dos tiles.
}else if (room == Room2) {
	depth = -1800;
}else if (room == Room3) {
	depth = -1100;	
}else if (room == rm_batalha_plataforma) {
	depth = -600;
}
var cor_filtro = make_color_rgb(0, 0, 64); // Azul escuro
var transparencia = 92; // Transparência (0-255)

// Desenha um retângulo cobrindo a tela inteira
draw_set_alpha(transparencia / 255); // Ajusta a opacidade
draw_set_color(cor_filtro);         // Define a cor do filtro
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// Restaura configurações padrão
draw_set_alpha(1);
draw_set_color(c_white);

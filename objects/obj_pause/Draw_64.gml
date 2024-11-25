/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_set_font(ft_menu);

var _dist = 40;

var _largura = display_get_gui_width();
var _altura =  display_get_gui_height();
var _x1 = _largura /2;
var _y1 = _altura /2;

for(var cont = 0; cont < op_maxima_pause; cont++){
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	if(index_pause == cont){
		draw_set_color(c_yellow);
	}else{
		draw_set_color(c_white);
	}
	draw_text(_x1 + 10, _y1 + 55 + (_dist * cont), opcoes_pause[cont])
} 

draw_set_font(-1);

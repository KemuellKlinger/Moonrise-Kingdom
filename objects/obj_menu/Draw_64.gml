/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_set_font(ft_menu);

var dist = 50;

var largura = display_get_gui_width();
var altura =  display_get_gui_height();
var x1 = largura /2;
var y1 = altura /2;

for(var cont = 0; cont < op_maxima; cont++){
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	if(index == cont){
		draw_set_color(c_yellow);
	}else{
		draw_set_color(c_white);
	}
	draw_text(x1,y1 + (dist * cont), opcoes[cont])

} 



draw_set_font(-1);

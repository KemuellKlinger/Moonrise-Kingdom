/// @description Desenhar

if hit == true{
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite(spr_personagem_sombra, 0, x, y+5);
	draw_self();
	gpu_set_fog(false, c_white, 0, 0);

}else{
	draw_sprite(spr_personagem_sombra, 0, x, y+1);
	draw_self();
}
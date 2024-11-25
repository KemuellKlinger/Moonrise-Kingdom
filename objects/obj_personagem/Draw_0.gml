/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor 

draw_sprite(spr_personagem_sombra,0, x, y + 0.8);
draw_self();

if(alarm[1] > 0){
	if(image_alpha >= 1){
		dano_alfa = -0.05;
	}else if(image_alpha <= 0){
		dano_alfa = 0.1;
	}
	image_alpha += dano_alfa;
}else{
	image_alpha = 1;
}
/// @description Desenhar a introdução

// Desenhar a imagem centralizada com fade
draw_set_alpha(alpha);
draw_sprite_ext(spr_logo, 0, image_x, image_y, 1, 1, 0, c_white, alpha);
draw_set_alpha(1);

// Configurar estilo do texto
draw_set_font(ft_menu); // Fonte padrão ou altere para uma fonte personalizada
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);

// Desenhar o texto com fade
draw_set_alpha(text_alpha);
draw_text_transformed(room_width / 2, text_y, text, text_size / 24, text_size / 24, 0);
draw_set_alpha(1);

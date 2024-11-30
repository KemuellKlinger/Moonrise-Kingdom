// Limpar o fundo com uma cor sólida
draw_clear(c_black);

// Definir cor e alinhamento do texto
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(ft_menu);

if (estado == "creditos") {
    // Desenha os créditos
    draw_text(room_width / 2, posicao_y, texto_creditos);
}
else if (estado == "agradecimentos" || estado == "fadeout") {
    // Aplica a opacidade ao texto dos agradecimentos
    draw_set_alpha(opacidade);
    draw_text(room_width / 2, room_height / 2 - string_height(texto_agradecimentos) / 2, texto_agradecimentos);
    draw_set_alpha(1); // Restaura a opacidade padrão
}

// Instrução para sair (aparece durante os agradecimentos)
if (estado == "agradecimentos" || estado == "fadeout") {
    draw_set_alpha(opacidade);
    draw_text(room_width / 2, room_height - 50, "Pressione ESC para voltar ao menu.");
    draw_set_alpha(1);
}

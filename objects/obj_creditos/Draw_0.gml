// Limpar o fundo com uma cor sólida
draw_clear(c_black); // Cor preta de fundo

// Definir cor e alinhamento do texto
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top); // O texto começará a partir do topo

// Texto dos créditos
texto_creditos = 
    "Jogo criado por:\n" +
    "Infinity Games\n\n" +
    "Design e Arte:\n" +
    "João Victor dos Reis\n\n" +
    "Programação:\n" +
    "Naum Leal e Kemuell Klinger\n\n" +
    "Obrigado por jogar!";

// Desenhar texto em posição variável
draw_text(room_width / 2, posicao_y, texto_creditos);

// Instrução para sair
draw_text(room_width / 2, room_height - 50, "Pressione ESC para voltar ao menu.");

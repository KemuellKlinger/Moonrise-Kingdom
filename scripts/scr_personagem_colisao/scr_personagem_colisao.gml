function scr_personagem_colisao() {
    // Movimentação horizontal com deslizamento
    if (place_meeting(x + hveloc, y, obj_bloco)) {
        while (!place_meeting(x + sign(hveloc), y, obj_bloco) ) {
            x += sign(hveloc );
        }
        hveloc = 0; // Zera o movimento horizontal, mas mantém o vertical
    } 
        x += hveloc;

    // Movimentação vertical com deslizamento
    if (place_meeting(x, y + vveloc, obj_bloco)) {
        while (!place_meeting(x, y + sign(vveloc), obj_bloco)) {
            y += sign(vveloc );
        }
        vveloc = 0; // Zera o movimento vertical, mas mantém o horizontal    
    }
	y += vveloc;
	
	
}
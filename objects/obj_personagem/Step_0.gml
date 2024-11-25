/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//script_execute(estado);

//depth = -y;
	
dest_x = obj_personagem.x;
dest_y = obj_personagem.y;
	
var distancia = 100;
var boss = obj_boss;

if distance_to_object(boss) <= distancia{
	room_goto(rm_batalha_plataforma);
	x = 86;
	y = 276;
}

// Movimentação básica
x += hveloc;
y += vveloc;

// Definir direção para animação (baseado em hveloc e vveloc)
if (hveloc != 0 || vveloc != 0) {
    var veloc_dir = point_direction(0, 0, hveloc, vveloc);
    if (abs(hveloc) > abs(vveloc)) {
        if (hveloc > 0) dir = "direita";
        else dir = "esquerda";
    } else {
        if (vveloc > 0) dir = "baixo";
        else dir = "cima";
    }
}

// Selecionar o sprite de acordo com a direção e estado
if (hveloc == 0 && vveloc == 0) {
    // Parado
    switch (dir) {
        case "direita": sprite_index = spr_personagem_parado_direita; break;
        case "cima": sprite_index = spr_personagem_parado_cima; break;
        case "esquerda": sprite_index = spr_personagem_parado_esquerda; break;
        case "baixo": sprite_index = spr_personagem_parado_baixo; break;
    }
} else {
    // Andando
    switch (dir) {
        case "direita": sprite_index = spr_andando_direita; break;
        case "cima": sprite_index = spr_andando_cima; break;
        case "esquerda": sprite_index = spr_andando_esquerda; break;
        case "baixo": sprite_index = spr_andando_baixo; break;
    }
}



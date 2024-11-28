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

// Definir camadas de tiles para cada sala
var tile_layers_room1 = ["Tiles_Arvores_Tronco", "Tiles_Casas_Frente", "Tiles_Decoracao_Frente"];
var tile_layers_room2 = ["Tiles_Arvores_Tronco", "Tiles_Casas_Frente", "Tiles_Castle_Frente", "Tiles_Decoracao_Frente"];
var tile_layers_room3 = ["Tiles_Objetos_Frente", "Tiles_Parede_Frente"];

// Obter o nome da sala atual
var current_room = room;

// Selecionar camadas de tiles baseadas na sala atual
var tile_layers;
switch (current_room) {
    case Room1: // Certifique-se de que 'rm_room1' é o nome correto da sala
        tile_layers = tile_layers_room1;
        break;
    case Room2: // Certifique-se de que 'rm_room2' é o nome correto da sala
        tile_layers = tile_layers_room2;
        break;
    case Room3: // Certifique-se de que 'rm_room3' é o nome correto da sala
        tile_layers = tile_layers_room3;
        break;
    default:
        tile_layers = [];
        break;
}

// Obter a posição Y do personagem
var personagem_y = y;

// Separar as camadas em duas listas: acima e abaixo do personagem
var above_layers = [];
var below_layers = [];

// Classificar camadas com base na profundidade
for (var i = 0; i < array_length_1d(tile_layers); i++) {
    var tile_layer_id = layer_get_id(tile_layers[i]);
    var tilemap_id = layer_tilemap_get_id(tile_layer_id);

    // Adicionar a camada à lista apropriada com base na profundidade
    if (layer_get_depth(tile_layer_id) < depth) {
        array_push(below_layers, tilemap_id);
    } else {
        array_push(above_layers, tilemap_id);
    }
}

// Desenhar as camadas abaixo do personagem
for (var i = 0; i < array_length_1d(below_layers); i++) {
    draw_tilemap(array_get(below_layers, i), 0, 0);
}

// Desenhar o personagem
draw_self();

// Desenhar as camadas acima do personagem
for (var i = 0; i < array_length_1d(above_layers); i++) {
    draw_tilemap(array_get(above_layers, i), 0, 0);
}

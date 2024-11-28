/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
hveloc = 0;
vveloc = 0;
dir = "baixo"; // Direção inicial

estado = scr_personagem_andando;

//Combate
max_vida = 20;
vida = max_vida;
empurrar_dir = 0;
tomar_dano = true;

dano = 1;
atacar = false;

dano_alfa = -1;

// Definir camadas de tiles específicas para a room atual
if (room == Room1) {
    tile_layers = ["Tiles_Arvores_Tronco"];
} else if (room == Room2) {
    tile_layers = ["Tiles_Arvores_Tronco", "Tiles_Casas_Frente", "Tiles_Castle_Frente", "Tiles_Decoracao_Frente"];
} else if (room == Room3) {
    tile_layers = ["Tiles_Objetos_Frente", "Tiles_Parede_Frente"];
}
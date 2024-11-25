/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

script_execute(estado);

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

// Controle de movimentação (usando hveloc e vveloc)
x += hveloc;
y += vveloc;

// Controle de estados
switch (estado) {
    case scr_personagem_andando:
        scr_personagem_andando();
        break;

    case scr_personagem_atacando:
        scr_personagem_atacando();
        break;

    case scr_personagem_hit:
        scr_personagem_hit();
        break;
}




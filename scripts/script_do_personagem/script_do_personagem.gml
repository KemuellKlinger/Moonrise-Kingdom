// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_personagem_andando() {
    // Verificar teclas de direção
    direita = keyboard_check(ord("D"));
    cima = keyboard_check(ord("W"));
    esquerda = keyboard_check(ord("A"));
    baixo = keyboard_check(ord("S"));

    // Movimentação horizontal e vertical
    hveloc = (direita - esquerda);
    vveloc = (baixo - cima);
    
    // Determinar a direção com base na movimentação
    veloc_dir = point_direction(x, y, x + hveloc, y + vveloc);

    if (hveloc != 0 || vveloc != 0) {
        veloc = 2;

        // Atualiza a última direção baseada na movimentação atual
        if direita {
            dir = "direita";
        } else if cima {
            dir = "cima";
        } else if esquerda {
            dir = "esquerda";
        } else if baixo {
            dir = "baixo";
        }
    } else {
        veloc = 0;
    }
    
    hveloc = lengthdir_x(veloc, veloc_dir);
    vveloc = lengthdir_y(veloc, veloc_dir);

    // Selecionar sprite com base na direção de movimento
    if veloc == 0 {
        // Parado: Selecionar sprites de personagem parado com base na última direção
        switch (dir) {
            case "direita":
                sprite_index = spr_personagem_parado_direita;
                break;
            case "cima":
                sprite_index = spr_personagem_parado_cima;
                break;
            case "esquerda":
                sprite_index = spr_personagem_parado_esquerda;
                break;
            case "baixo":
                sprite_index = spr_personagem_parado_baixo;
                break;
        }
    } else {
        // Movendo: Selecionar sprites de personagem correndo com base na direção atual
        switch (dir) {
            case "direita":
                sprite_index = spr_personagem_correndo_direita;
                break;
            case "cima":
                sprite_index = spr_personagem_correndo_cima;
                break;
            case "esquerda":
                sprite_index = spr_personagem_correndo_esquerda;
                break;
            case "baixo":
                sprite_index = spr_personagem_correndo_baixo;
                break;
        }
    }

    // Atualizar posição do personagem
    x += hveloc;
    y += vveloc;
}
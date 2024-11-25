function scr_personagem_andando() {
    // Determina a direção do movimento
    var _hveloc = hveloc;
    var _vveloc = vveloc;
    
    // Verifica a colisão horizontal antes de mover
    if (!place_meeting(x + _hveloc, y, obj_bloco)) {
        x += _hveloc; // Move normalmente se não houver colisão
    } else {
        // Se houver colisão, ajusta a posição para não atravessar o bloco
        while (!place_meeting(x + sign(_hveloc), y, obj_bloco)) {
            x += sign(_hveloc);
        }
        _hveloc = 0; // Impede movimento horizontal ao bater no bloco
    }

    // Verifica a colisão vertical antes de mover
    if (!place_meeting(x, y + _vveloc, obj_bloco)) {
        y += _vveloc; // Move normalmente se não houver colisão
    } else {
        // Se houver colisão, ajusta a posição para não atravessar o bloco
        while (!place_meeting(x, y + sign(_vveloc), obj_bloco)) {
            y += sign(_vveloc);
        }
        _vveloc = 0; // Impede movimento vertical ao bater no bloco
    }

    // Determina a direção com base no movimento
    if (_hveloc != 0 || _vveloc != 0) {
        var veloc_dir = point_direction(0, 0, _hveloc, _vveloc);
        if (abs(_hveloc) > abs(_vveloc)) {
            dir = (_hveloc > 0) ? "direita" : "esquerda";
        } else {
            dir = (_vveloc > 0) ? "baixo" : "cima";
        }
    }

    // Animação de movimento ou parada
    if (_hveloc == 0 && _vveloc == 0) {
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

    // Verifica ataque, desativa se joystick está sendo usado
    if (!mouse_check_button_pressed(mb_left) && (_hveloc != 0 || _vveloc != 0)) {
        return; // Se o joystick está sendo usado, não faz o ataque
    }

    if (mouse_check_button_pressed(mb_left)) {
        image_index = 0; // Reinicia a animação
        switch (dir) {
            case "direita": sprite_index = spr_personagem_atacando_direita; break;
            case "cima": sprite_index = spr_personagem_atacando_cima; break;
            case "esquerda": sprite_index = spr_personagem_atacando_esquerda; break;
            case "baixo": sprite_index = spr_personagem_atacando_baixo; break;
        }
        estado = scr_personagem_atacando; // Troca para o estado de ataque
    }
}

//function scr_colisao() {
//    // Verifica colisão horizontal
//    if (place_meeting(x + hveloc, y, obj_bloco)) {
//        while (!place_meeting(x + sign(hveloc), y, obj_bloco)) {
//            x += sign(hveloc);
//        }
//        hveloc = 0; // Impede movimento horizontal
//    }
    
//    // Verifica colisão vertical
//    if (place_meeting(x, y + vveloc, obj_bloco)) {
//        while (!place_meeting(x, y + sign(vveloc), obj_bloco)) {
//            y += sign(vveloc);
//        }
//        vveloc = 0; // Impede movimento vertical
//    }
//}

function scr_personagem_atacando() {
    // Impede o ataque se o joystick estiver ativo
    if (global.usando_joystick) {
        estado = scr_personagem_andando;
        atacar = false;
        return; // Sai do script para evitar criar a hitbox
    }

    // Verifica se a animação atingiu o quadro necessário para atacar
    if (image_index >= 1 && !atacar) {
        // Cria a hitbox baseada na direção
        switch (dir) {
            case "direita": instance_create_layer(x + 10, y, "Instances", obj_personagem_hitbox); break;
            case "cima": instance_create_layer(x, y - 10, "Instances", obj_personagem_hitbox); break;
            case "esquerda": instance_create_layer(x - 10, y, "Instances", obj_personagem_hitbox); break;
            case "baixo": instance_create_layer(x, y + 10, "Instances", obj_personagem_hitbox); break;
        }
        atacar = true;
    }

    // Verifica se a animação terminou
    if (image_index >= sprite_get_number(sprite_index) - 1) {
        estado = scr_personagem_andando;
        atacar = false;
    }
}

function scr_personagem_hit() {
    if (alarm[0] > 0) {
        hveloc = lengthdir_x(3, empurrar_dir);
        vveloc = lengthdir_y(3, empurrar_dir);
    } else {
        estado = scr_personagem_andando;
    }
}

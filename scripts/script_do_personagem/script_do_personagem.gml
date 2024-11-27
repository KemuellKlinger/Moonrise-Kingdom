function scr_personagem_andando() {
    // Obter velocidades do joystick
    var _hveloc = hveloc;
    var _vveloc = vveloc;

    // Determina a direção com base no movimento
    if (_hveloc != 0 || _vveloc != 0) {
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
     //Verifica ataque (opcional)
    //if (obj_ataque.clicado == true) {
    //    image_index = 0; // Reinicia a animação
    //    switch (dir) {
    //        case "direita": sprite_index = spr_personagem_atacando_direita; break;
    //        case "cima": sprite_index = spr_personagem_atacando_cima; break;
    //        case "esquerda": sprite_index = spr_personagem_atacando_esquerda; break;
    //        case "baixo": sprite_index = spr_personagem_atacando_baixo; break;
    //    }
        estado = scr_personagem_atacando; // Troca para o estado de ataque
    //}
}


function scr_personagem_atacando() {
    // Impede o ataque se o joystick estiver ativo
    if (global.usando_joystick) {
        estado = scr_personagem_andando;
		if(obj_ataque.clicado == true){
			atacar = true;
		}else{
			atacar = false;
		}
        return; // Sai do script para evitar criar a hitbox
    }

     //Verifica se a animação atingiu o quadro necessário para atacar
    if (image_index >= 1 && !atacar) {
        // Cria a hitbox baseada na direção
        switch (dir) {
            case "direita": instance_create_layer(x + 15, y, "Instances", obj_personagem_hitbox); break;
            case "cima": instance_create_layer(x, y - 15, "Instances", obj_personagem_hitbox); break;
            case "esquerda": instance_create_layer(x - 15, y, "Instances", obj_personagem_hitbox); break;
            case "baixo": instance_create_layer(x, y + 15, "Instances", obj_personagem_hitbox); break;
        }
        atacar = true;
    }

     //Verifica se a animação terminou
    if (image_index >= sprite_get_number(sprite_index) - 2) {
        estado = scr_personagem_andando;
        atacar = false;
		obj_ataque.clicado = false;
    }
}

// Atualização na função de colisão (ou no "hit")
function scr_personagem_hit() {
    if (alarm[0] > 0) {
        // Quando o personagem é atingido, ele é empurrado na direção de 'empurrar_dir'
        hveloc = lengthdir_x(3, empurrar_dir); // Empurrar horizontalmente
        vveloc = lengthdir_y(3, empurrar_dir); // Empurrar verticalmente
		
		scr_personagem_colisao();
    } else {
        estado = scr_personagem_andando; // Quando o impacto termina, volta ao estado de andar
    }
}

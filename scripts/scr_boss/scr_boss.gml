function scr_boss_escolher_estado() {
    // Decide o próximo estado
    prox_estado_boss = choose(scr_boss_andando, scr_boss_parado);
    
    if prox_estado_boss == scr_boss_andando {
        estado_boss = scr_boss_andando;
        dest_x_boss = irandom_range(0, room_width); // Ponto aleatório no cenário
    } else if prox_estado_boss == scr_boss_parado {
        estado_boss = scr_boss_parado;
    }
}

function scr_boss_andando() {
    // Movimenta em direção ao destino horizontal
    if abs(dest_x_boss - x) > veloc_boss {
        hveloc = sign(dest_x_boss - x) * veloc_boss;
    } else {
        hveloc_boss = 0; // Para ao atingir o destino
        estado_boss = scr_boss_parado;
    }
}

function scr_boss_parado() {
    hveloc_boss = 0;
}

function scr_boss_perseguindo() {
    var personagem_alvo;
    
    if instance_exists(obj_personagem_plataforma) {
        personagem_alvo = obj_personagem_plataforma;
    } else {
        return; // Nenhum personagem para perseguir
    }

    // Movimenta-se em direção ao personagem
    if abs(personagem_alvo.x - x) > 1 {
        hveloc_boss = sign(personagem_alvo.x - x) * veloc_perseg_boss;
    } else {
        hveloc_boss = 0; // Para ao atingir o personagem
    }

    // Sai do estado de perseguição se distância for maior que o limite
    if distance_to_object(personagem_alvo) >= dist_nao_agressivo_boss {
        estado_boss = scr_inimigo_escolher_estado;
        alarm[0] = irandom_range(120, 240);
    }
}

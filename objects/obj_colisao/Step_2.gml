/// @description Controle de movimento com colisões

var _colx, _coly;

// Verificar colisão na direção horizontal e vertical
_colx = instance_place(x + vel_hori, y, obj_bloco);
_coly = instance_place(x, y + vel_vest, obj_bloco);

// Colisão Horizontal
if (_colx) {
    if (vel_hori > 0) {
        x = _colx.bbox_left - (bbox_right - x); // Ajuste para a borda esquerda do bloco
    }
    else if (vel_hori < 0) {
        x = _colx.bbox_right - (bbox_left - x); // Ajuste para a borda direita do bloco
    }
    vel_hori = 0; // Zerar velocidade horizontal ao colidir
}

// Colisão Vertical
if (_coly) {
    if (vel_vest > 0) {
        y = _coly.bbox_top - (bbox_bottom - y); // Ajuste para a borda superior do bloco
    }
    else if (vel_vest < 0) {
        y = _coly.bbox_bottom - (bbox_top - y); // Ajuste para a borda inferior do bloco
    }
    vel_vest = 0; // Zerar velocidade vertical ao colidir
}

// Atualizar a posição com a velocidade restante
x += vel_hori;
y += vel_vest;

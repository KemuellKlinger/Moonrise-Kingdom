/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if other.tomar_dano == true {
    var _dir = point_direction(x, y, other.x, other.y);

    with (other) {
        empurrar_dir_boss = _dir;
        estado_boss = scr_personagem_hit;
        alarm[0] = 5;
        alarm[1] = 40;
        tomar_dano_boss = false;
        vida_boss -= 1;
    }
}

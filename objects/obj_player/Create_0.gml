/// @description Controle simplificado de movimento do personagem
event_inherited();

velocidade = 6;
forca_pulo = -8;

sprite_run = Run;
sprite_idle = Idle;
sprite_jump = Jump;

function input_player() {
    var esquerda, direita, pulo, direcaoX;
    
    // Retorna valor booleano (0 ou 1)
    esquerda = keyboard_check(ord("A"));
    direita = keyboard_check(ord("D"));
    pulo = keyboard_check_pressed(vk_space);
    
    // Verifica a direção no eixo X, sendo -1, 0 ou 1
    direcaoX = direita - esquerda;
    var _vel_hori = (direita - esquerda) * velocidade;

    // Verificações de colisão
    var noChao = place_meeting(x, y +1, obj_bloco);
    
    // Define a escala da imagem para refletir a direção
    if direcaoX != 0 {
        image_xscale = direcaoX;
    }
    
    // Controle de movimento no chão
    if noChao {
        vel_vest = 0; // Redefine gravidade ao tocar no chão
        if direcaoX != 0 {
            sprite_index = sprite_run;
        } else {
            sprite_index = sprite_idle;
        }
        
        if pulo {
            vel_vest = forca_pulo;
            sprite_index = sprite_jump;
        }
    } else {
        
        vel_vest += gravidade;
        
        // Animação de pulo no ar
        sprite_index = sprite_jump;
    }
    
    // Suavização do movimento horizontal
    vel_hori = lerp(_vel_hori, _vel_hori, 0.5); 
}
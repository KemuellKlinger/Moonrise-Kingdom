/// @description Inserir descrição aqui
event_inherited();

velocidade = 4;
forcaPulo = -8;
quant_pulo = 0;
max_pulo = 2;

sprite_run = spr_andando_direita;
sprite_idle = spr_personagem_parado_direita;
sprite_wall_jump = spr_personagem_parado_cima;
sprite_jump = spr_personagem_parado_cima;
sprite_double_jump = spr_personagem_parado_cima;
sprite_fall = spr_personagem_parado_baixo;

function inputPlayer() {
    var esquerda, direita, pulo, direcaoX;    

    // Retorna valor booleano (0 ou 1)
    esquerda = keyboard_check(ord("A"));
    direita = keyboard_check(ord("D"));
    pulo = keyboard_check_pressed(vk_space);
    
    // Verifica a direção no eixo X, sendo -1, 0 ou 1
    direcaoX = direita - esquerda;
    var _vel_hori = (direita - esquerda) * velocidade;

    // Verificações de colisão
    var noChao = place_meeting(x, y + 1, obj_bloco);
    var naParede = place_meeting(x + direcaoX, y, obj_bloco);   
    
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
        quant_pulo = max_pulo; // Reseta o contador de pulo duplo
        
        if pulo {
            vel_vest = forcaPulo;
            quant_pulo--;
        }
    } else {
        // Controle de pulo duplo no ar
        if (pulo && quant_pulo > 0) { // Certifica-se de que quant_pulo seja maior que 0
            vel_vest = forcaPulo;
            quant_pulo--;
        }
        
        vel_vest += gravidade;
        
        if quant_pulo == (max_pulo - 1) {
            sprite_index = sprite_jump;
        } else {
            sprite_index = sprite_double_jump;
        }
        
        // Animação de queda
        if vel_vest > 0 {
            sprite_index = sprite_fall;
        }

        // Controle de pulo na parede
        if naParede {
            vel_vest = 1; // Reduz a velocidade de queda
            sprite_index = sprite_wall_jump;
            
            // Se o jogador pular enquanto está na parede
            if pulo {
                vel_vest = forcaPulo;
                _vel_hori = (20 * direcaoX) * -1; // Inverte a direção horizontal
                quant_pulo = max_pulo - 1; // Reseta o pulo duplo
            }
        }
    }
 
    // Suavização do movimento horizontal
    vel_hori = lerp(vel_hori, _vel_hori, 0.35); 
}

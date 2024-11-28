//// Os recursos de script mudaram para a v2.3.0; veja
//// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

//function scr_inimigo_colisao(){
//	if place_meeting(x + hveloc, y, obj_bloco){
//		while !place_meeting(x +sign(hveloc), y, obj_bloco){
//			x += sign(hveloc);
//		}
//		hveloc = 0;
//	}
//	x += hveloc;
	
//	if place_meeting(x , y + vveloc, obj_bloco){
//		while !place_meeting(x, y  +sign(vveloc), obj_bloco){
//			y += sign(vveloc);
//		}
//		vveloc = 0;
//	}
//	y += vveloc;
//}

//function scr_inimigo_checar_personagem(){
//	if distance_to_object(obj_personagem) <= dist_agressivo{
//		estado = src_inimigo_perseguindo;
//	}
//	if distance_to_object(obj_personagem_plataforma) <= dist_agressivo{
//		estado = src_inimigo_perseguindo;
//	}
//}

//function scr_inimigo_escolher_estado(){
//	scr_inimigo_checar_personagem();
//	prox_estado = choose(scr_inimigo_andando, scr_inimigo_parado);
	
//	if prox_estado == scr_inimigo_andando{
		
//		estado = scr_inimigo_andando;
		
//		dest_x = irandom_range(0, room_width);
//		dest_y = irandom_range(0, room_height);

//	}	else if prox_estado == scr_inimigo_parado{
//				estado = scr_inimigo_parado;
//	}
//}

//function scr_inimigo_andando(){
//		scr_inimigo_checar_personagem();
//		image_speed = 1;
		
//		if distance_to_point(dest_x, dest_y) > veloc{
//			var _dir = point_direction(x, y, dest_x, dest_y);
//		hveloc = lengthdir_x(veloc, _dir);
//		vveloc = lengthdir_y(veloc, _dir);
		
//		 scr_inimigo_colisao();
//		}else{
//			x = dest_x;
//			y = dest_y;
//		}	

//}

//function scr_inimigo_parado(){
//	scr_inimigo_checar_personagem();
//	image_speed = 0.5;
//}

//function src_inimigo_perseguindo(){
//	 var personagem_atual;
//    if instance_exists(obj_personagem){
//        personagem_atual = obj_personagem;
//    } else if instance_exists(obj_personagem_plataforma){
//        personagem_atual = obj_personagem_plataforma;
//    } else {
//        return; // Nenhum personagem na sala
//    }

//    image_speed = 1.5;
    
//    dest_x = personagem_atual.x;
//    dest_y = personagem_atual.y;
    
//    var _dir = point_direction(x, y, dest_x, dest_y);
//    hveloc = lengthdir_x(veloc_perseg, _dir);
//    vveloc = lengthdir_y(veloc_perseg, _dir);

//    scr_inimigo_colisao();
    
//    if distance_to_object(personagem_atual) >= dist_nao_agressivo{
//        estado = scr_inimigo_escolher_estado;
//        alarm[0] = irandom_range(120, 240);
//    }
//}

//function scr_inimigo_hit(){
	
//	empurrar_veloc = lerp(empurrar_veloc, 0, 0.02);
	
//	hveloc = lengthdir_x(empurrar_veloc, empurrar_dir);
//	vveloc = lengthdir_y(empurrar_veloc, empurrar_dir);
	
//	scr_inimigo_colisao();

//}
// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

function scr_colisao(){
	if place_meeting(x + hveloc, y, obj_bloco){
	while !place_meeting(x + sign(hveloc), y, obj_bloco){
			x += sign(hveloc);
		}
		hveloc = 0;
	}
	x += hveloc;
	
		if place_meeting(x , y + vveloc, obj_bloco){
	while !place_meeting(x, y  +sign(vveloc), obj_bloco){
			y += sign(vveloc);
		}
		vveloc = 0;
	}
	y += vveloc;
}



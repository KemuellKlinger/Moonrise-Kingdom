///@arg player
///@arg dist
///@arg xscale
	
	
function ataca_player_plataforma (outro, dist, xscale){

//var outro = argument0;
//var dist = argument1;
//var xscale = argument2;



var player = collision_line(x, y - 15 , x + (dist * xscale), y - 15, outro, 0, 1);

if(player){
	estado = "attack";
}
}
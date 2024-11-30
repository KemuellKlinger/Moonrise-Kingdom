/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var outro = instance_place(x, y, obj_entidade);
if (outro){
	if(outro.id !=pai){
		
		if(outro.vida_atual > 0){
			outro.estado = "hit";
			outro.imagem_index = 0;
			outro.vida_atual -= dano;
			instance_destroy();
		}
		
		
	}
}
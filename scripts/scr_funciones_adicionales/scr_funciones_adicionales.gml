function crear_funcionalidad(profundidad, funcionalidad) {
	return instance_create_depth(OFFSCREEN, OFFSCREEN, profundidad, funcionalidad);
}

function copiar_lista(lista_fuente) {
	var lista_destino = [];
	array_copy(lista_destino, 0, lista_fuente, 0, array_length(lista_fuente));
	return lista_destino;
}

function valor_en_lista(valor, lista) {
	// Buscar el valor en la lista
	for (var i = 0; i < array_length(lista); i++) {
	   if (lista[i] == valor) then return true;
	}
	
	// En caso de no encontrar el valor, regresa falso
	return false;
}
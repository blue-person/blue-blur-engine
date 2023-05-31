function valor_en_lista(valor, lista) {
	// Buscar el valor en la lista
	for (var i = 0; i < array_length(lista); i++) {
	   if (lista[i] == valor) then return true;
	}
	
	// En caso de no encontrar el valor, regresa falso
	return false;
}
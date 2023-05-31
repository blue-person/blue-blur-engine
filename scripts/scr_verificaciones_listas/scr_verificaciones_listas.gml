function valor_en_lista(valor, lista) {
	if (ds_list_find_index(lista, valor) == -1) {
		return false;
	} else {
		return true;
	}
}
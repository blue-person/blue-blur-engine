
function registrar_puntaje(puntaje) {
	var valor_incremento = 100;
	
	if (puntaje > 0) {
		puntaje -= valor_incremento;
		global.puntaje_final += valor_incremento;
	} else {
		puntaje = 0;
	}
	return puntaje;
}
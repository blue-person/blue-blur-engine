function colision_circular_izquierda() {
	// Declaracion de valores
	var valor_auxiliar_posicion = 4;
	var pos_x = self.x - (self.acos * self.mascara_colision) - (self.asin * valor_auxiliar_posicion);
	var pos_y = self.y + (self.asin * self.mascara_colision) - (self.acos * valor_auxiliar_posicion);
	var radio_circulo = 5;
	var requisitos_colision_riel = self.permitir_grinding and (self.angulo == 0);
	
	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_circle(pos_x, pos_y, radio_circulo, true);

	// Devolver resultado
	return colision_circular_general(pos_x, pos_y, radio_circulo, requisitos_colision_riel);
}
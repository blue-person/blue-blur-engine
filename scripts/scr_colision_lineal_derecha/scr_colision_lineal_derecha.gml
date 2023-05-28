function colision_lineal_derecha() {
	// Declarar variables
	var valor_auxiliar_distancia = 36;
	var pos_x_1 = self.x + (self.acos * self.mascara_colision) + (self.asin * self.mascara_colision);
	var pos_y_1 = self.y - (self.asin * self.mascara_colision) + (self.acos * self.mascara_colision);
	var pos_x_2 = self.x + (self.acos * self.mascara_colision) + (self.asin * valor_auxiliar_distancia);
	var pos_y_2 = self.y - (self.asin * self.mascara_colision) + (self.acos * valor_auxiliar_distancia);
	var requisitos_colision_riel = self.permitir_grinding;
	
	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2);
	
	// Determinar si esta tocando la superficie del agua
	var colision_superficie_agua = colision_lineal_agua(pos_x_1, pos_y_1, pos_x_2, pos_y_2);
	if (colision_superficie_agua) then return true;
	
	// Devolver resultado
	return colision_lineal_general(pos_x_1, pos_y_1, pos_x_2, pos_y_2, requisitos_colision_riel);
}
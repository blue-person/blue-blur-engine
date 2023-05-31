function colision_lineal_izquierda() {
	// Declaracion de valores
	var valor_auxiliar_distancia = floor(self.mascara_colision * 3.5);
	var pos_x_1 = self.x - (self.acos * self.mascara_colision) + (self.asin * self.mascara_colision);
	var pos_y_1 = self.y + (self.asin * self.mascara_colision) + (self.acos * self.mascara_colision);
	var pos_x_2 = self.x - (self.acos * self.mascara_colision) + (self.asin * valor_auxiliar_distancia);
	var pos_y_2 = self.y + (self.asin * self.mascara_colision) + (self.acos * valor_auxiliar_distancia);
	
	// Declaracion de requisitos de colision
	var requisitos_colision_riel = self.permitir_grinding;
	var requisitos_caminar_sobre_agua = (self.caminar_sobre_agua) and (not self.sumergido_agua);
	
	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2);
	
	// Devolver resultado
	return colision_lineal_general(pos_x_1, pos_y_1, pos_x_2, pos_y_2, requisitos_colision_riel, requisitos_caminar_sobre_agua);
}
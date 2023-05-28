function colision_circular_superior() {
	// Declaracion de valores
	var pos_x = self.x - self.asin * self.mascara_colision;
	var pos_y = self.y - self.acos * self.mascara_colision;
	var radio_circulo = 5;
	
	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_circle(pos_x, pos_y, radio_circulo, true);
	
	// Determinar colisiones con superficies
	var colision_normal_superficie = collision_circle(pos_x, pos_y, radio_circulo, obj_superficie, true, true);
	if (colision_normal_superficie) then return true;
		
	// Determinar colisiones con superficies, ya sea capa frontal o capa posterior
	if (self.capa_actual == "frontal") {
        var colision_superficie_frontal = collision_circle(pos_x, pos_y, radio_circulo, obj_superficie_frontal, true, true);
		if (colision_superficie_frontal) then return true;
    } else {
        var colision_superficie_posterior = collision_circle(pos_x, pos_y, radio_circulo, obj_superficie_posterior, true, true);
		if (colision_superficie_posterior) then return true;
    }
		
	// En caso de que ningun caso se cumpla, se regresa falso
	return false;
}
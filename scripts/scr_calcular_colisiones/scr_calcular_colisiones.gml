function colision_puntos_capas(pos_x, pos_y, superficie_posterior, superficie_frontal, entidad = self) {
	// Determinar colisiones
	var colision_capa_posterior = collision_point(pos_x, pos_y, superficie_posterior, true, true);
	var colision_capa_frontal = collision_point(pos_x, pos_y, superficie_frontal, true, true);
	
	// Retornar comprobacion
	return (colision_capa_frontal and (entidad.capa_actual == "frontal")) or (colision_capa_posterior and (entidad.capa_actual == "posterior"));
}

function colision_lineal_capas(pos_x_1, pos_y_1, pos_x_2, pos_y_2, superficie_posterior, superficie_frontal, entidad = self) {
	// Determinar colisiones
	var colision_capa_posterior = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, superficie_posterior, true, true);
	var colision_capa_frontal = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, superficie_frontal, true, true);
	
	// Retornar comprobacion
	return (colision_capa_frontal and (entidad.capa_actual == "frontal")) or (colision_capa_posterior and (entidad.capa_actual == "posterior"));
}

function colision_circular_capas(pos_x, pos_y, radio, superficie_posterior, superficie_frontal, entidad = self) {
	// Determinar colisiones
	var colision_capa_posterior = collision_circle(pos_x, pos_y, radio, superficie_posterior, true, true);
	var colision_capa_frontal = collision_circle(pos_x, pos_y, radio, superficie_frontal, true, true);
	
	// Retornar comprobacion
	return (colision_capa_frontal and (entidad.capa_actual == "frontal")) or (colision_capa_posterior and (entidad.capa_actual == "posterior"));
}

function calcular_colision_lineal(superficie, mascara = 20, entidad = self) {
	// Declaracion de valores
	var pos_x_1 = entidad.x;
	var pos_y_1 = entidad.y;
	var pos_x_2 = entidad.x + mascara * entidad.asin;
	var pos_y_2 = entidad.y + mascara * entidad.acos;
	
	// Retornar comprobacion
	return collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, superficie, true, true);
}

function verificar_colision_aterrizaje(superficie_normal, superficie_posterior, superficie_frontal, mascara = 20, entidad = self) {
	// Declaracion de valores
	var pos_x_1 = entidad.x;
	var pos_y_1 = entidad.y;
	var pos_y_2 = entidad.y + mascara;
	
	// Determinar colisiones
	var colision_normal = collision_line(pos_x_1, pos_y_1, pos_x_1, pos_y_2, superficie_normal, true, true);
	var colision_capa_posterior = calcular_colision_lineal(superficie_posterior) and (entidad.capa_actual == "posterior");
	var colision_capa_frontal = calcular_colision_lineal(superficie_frontal) and (entidad.capa_actual == "frontal");
	
	// Retornar comprobacion
	return (colision_normal or colision_capa_posterior or colision_capa_frontal);
}

function verificar_colision_tipo_suelo(superficie_normal, superficie_posterior, superficie_frontal, entidad = self) {
	// Determinar colisiones
	var colision_normal = calcular_colision_lineal(superficie_normal);
	var colision_capa_posterior = calcular_colision_lineal(superficie_posterior) and (entidad.capa_actual == "posterior");
	var colision_capa_frontal = calcular_colision_lineal(superficie_frontal) and (entidad.capa_actual == "frontal");
	var colisionando_suelo = (colision_normal or colision_capa_posterior or colision_capa_frontal);
	
	// Determinar si la entidad puede caminar sobre obj_superficie_agua
	if (colisionando_suelo) then entidad.caminar_sobre_agua = false;
	
	// Retornar comprobacion
	return colisionando_suelo;
}
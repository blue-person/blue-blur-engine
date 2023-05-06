function calcular_angulo(angulo, mascara, verificacion_angulo_final, entidad = self) {
	// Declaracion de valores
	var angulo_aproximado = floor(angulo);
	var valor_acos = dcos(angulo_aproximado);
	var valor_asin = dsin(angulo_aproximado);
	
	var pos_x = entidad.x;
	var pos_y = entidad.y;

	var pos_x_1 = pos_x - valor_acos * mascara;
	var pos_y_1 = pos_y + valor_asin * mascara;
	var pos_x_2 = pos_x + valor_acos * mascara;
	var pos_y_2 = pos_y - valor_asin * mascara;

	var primer_subconjunto = false;
	var segundo_subconjunto = false;
	
	// Realizar comprobaciones
	while (verificacion_angulo_final > 0) {
		if (!primer_subconjunto) {
			// Determinar colisiones con obj_superficie
			var colision_normal_superficie = collision_point(pos_x_1, pos_y_1, obj_superficie, true, true);
			var colision_capas_superficie = colision_puntos_capas(pos_x_1, pos_y_1, obj_superficie_posterior, obj_superficie_frontal);
			if (colision_normal_superficie or colision_capas_superficie) then primer_subconjunto = true;

			// Determinar colisiones con obj_riel
			var colision_normal_riel = collision_point(pos_x_1, pos_y_1, obj_riel, true, true);
			var colision_capas_riel = colision_puntos_capas(pos_x_1, pos_y_1, obj_riel_posterior, obj_riel_frontal);
			if (entidad.permitir_grinding and (colision_normal_riel or colision_capas_riel)) then primer_subconjunto = true;

			// Determinar colisiones con obj_superficie_agua
			var permisos_requeridos = (entidad.caminar_sobre_agua and !entidad.sumergido_agua);
			var angulo_requerido = (entidad.angulo <= 45) or (entidad.angulo >= 315);
			var velocidad_requerida = (abs(entidad.velocidad_horizontal) >= 8);
			var colision_normal_agua = collision_point(pos_x_1, pos_y_1, obj_superficie_agua, true, true);
			if (permisos_requeridos and angulo_requerido and velocidad_requerida and colision_normal_agua) then primer_subconjunto = true;

			// Actualizar posiciones
			pos_x_1 += valor_asin;
			pos_y_1 += valor_acos;
		}

		if (!segundo_subconjunto) {
			// Determinar colisiones con obj_superficie
			var colision_normal_superficie = collision_point(pos_x_2, pos_y_2, obj_superficie, true, true);
			var colision_capas_superficie = colision_puntos_capas(pos_x_2, pos_y_2, obj_superficie_posterior, obj_superficie_frontal);
			if (colision_normal_superficie or colision_capas_superficie) then segundo_subconjunto = true;

			// Determinar colisiones con obj_riel
			var colision_normal_riel = collision_point(pos_x_2, pos_y_2, obj_riel, true, true);
			var colision_capas_riel = colision_puntos_capas(pos_x_2, pos_y_2, obj_riel_posterior, obj_riel_frontal);
			if (entidad.permitir_grinding and (colision_normal_riel or colision_capas_riel)) then segundo_subconjunto = true;

			// Determinar colisiones con obj_superficie_agua
			var permisos_requeridos = (entidad.caminar_sobre_agua and !entidad.sumergido_agua);
			var angulo_requerido = (entidad.angulo <= 45) or (entidad.angulo >= 315);
			var velocidad_requerida = (abs(entidad.velocidad_horizontal) >= 8);
			var colision_normal_agua = collision_point(pos_x_2, pos_y_2, obj_superficie_agua, true, true);
			if (permisos_requeridos and angulo_requerido and velocidad_requerida and colision_normal_agua) then segundo_subconjunto = true;

			// Actualizar posiciones
			pos_x_2 += valor_asin;
			pos_y_2 += valor_acos;
		}

		// Verificar si se ha encontrado un angulo valido
		if (primer_subconjunto and segundo_subconjunto) then break else --verificacion_angulo_final;
	}

	// Retornar angulo
	return point_direction(pos_x_1, pos_y_1, pos_x_2, pos_y_2);
}
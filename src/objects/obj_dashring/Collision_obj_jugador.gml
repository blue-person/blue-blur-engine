if (activar_evento and (other.accion != 26)) {
	// Variables
	var angulo_disparo = image_angle;

	// Ajustar parametros del objeto
	activar_evento = false;
	
	// Crear efecto visual
	var efecto = crear_efecto(x, y, animacion);
	efecto.image_angle = image_angle;
    dibujar_efectos(efecto_visual);
	
	// Ajustar parametros
    nivel.aumentar_puntaje_cool(cantidad_puntos);
    audio.reproducir_audio_aislado(efecto_sonido, false);
	
	// Ajustar parametros del jugador
	with (jugador) {
		// Ajustar parametros
		angulo = 0;
		tocando_suelo = false;
		image_index = 0;
		x = other.x;
		y = other.y;
		cantidad_boost += other.cantidad_energia;
		velocidad_horizontal = dcos(angulo_disparo) * other.cantidad_fuerza;
		velocidad_vertical = -dsin(angulo_disparo) * other.cantidad_fuerza;
		
		// Gestionar direccion del jugador
		var angulo_mayor_270 = (angulo_disparo > 270) or (angulo_disparo > -90);
		var angulo_menor_270 = (angulo_disparo < 270) or (angulo_disparo < -90);
		
		if ((angulo_disparo < 90) and angulo_mayor_270) {
	        direccion_horizontal = 1;
	    } else if ((angulo_disparo > 90) and angulo_menor_270) {
	        direccion_horizontal = -1;
	    }
		
		// Gestionar parametros en base al angulo de disparo
		var angulo_menor_45 = (angulo_disparo > 0) and (angulo_disparo < 45);
		var angulo_mayor_135 = (angulo_disparo < 180) and (angulo_disparo > 135);
		
		if ((angulo_disparo == 0) or (angulo_disparo == 180)) {
			accion = 6;
			gravedad = 0;
			alarm[0] = other.tiempo_espera;
		} else if ((angulo_disparo == 45) or (angulo_disparo == 135)) {
			accion = 5;
			image_index = 0;
			sprite_index = animaciones_dashring.girando;
		} else if (angulo_menor_45 or angulo_mayor_135) {
			accion = 5;
			sprite_index = animaciones_dashring.impulsandose;
		} else {
			accion = 5;
			sprite_index = animaciones_dashring.saltando;
		}
	}
}
if (jugador_existe) {
	// Variables
	var jugador_esta_colisionando = place_meeting(x, y, jugador);
	
	// Determinar si el evento esta activo
	if (not activar_evento) {
	    // Ajustar parametros del objeto
	    image_index = 0;
	    image_speed = 0;
		
		// Ajustar parametros de los tubos
		tubos.image_index = 0;
		
		// Comprobrar condiciones
	    if (jugador_esta_colisionando and puede_usarse and (jugador.accion != 26)) {
			// Reproducir sonidos
	        audio.reproducir_audio(snd_fourwaycannon_encender);
	        audio.reproducir_audio(snd_fourwaycannon_cargando);
			
			// Ajustar variables
			alarm[0] = -1;
			puede_usarse = false;
	        activar_evento = true;
	        realizar_animacion = true;
			
			// Ajustar accion del jugador
			jugador.accion = 21;
	    }   
	} else if (jugador.accion == 21) {
		// Ajustar parametros del objeto
		image_speed += 0.5;
		iniciar_alarma(0, tiempo_espera);
		
		// Ajustar parametros del jugador
	    jugador.x = x;
	    jugador.y = y;
		
		// Comprobar bandera
	    if (realizar_animacion) {
			// Ajustar animacion en base al boton que se oprime
			var botones_liberados = controles.boton_liberado("boton_arriba") or controles.boton_liberado("boton_abajo") or controles.boton_liberado("boton_derecha") or controles.boton_liberado("boton_izquierda");
			if (not botones_liberados) {
			    if (controles.boton_mantenido("boton_derecha")) {
			        self.ajustar_animacion(1, 4, 270)
			    } else if (controles.boton_mantenido("boton_arriba")) {
			        self.ajustar_animacion(5, 8, 0)
			    } else if (controles.boton_mantenido("boton_izquierda")) {
			        self.ajustar_animacion(9, 12, 90)
			    } else if (controles.boton_mantenido("boton_abajo")) {
			        self.ajustar_animacion(13, 16, 180)
			    } else if (tubos.image_index != 0) {
			        realizar_animacion = false
			    }
			}
	    } else {
			// Ajustar fotograma
			tubos.fotograma -= 0.5;
			
			// Ajustar indice
			if (array_contains(indices_validos, tubos.image_index)) {
				realizar_animacion = true;
	            tubos.image_index = 0;
			}
	    }
	}
	
	// Determinar cuando se deja de interactuar con el objeto
	if (not jugador_esta_colisionando and (jugador.accion != 21)) {
		// Detener sonido
	    audio.detener_audio(snd_fourwaycannon_cargando);
		
		// Ajustar variables del objeto
		puede_usarse = true;
	    activar_evento = false;
	    realizar_animacion = true;
		
		// Ajustar variables de los tubos
	    indice_imagen = 0;
	    angulo_imagen = 0;
	}
}
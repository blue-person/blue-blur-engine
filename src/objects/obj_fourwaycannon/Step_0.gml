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
			puede_usarse = false;
	        activar_evento = true;
	        realizar_animacion = true;
	        tiempo_transcurrido = tiempo_maximo;
			
			// Ajustar accion del jugador
			jugador.accion = 21;
	    }   
	} else if (activar_evento and (jugador.accion == 21)) {
		// Comprobar bandera
	    if (realizar_animacion) {
			// Ajustar animacion
	        if (controles.boton_mantenido("boton_arriba")) {
				self.ajustar_animacion(5, 8, 0);
	        } else if (controles.boton_mantenido("boton_abajo")) {
				self.ajustar_animacion(13, 16, 180);
	        } else if (controles.boton_mantenido("boton_derecha")) {
				self.ajustar_animacion(1, 4, 270);
	        } else if (controles.boton_mantenido("boton_izquierda")) {
				self.ajustar_animacion(9, 12, 90);
	        }
			
			// Ajustar bandera
			var soltar_parte_vertical = controles.boton_liberado("boton_arriba") or controles.boton_liberado("boton_abajo")
			var soltar_parte_horizontal = controles.boton_liberado("boton_derecha") or controles.boton_liberado("boton_izquierda");
			if (soltar_parte_vertical or soltar_parte_horizontal) { 
				realizar_animacion = false;
			}
	    } else {
			// Ajustar indice
			if (valor_en_lista(tubos.image_index, direcciones_apuntado)) {
				realizar_animacion = true;
	            tubos.image_index = 0;
			}
			
			// Ajustar fotograma
			tubos.fotograma -= 0.5;
	    }
		
		// Comprobar el tiempo transcurrido
		tiempo_transcurrido--;
		if (tiempo_transcurrido <= 0) {
			// Reproducir sonido
	        audio.reproducir_audio(snd_fourwaycannon_timeout);
			
			// Ajustar variables
	        activar_evento = false;
	        jugador.accion = 0;
	    }
		
		// Ajustar parametros del objeto
		image_speed += 0.5;
		
		// Ajustar parametros del jugador
	    jugador.x = x;
	    jugador.y = y;
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
	    angulo_tubos = 0;
	    direccion_apuntado = 0;

		// Ajustar parametros del jugador
		jugador.visible = true;
	}
}
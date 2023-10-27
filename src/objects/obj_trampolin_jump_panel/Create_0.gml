// Heredar datos del objeto padre
event_inherited();

// Variables
permitir_uso = instance_exists(obj_jump_panel);
angulo_ajustado = false;

// Metodos
ajustar_comportamiento_jugador = function(instancia_jugador) {
	// Determinar condiciones
	if (activar_evento and (instancia_jugador.accion != 26)) {
		// Ajustar parametros
		image_speed = 0.75;
		activar_evento = false;
	
		// Activar efectos
		audio.reproducir_audio_aislado(snd_trampolin, false);
	    dibujar_efectos(spr_efecto_velocidad, image_angle, 1, 1, false);
    
		// Configurar valores del jugador
		with (instancia_jugador) {
			// Variables
			var angulo_disparo = other.image_angle;
		
			// Ajustar parametros del jugador
			image_index = 0;
			angulo = 0;
			accion = 24;
			tocando_suelo = false;
			x = other.x + 10 * dcos(angulo_disparo);
			y = other.y - 10 * dsin(angulo_disparo);
		
			// Ajustar direccion
			if ((angulo_disparo < 90) and (angulo_disparo > 270)) {
				direccion_horizontal = 1;	
			} else if ((angulo_disparo > 90) and (angulo_disparo < 270)) {
				direccion_horizontal = -1;
			}
		}
	}
}
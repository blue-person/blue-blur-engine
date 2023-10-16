function gestion_accion_wallrun() {
	if (accion == 36) {
		// Gestionar si puede correr en la pared
		var ruta_despejada = not collision_line(x, y, x + 20, y, obj_superficie, false, true);
		var colisionando_con_pared = collision_point(x, y, obj_pared, false, true);
		
		if (ruta_despejada and colisionando_con_pared) {
			// Variables
			var presionando_arriba = controles.boton_presionado("boton_arriba");
			var presionando_abajo = controles.boton_presionado("boton_abajo");
	        var distancia_quickstep = 56;
			var arriba_esta_libre = not collision_point(x, y - distancia_quickstep, obj_superficie, false, true);
			var abajo_esta_libre = not collision_point(x, y + distancia_quickstep, obj_superficie, false, true);
			
			// Modificar parametros
			tocando_suelo = false;
			velocidad_vertical = 0;
			
			// Determinar movimiento
			if (presionando_arriba and arriba_esta_libre) {
				audio.reproducir_audio(snd_quickstep);
				y -= distancia_quickstep;
			} else if (presionando_abajo and abajo_esta_libre) {
				audio.reproducir_audio(snd_quickstep);
				y += distancia_quickstep;
			}
		} else if (not ruta_despejada) {
			// Incapacitar el jugador si choca con un muro
			herir_jugador(false);
		} else {
			// Modificar accion
			accion = 0;
		}
		
		// Salir del evento
		exit;
	}
}
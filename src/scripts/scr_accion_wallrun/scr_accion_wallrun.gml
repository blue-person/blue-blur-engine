function gestion_accion_wallrun() {
	if (accion == 36) {
		// Gestionar si puede correr en la pared
		var colisionando_con_pared = place_meeting(x, y, obj_pared);
		
		if (colisionando_con_pared) {
			// Variables
			var presionando_arriba = controles.boton_presionado("boton_arriba");
			var presionando_abajo = controles.boton_presionado("boton_abajo");
	        var distancia_quickstep = 56;
			var arriba_esta_libre = not collision_point(x, y - distancia_quickstep, obj_superficie, true, true);
			var abajo_esta_libre = not collision_point(x, y + distancia_quickstep, obj_superficie, true, true);
	        
			// Modificar parametros
			tocando_suelo = false;
			
			// Determinar movimiento
	        if (presionando_arriba and arriba_esta_libre) {
	            audio.reproducir_audio(snd_quickstep);
	            y -= distancia_quickstep;
	        } else if (presionando_abajo and abajo_esta_libre) {
	            audio.reproducir_audio(snd_quickstep);
	            y += distancia_quickstep;
	        }
		} else {
			// Anular accion
			accion = 0;
		}	
	}
}
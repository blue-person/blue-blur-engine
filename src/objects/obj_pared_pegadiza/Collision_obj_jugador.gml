if (activar_evento and (other.accion != 26)) {
	// Variables
	var impulsado_hacia_izquierda = (other.velocidad_horizontal > 0.5) and (direccion_horizontal == -1);
	var impulsado_hacia_derecha = (other.velocidad_horizontal < -0.5) and (direccion_horizontal == 1);
	
	// Determinar condiciones
	if (impulsado_hacia_izquierda or impulsado_hacia_derecha) {
		// Modificar bandera
		activar_evento = false;
		
		// Modificar parametros del jugador
		with (jugador) {
			accion = 19;
			permitir_uso_boost = false;
			direccion_horizontal = -other.direccion_horizontal;
		    x = other.x + 16 * other.direccion_horizontal;
			alarm[2] = 80;
		}
	}
}
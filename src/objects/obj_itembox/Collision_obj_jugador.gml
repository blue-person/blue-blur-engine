// Modificar los parametros del jugador
var posicion_actual = x;
with (other) {
	if (accion == 4) {
	    accion = 0;
	    x = posicion_actual;
	    velocidad_horizontal = 0;
	    velocidad_vertical = -5;
	} else if (not tocando_suelo) {
		velocidad_vertical = -5;
	}
}

// Destruir el itembox
instance_destroy();
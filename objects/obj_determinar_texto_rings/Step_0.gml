if (instance_exists(obj_controlador_pausa)) {
	if (obj_controlador_pausa.nivel_pausado == noone) {
		// Rings
	    texto_rings = string(obj_jugador.rings);
		
	    if (obj_jugador.rings < 100) {
			texto_rings = "0" + texto_rings;
		}
		
	    if (obj_jugador.rings < 10) {
			texto_rings = "0" + texto_rings;
		}
	}
}
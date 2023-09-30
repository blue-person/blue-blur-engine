if (instance_exists(obj_menu_pausa)) {
	if (obj_menu_pausa.nivel_actual == -1) {
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
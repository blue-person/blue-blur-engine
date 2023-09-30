if (instance_exists(obj_menu_pausa)) {
	if (obj_menu_pausa.nivel_actual == -1) {
		// Vidas
	    texto_vidas = string(global.vidas_restantes);

	    if (global.vidas_restantes < 10) {
			texto_vidas = "0" + texto_vidas;
		}
	}
}
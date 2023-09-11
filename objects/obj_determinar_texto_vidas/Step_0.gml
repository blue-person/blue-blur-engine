if (instance_exists(obj_controlador_pausa)) {
	if (obj_controlador_pausa.nivel_pausado == noone) {
		// Vidas
	    texto_vidas = string(global.vidas_restantes);

	    if (global.vidas_restantes < 10) {
			texto_vidas = "0" + texto_vidas;
		}
	}
}
function efecto_haptico_colision(magnitud_sacudida_camara = 6, duracion_sacudida_camara = 25, permitir_vibracion_gamepad = true, duracion_vibracion_gamepad = 15) {
	var gamepad_conectado = (determinar_tipo_controles() != "teclado");
	if (permitir_vibracion_gamepad and gamepad_conectado) {
		vibrar_gamepad(duracion_vibracion_gamepad);
	}
	
	sacudir_camara(magnitud_sacudida_camara, duracion_sacudida_camara);
}
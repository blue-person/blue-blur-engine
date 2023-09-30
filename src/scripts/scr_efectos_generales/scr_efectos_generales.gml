function efecto_haptico_colision(magnitud_sacudida_camara = 6, duracion_sacudida_camara = 25, duracion_vibracion_gamepad = 15) {
	sacudir_camara(magnitud_sacudida_camara, duracion_sacudida_camara);
	input_vibrate_constant(1, 0, duracion_vibracion_gamepad);
}
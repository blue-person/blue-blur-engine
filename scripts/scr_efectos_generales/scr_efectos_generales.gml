function efecto_haptico_colision(duracion_sacudida_camara = 25, duracion_vibracion_gamepad = 15) {
	obj_camara.sacudir_camara(duracion_sacudida_camara);
	input_vibrate_constant(1, 0, duracion_vibracion_gamepad);
}
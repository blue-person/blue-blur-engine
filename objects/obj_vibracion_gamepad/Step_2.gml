if (tiempo_vibracion <= 0) {
	instance_destroy();
} else {
	 --tiempo_vibracion;
	 gamepad_set_vibration(obj_controles.puerto_dispositivo, global.intensidad_vibracion_gamepad, global.intensidad_vibracion_gamepad);
}
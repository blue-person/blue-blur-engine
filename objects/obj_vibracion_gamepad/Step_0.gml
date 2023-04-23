if (permitir_vibracion) {
    --tiempo_vibracion;
    gamepad_set_vibration(0, 1, 1);
	
    if (tiempo_vibracion <= 0) {
		instance_destroy();
	}
}

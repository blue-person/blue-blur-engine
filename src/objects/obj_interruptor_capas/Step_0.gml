if (fue_activado and (image_speed > 0)) {
	image_speed -= 0.05;
} else {
    image_index = 0;
    image_speed = 0;
	fue_activado = false;
    activar_evento = permitir_reutilizar;
}
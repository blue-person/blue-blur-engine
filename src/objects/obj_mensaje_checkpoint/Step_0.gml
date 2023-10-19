// Gestionar aparicion del mensaje
if ((fase_animacion == 1) and (image_alpha < 1)) {
	image_alpha += velocidad_animacion;
	if (image_alpha >= 1) {
		fase_animacion = 2;
		iniciar_alarma(0, 180);
	}
}

// Gestionar desvanecimiento del mensaje
if ((fase_animacion == 3) and (image_alpha > 0)) {
	image_alpha -= velocidad_animacion;
	if (image_alpha <= 0) {
		instance_destroy();
	}
}
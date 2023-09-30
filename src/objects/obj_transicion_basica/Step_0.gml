// Gestionar en base al tipo de animacion
if (transicion_actual == 0) {
	image_alpha += velocidad_transicion;
	// Verificar si se alcanzo el valor maximo de transparencia
	if (image_alpha >= 1) {
		image_alpha = 1;
		transicion_actual = 1;
	}
} else if (transicion_actual == 1) {
	image_alpha -= velocidad_transicion;
	// Verificar si se alcanzo el valor minimo de transparencia
	if (image_alpha <= 0) {
		image_alpha = 1;
		instance_destroy();
	}
}
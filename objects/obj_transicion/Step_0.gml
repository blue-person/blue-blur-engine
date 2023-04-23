switch (transicion_actual) {
    case transicion_fade_in:
        image_alpha += velocidad_transicion;
	
		if (image_alpha >= 1) {
			image_alpha = 1;
			transicion_actual = transicion_fade_out;
		}
        break;
    case transicion_fade_out:
        image_alpha -= velocidad_transicion;
		
	    if (image_alpha <= 0) {
			image_alpha = 1;
			instance_destroy();
		}
        break;
}
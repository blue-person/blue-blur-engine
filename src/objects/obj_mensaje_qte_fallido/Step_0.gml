if (detenido) {
    if (image_alpha < 1) {
		image_alpha += 0.25;
	} else if (!realizar_animacion and (image_alpha >= 1)) {
        alarm[0] = 30;
        realizar_animacion = true;
    }
} else {
    if (image_alpha > 0) {
        image_alpha -= 0.0625;
        image_xscale += 0.0125;
        image_yscale += 0.0125;
    } else {
        instance_destroy();
	}
}
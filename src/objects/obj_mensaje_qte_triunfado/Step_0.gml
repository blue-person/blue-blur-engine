switch (realizar_animacion) {
    case 0:
        if (image_alpha < 1) {
			image_alpha += 0.125;
		} else if (image_alpha >= 1) {
			realizar_animacion = 1;
			alarm[0] = 60;
		}
        break;
    case 2:
        if (image_alpha > 0) {
		    image_alpha -= 0.120;
		    image_xscale += 0.120;
		    image_yscale += 0.120;
		} else if (image_alpha == 0) {
			instance_destroy();
		}
        break;
}
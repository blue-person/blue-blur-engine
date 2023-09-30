if ((activar_evento == 1) and (image_speed <= 1)) {
    image_speed += 0.05;
} else if (activar_evento == 2) {
    if (image_xscale > 0) {
        image_xscale -= 0.1;
        image_yscale -= 0.1;
    }
}
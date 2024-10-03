if ((fase_evento == 2) and (image_speed <= 1)) {
    image_speed += 0.05;
} else if (fase_evento == 3) {
    if (image_xscale > 0) {
        image_xscale -= 0.1;
        image_yscale -= 0.1;
    }
}
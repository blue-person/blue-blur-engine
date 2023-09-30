if (activar_efecto) {
    draw_self();
} else {
    draw_set_circle_precision(32);
    draw_set_colour(c_lime);
	
	for (var n = 0; n < 2; n += 0.1) {
		draw_circle(x, y, radio - n, true);
	}
}

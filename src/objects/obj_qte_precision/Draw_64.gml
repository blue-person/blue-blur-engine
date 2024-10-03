x = graficos.obtener_ancho() / 2;
y = graficos.obtener_altura()  / 2;

// Dibujar ciculos limite
draw_set_circle_precision(64);

draw_set_colour(c_dkgray);
for (var n = limite_final_circulo_a; n <= limite_inicial_circulo_a; n += 0.1) {
	draw_circle(x, y, n, true);
}

draw_set_colour(c_dkgray);
for (var n = limite_final_circulo_b; n <= limite_inicial_circulo_b; n += 0.1) {
	draw_circle(x, y, n, true);
}

draw_set_colour(c_ltgray);
for (var n = limite_final_circulo_c; n <= limite_inicial_circulo_c; n += 0.1) {
	draw_circle(x, y, n, true);
}

// Dibujar tecla a presionar
draw_sprite_ext(icono_boton, 0, x, y, escala_x_boton, escala_y_boton, 1, c_white, transparencia_boton);

// Dibujar linea de seleccion
draw_set_colour(c_lime);
for (var n = 0; n <= 2; n += 0.1) {
	draw_circle(x, y, limite_tiempo - n, true);
}
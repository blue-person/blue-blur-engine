// Establecer ubicacion
x = Pantalla.RESOLUCION_HORIZONTAL / 2;
y = Pantalla.RESOLUCION_VERTICAL  / 2;

// Dibujar tecla a presionar
draw_sprite_ext(iconos_controles, boton_aleatorio.indice_sprite, x, y, escala_x_boton, escala_y_boton, 1, c_white, transparencia_boton);

// Dibujar parra de progreso
var color_barra = make_color_rgb(100 - limite_tiempo, limite_tiempo + 155, 0);
dibujar_circulo_progreso(x, y, limite_tiempo, 100, color_barra, 25, 1, 5);
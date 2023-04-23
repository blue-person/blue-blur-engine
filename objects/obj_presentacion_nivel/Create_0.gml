// Valores de transparencia
transparencia_barra = 0;
trasnparencia_invisible = 0;
transparencia_transicion_gris = 1;
transparencia_transicion_negra = 1;

// Posiciones
pos_x_nombre = -200;
pos_y_nombre = 80;

pos_x_mision = 500;
pos_y_mision = 210;

// Otros
animacion_actual = 1;
velocidad_presentacion = 10;
angulo_salida = 80;

// Determinar variables segun el personaje
switch (global.personaje_actual) {
    case "Sonic":
        indice = 0;
		color = make_colour_rgb(27, 54, 166);
        break;
    case "Shadow":
        indice = 1;
		color = make_colour_rgb(137, 27, 41);
        break;
}

// Evitar que el jugador se pueda mover durante la presentacion del nivel
obj_jugador.permitir_movimiento = false;
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
indice = obj_jugador.parametros_titlecard.indice;
color = obj_jugador.parametros_titlecard.color;

// Evitar que el jugador se pueda mover durante la presentacion del nivel
obj_jugador.permitir_movimiento = false;
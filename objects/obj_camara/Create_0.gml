// Variables
camara = noone;
pos_x = x;
pos_y = y;
objeto_enfocado = noone;
valor_retraso = 5;

// Sacudir camara
permitir_sacudir = false;
duracion_sacudida = 0;
magnitud_sacudida = 0;
sacudida_restante = 0;

// Mirar hacia arriba o hacia abajo
requisito_elevar_camara = room_speed / 2;
requisito_bajar_camara = room_speed / 1.25;
cronometro = 0;
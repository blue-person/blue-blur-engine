// Ajustar apariencia
image_alpha = 0;
image_speed = 0;
image_xscale = 11;
image_yscale = 11;

// Definir que rango sera en base a la calificacion
if (global.puntaje_final >= 50000) {
	image_index = 0;
} else if (global.puntaje_final >= 40000) {
	image_index = 1;
} else if (global.puntaje_final >= 35000) {
	image_index = 2;
} else if (global.puntaje_final >= 25000) {
	image_index = 3;
} else {
	image_index = 4;
}
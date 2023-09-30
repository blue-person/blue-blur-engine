// Otros
animacion_actual = 1;

// Determinar variables segun el personaje
var animacion_presentacion = obj_jugador.animacion_presentacion;

if (nivel.obtener_permiso_reaparicion()) {
	sprite_index = animacion_presentacion.normal.sprite;
	image_speed = animacion_presentacion.normal.velocidad;
} else {
	sprite_index = animacion_presentacion.corriendo.sprite;
	image_speed = animacion_presentacion.corriendo.velocidad;
}
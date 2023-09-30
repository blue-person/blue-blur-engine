x = obj_jugador.x;
y = obj_jugador.y + 2;
image_xscale = obj_jugador.direccion_horizontal;
image_speed = abs(obj_jugador.velocidad_horizontal) / 12 + 0.5;

if ((obj_jugador.accion != 1) or (obj_jugador.sprite_actual == sprite_aterrizar)) {
	instance_destroy();
}
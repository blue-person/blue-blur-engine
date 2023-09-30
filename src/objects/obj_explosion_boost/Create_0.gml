image_speed = 0.5;
sprite_index = obj_jugador.sprite_explosion_boost;

if (abs(obj_jugador.velocidad_horizontal) > 3) {
	image_angle = obj_efecto_boost.image_angle;
} else {
    image_xscale = obj_jugador.direccion_horizontal;
}
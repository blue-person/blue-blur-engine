image_speed = 0.5;

if (abs(obj_jugador.velocidad_horizontal) > 3) {
	image_angle = obj_efecto_boost.image_angle;
} else {
    image_xscale = obj_jugador.direccion_horizontal;
}

switch (global.personaje_actual) {
    case "Sonic":
        sprite_index = obj_explosion_boost_sonic;
        break;
    case "Shadow":
        sprite_index = obj_explosion_boost_shadow;
        break;
}

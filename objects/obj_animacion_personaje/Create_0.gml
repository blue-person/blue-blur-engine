// Otros
animacion_actual = 1;

// Determinar variables segun el personaje
switch (global.personaje_actual) {
    case "Sonic":
		if (nivel.obtener_permiso_reaparicion()) {
			sprite_index = spr_animacion_sonic_normal;
			image_speed = 0.20
		} else {
			sprite_index = spr_animacion_sonic_corriendo;
			image_speed = 0.45;
		}
        break;
    case "Shadow":
		if (nivel.obtener_permiso_reaparicion()) {
			sprite_index = spr_animacion_shadow_inmovil;
			image_speed = 0.20
		} else {
			sprite_index = spr_animacion_shadow_corriendo;
			image_speed = 0.75;
		}
        break;
}
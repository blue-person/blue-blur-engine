var valor_x_1 = x - dcos(image_angle) * 40;
var valor_y_1 = y - dsin(image_angle) * 24;
var valor_x_2 = x - dcos(image_angle) * 40;
var valor_y_2 = y + dsin(image_angle) * 24;

if (activar_evento and collision_line(valor_x_1, valor_y_1, valor_x_2, valor_y_2, obj_jugador, true, true)) {
	activar_evento = false;
	
    with (obj_jugador) {
        angulo = 0;
		
        if ((accion != 35) and (accion != 26)) {
            accion = 35;
			velocidad_horizontal = 1;
            x = self.x - dcos(image_angle) * 24;
            y = self.y + dsin(image_angle) * 24;

            audio_play_sound(snd_rodar, 1, false);
        }
    }
	
    if (instance_exists(obj_efecto_boost)) {
        obj_efecto_boost.activar_efecto = false;
    }
}

if (!place_meeting(x, y, obj_jugador)) {
	activar_evento = true;
}
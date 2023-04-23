if ((obj_jugador.cantidad_boost <= 0) or (obj_jugador.zona_superada)) {
	instance_destroy();
	exit;
}

// Declaracion de variables
image_speed = 0.4;
depth = obj_jugador.depth - 1;
image_alpha = 0;
image_angle = point_direction(obj_jugador.x_inicial, obj_jugador.y_inicial, x, y);

tiempo_impulso_aereo = 240;
activar_efecto = true;

// Gestion de la velocidad
obj_jugador.velocidad_horizontal = obj_jugador.limite_velocidad_horizontal * obj_jugador.direccion_horizontal;

// Crear los efectos visuales y de sonido
instance_create_depth(obj_jugador.x, obj_jugador.y, -2, obj_explosion_boost);
audio_play_sound(snd_inicio_boost, 1, false);
audio_play_sound(snd_bucle_boost, 1, false);
audio_play_sound(snd_velocidad_sonica, 1, true);

switch (global.personaje_actual) {
    case "Sonic":
		var audio_aleatorio = choose(snd_boost_sonic_a, snd_boost_sonic_b, snd_boost_sonic_c);
		reproducir_efecto_sonido(audio_aleatorio, 1, false);
        break;
	case "Shadow":
        var audio_aleatorio = choose(snd_boost_shadow_a, snd_boost_shadow_b, snd_boost_shadow_c);
		reproducir_efecto_sonido(audio_aleatorio, 1, false);
        break;
}


// Gestion de la vibracion
sacudir_camara(6, 25);
if (determinar_tipo_controles() != "teclado") then vibrar_gamepad(15);
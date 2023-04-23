if (activar_evento) {
    fisicas_esfera_casino();
	
    if (tocando_suelo) {
        velocidad_horizontal = limite_velocidad_horizontal * image_xscale;
        image_angle -= image_xscale * 20;
		
        if (collision_line(x, y, x + acos * 55, y + asin * 55, obj_superficie, true, true)) {
			esfera_se_estrello = true;
		}
		
        if (!audio_is_playing(snd_esfera_gigante_rodando)) {
			audio_play_sound(snd_esfera_gigante_rodando, 1, false);
		}
    }
} else {
	var verificar_pos_jugador = ((image_xscale == 1) and (x <= obj_jugador.x)) or ((image_xscale == -1) and (x >= obj_jugador.x));
    if ((distance_to_object(obj_jugador) <= 150) and verificar_pos_jugador and (y < obj_jugador.y)) {
        activar_evento = true;
        velocidad_vertical = 10;
    }
}

if (esfera_se_estrello) {
	instance_destroy();
}
if (instance_exists(obj_jugador)) {
	switch (obj_jugador.capa_actual) {
	    case 0:
	        sprite_index = spr_interruptor_rieles_azul
	        break;
	    case 1:
	        sprite_index = spr_interruptor_rieles_rojo
	        break;
	}
}

if (puede_usarse and place_meeting(x, y, obj_jugador)) {
    with (obj_jugador) {
		switch (capa_actual) {
		    case 0:
		        capa_actual = "posterior";
		        break;
		    case 1:
		        capa_actual = "frontal";
		        break;
		}
    }
    puede_usarse = false;
    image_index = 13;
    image_speed = 2;
	
    audio.reproducir_audio(snd_usar_interruptor_riel);
}

if (image_speed > 0) {
	image_speed -= 0.02;
} else {
    puede_usarse = true;
    image_speed = 0;
    image_index = 0;
}
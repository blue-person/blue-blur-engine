function sonido_pisadas_general(sonido_pisada_a, sonido_pisada_b) {
	if (!dando_pisadas and (image_index == 3 or image_index == 7 )) {
        dando_pisadas = true;
		
		if (pisada_actual == "a") {
			audio.reproducir_audio(sonido_pisada_a);
			pisada_actual = "b";
		} else {
			audio.reproducir_audio(sonido_pisada_b);
			pisada_actual = "a";
		}
        
    } else if (image_index != 3 and image_index != 7) {
		dando_pisadas = false;
	}
}

function sonido_pisadas_shadow(sonido_pisada_a, sonido_pisada_b) {
	if (sprite_index == spr_shadow_patinando_a) {
		if (!dando_pisadas and (image_index == 0 or image_index == 14)) {
			dando_pisadas = true;
			
			if (pisada_actual == "a") {
				audio.reproducir_audio(sonido_pisada_a);
				pisada_actual = "b";
			} else {
				audio.reproducir_audio(sonido_pisada_b);
				pisada_actual = "a";
			}
			audio.reproducir_audio_aleatorio([sonido_pisada_a, sonido_pisada_b]);
			
		} else if (image_index != 7 and image_index != 21) {
			dando_pisadas = false;
		}
	} else if (sprite_index == spr_shadow_patinando_b) {
		if (!dando_pisadas and (image_index == 4 or image_index == 21)) {
			dando_pisadas = true;
			
			if (pisada_actual == "a") {
				audio.reproducir_audio(sonido_pisada_a);
				pisada_actual = "b";
			} else {
				audio.reproducir_audio(sonido_pisada_b);
				pisada_actual = "a";
			}
		} else if (image_index != 0 and image_index != 17) {
			dando_pisadas = false;
		}
	}
}
function sonido_pisadas_general(sonido_pisada_a, sonido_pisada_b) {
	if (!dando_pisadas and (indice_sprite == 3 or indice_sprite == 7 )) {
        dando_pisadas = true;
		
		if (pisada_actual == "a") {
			audio.reproducir_audio(sonido_pisada_a);
			pisada_actual = "b";
		} else {
			audio.reproducir_audio(sonido_pisada_b);
			pisada_actual = "a";
		}
        
    } else if (indice_sprite != 3 and indice_sprite != 7) {
		dando_pisadas = false;
	}
}

function sonido_pisadas_shadow(sonido_pisada_a, sonido_pisada_b) {
	if (sprite_actual == spr_shadow_patinando_a) {
		if (!dando_pisadas and (indice_sprite == 0 or indice_sprite == 14)) {
			dando_pisadas = true;
			
			if (pisada_actual == "a") {
				audio.reproducir_audio(sonido_pisada_a);
				pisada_actual = "b";
			} else {
				audio.reproducir_audio(sonido_pisada_b);
				pisada_actual = "a";
			}
			audio.reproducir_audio_aleatorio([sonido_pisada_a, sonido_pisada_b]);
			
		} else if (indice_sprite != 7 and indice_sprite != 21) {
			dando_pisadas = false;
		}
	} else if (sprite_actual == spr_shadow_patinando_b) {
		if (!dando_pisadas and (indice_sprite == 4 or indice_sprite == 21)) {
			dando_pisadas = true;
			
			if (pisada_actual == "a") {
				audio.reproducir_audio(sonido_pisada_a);
				pisada_actual = "b";
			} else {
				audio.reproducir_audio(sonido_pisada_b);
				pisada_actual = "a";
			}
		} else if (indice_sprite != 0 and indice_sprite != 17) {
			dando_pisadas = false;
		}
	}
}
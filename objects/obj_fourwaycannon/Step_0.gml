if (!activar_evento) {
    lados.indice_sprite = 0;
    image_speed = 0;
    image_index = 0;
	
    if (puede_usarse and (obj_jugador.accion != 26) and place_meeting(x, y, obj_jugador)) {
		obj_jugador.accion = 21;
		
        cronometro = tiempo_cronometro;
        activar_evento = true;
        realizar_animacion = true;
		puede_usarse = false;
		
        audio_play_sound(snd_fourwaycannon_encender, 1, false);
        audio_play_sound(snd_fourwaycannon_cargando, 1, false);
    }   
} else if (activar_evento and (obj_jugador.accion == 21)) {
    if (realizar_animacion) {
        if (verificar_boton_mantenido("boton_arriba")) {
            if (lados.indice_sprite == 0) {
                lados.indice_sprite = 5;
                audio_play_sound(snd_fourwaycannon_apuntar, 1, false);
            }
			
            if ((lados.indice_sprite < 8) and (lados.indice_sprite >= 5)) {
                lados.fotograma += 0.5;
			}
			
            angulo_lados = 0;
        } else if (verificar_boton_mantenido("boton_derecha")) {
            if (lados.indice_sprite == 0) {
                lados.indice_sprite = 1;
                audio_play_sound(snd_fourwaycannon_apuntar, 1, false);
            }
			
            if ((lados.indice_sprite < 4) and (lados.indice_sprite >= 1)) {
				lados.fotograma += 0.5;
			}
			
            angulo_lados = 270;
        } else if (verificar_boton_mantenido("boton_izquierda")) {
            if (lados.indice_sprite == 0) {
                lados.indice_sprite = 9;
                audio_play_sound(snd_fourwaycannon_apuntar, 1, false);
            }
			
            if ((lados.indice_sprite < 12) and (lados.indice_sprite >= 9)) {
                lados.fotograma += 0.5;
			}
			
            angulo_lados = 90;
        } else if (verificar_boton_mantenido("boton_abajo")) {
            if (lados.indice_sprite == 0) {    
                lados.indice_sprite = 13;
                audio_play_sound(snd_fourwaycannon_apuntar, 1, false);
            }
			
            if ((lados.indice_sprite < 16) and (lados.indice_sprite >= 13)) {
				lados.fotograma += 0.5;
			}
			
            angulo_lados = 180;
        }
		
		if (verificar_boton_liberado("boton_arriba") or verificar_boton_liberado("boton_abajo") or verificar_boton_liberado("boton_derecha") or verificar_boton_liberado("boton_izquierda")) { 
			realizar_animacion = false;
		}
    } else {
        lados.fotograma -= 0.5;
		
        if ((lados.indice_sprite == 1) or (lados.indice_sprite == 5) or (lados.indice_sprite == 9) or (lados.indice_sprite == 13)) {   
            realizar_animacion = true;
            lados.indice_sprite = 0;
        }
    }
    
    obj_jugador.x = x;
    obj_jugador.y = y;
	
    image_speed += 0.5;
    --cronometro;
    if (cronometro <= 0) {
        activar_evento = false;
        obj_jugador.accion = 0;
        audio_play_sound(snd_fourwaycannon_timeout, 1, false);
    }
}

if (!place_meeting(x, y, obj_jugador) and (obj_jugador.accion != 21)) {
    if (audio_is_playing(snd_fourwaycannon_cargando)) {
		audio_stop_sound(snd_fourwaycannon_cargando);
	}
	
	puede_usarse = true;
    activar_evento = false;
    angulo_lados = 0;
    direccion_imagen = 0;
    realizar_animacion = true;
}
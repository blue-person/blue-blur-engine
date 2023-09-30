if (!activar_evento) {
    lados.image_index = 0;
    image_speed = 0;
    image_index = 0;
	
    if (puede_usarse and (obj_jugador.accion != 26) and place_meeting(x, y, obj_jugador)) {
		obj_jugador.accion = 21;
		
        cronometro = tiempo_cronometro;
        activar_evento = true;
        realizar_animacion = true;
		puede_usarse = false;
		
        audio.reproducir_audio(snd_fourwaycannon_encender);
        audio.reproducir_audio(snd_fourwaycannon_cargando);
    }   
} else if (activar_evento and (obj_jugador.accion == 21)) {
    if (realizar_animacion) {
        if (control.boton_mantenido("boton_arriba")) {
            if (lados.image_index == 0) {
                lados.image_index = 5;
                audio.reproducir_audio(snd_fourwaycannon_apuntar);
            }
			
            if ((lados.image_index < 8) and (lados.image_index >= 5)) {
                lados.fotograma += 0.5;
			}
			
            angulo_lados = 0;
        } else if (control.boton_mantenido("boton_derecha")) {
            if (lados.image_index == 0) {
                lados.image_index = 1;
                audio.reproducir_audio(snd_fourwaycannon_apuntar);
            }
			
            if ((lados.image_index < 4) and (lados.image_index >= 1)) {
				lados.fotograma += 0.5;
			}
			
            angulo_lados = 270;
        } else if (control.boton_mantenido("boton_izquierda")) {
            if (lados.image_index == 0) {
                lados.image_index = 9;
                audio.reproducir_audio(snd_fourwaycannon_apuntar);
            }
			
            if ((lados.image_index < 12) and (lados.image_index >= 9)) {
                lados.fotograma += 0.5;
			}
			
            angulo_lados = 90;
        } else if (control.boton_mantenido("boton_abajo")) {
            if (lados.image_index == 0) {    
                lados.image_index = 13;
                audio.reproducir_audio(snd_fourwaycannon_apuntar);
            }
			
            if ((lados.image_index < 16) and (lados.image_index >= 13)) {
				lados.fotograma += 0.5;
			}
			
            angulo_lados = 180;
        }
		
		if (control.boton_liberado("boton_arriba") or control.boton_liberado("boton_abajo") or control.boton_liberado("boton_derecha") or control.boton_liberado("boton_izquierda")) { 
			realizar_animacion = false;
		}
    } else {
        lados.fotograma -= 0.5;
		
        if ((lados.image_index == 1) or (lados.image_index == 5) or (lados.image_index == 9) or (lados.image_index == 13)) {   
            realizar_animacion = true;
            lados.image_index = 0;
        }
    }
    
    obj_jugador.x = x;
    obj_jugador.y = y;
	
    image_speed += 0.5;
    cronometro--;
    if (cronometro <= 0) {
        activar_evento = false;
        obj_jugador.accion = 0;
        audio.reproducir_audio(snd_fourwaycannon_timeout);
    }
}

if (!place_meeting(x, y, obj_jugador) and (obj_jugador.accion != 21)) {
    audio.detener_audio(snd_fourwaycannon_cargando);
	
	puede_usarse = true;
    activar_evento = false;
    angulo_lados = 0;
    direccion_imagen = 0;
    realizar_animacion = true;
}
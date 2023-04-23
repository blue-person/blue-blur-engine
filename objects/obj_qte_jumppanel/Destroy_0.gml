if (evento_finalizado) {
    if (obj_jugador.jump_panel < 5) {
        obj_jugador.accion = 24;
        obj_jugador.gravedad = 0.21875;
		++obj_jugador.jump_panel;  
		
        if (instance_exists(obj_mensaje_qte_triunfado)) {
            instance_destroy(obj_mensaje_qte_triunfado);
        }
		
		// Mensaje al completar el QTE
        var mensaje_triunfo = instance_create_depth(x, y, -100, obj_mensaje_qte_triunfado);
		mensaje_triunfo.respuesta_rapida = (tiempo_restante >= 66);
		mensaje_triunfo.respuesta_normal = (tiempo_restante >= 33);
		
		// Determinar puntaje
		if (mensaje_triunfo.respuesta_rapida) {
			global.puntaje_cool += 2500;
		} else if (mensaje_triunfo.respuesta_normal) {
			global.puntaje_cool += 1250;
		}
		
		// Sonido de triunfo
		audio_play_sound(snd_triunfar_jumppanel, 1, false);
    } else if (obj_jugador.jump_panel == 5) {
		reproducir_sonido_triunfar_qte();
    }
} else {
	obj_jugador.accion = 0;
    obj_jugador.jump_panel = 1;
    obj_jugador.gravedad = 0.21875;
	
	// Mensaje al fallar el QTE
    instance_create_depth(x, y, -100, obj_mensaje_qte_fallido);
}
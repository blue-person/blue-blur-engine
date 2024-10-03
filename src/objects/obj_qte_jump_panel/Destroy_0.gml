if (evento_finalizado) {
    if (jugador.jump_panel_actual != cantidad_jump_panels) {
		// Ajustar variables del jugador
        jugador.accion = 24;
        jugador.gravedad = 0.21875;
		jugador.jump_panel_actual++;  
		
		// Destruir el mensaje al triunfar anterior
        if (instance_exists(obj_mensaje_qte_triunfado)) {
            instance_destroy(obj_mensaje_qte_triunfado);
        }
		
		// Mensaje al completar el QTE
        var mensaje_triunfo = crear_elemento_gui(x, y, obj_mensaje_qte_triunfado);
		mensaje_triunfo.respuesta_rapida = (tiempo_restante >= 66);
		mensaje_triunfo.respuesta_normal = (tiempo_restante >= 33);
		
		// Determinar puntaje
		if (mensaje_triunfo.respuesta_rapida) {
			nivel.aumentar_puntaje_cool(2500);
		} else if (mensaje_triunfo.respuesta_normal) {
			nivel.aumentar_puntaje_cool(1250);
		}
		
		// Reproducir sonido
		audio.reproducir_audio(snd_triunfar_jump_panel);
    }
} else {
	// Ajustar variables del jugador
	jugador.accion = 0;
    jugador.gravedad = 0.21875;
    jugador.jump_panel_actual = 0;
	
	// Destruir el mensaje al triunfar anterior
	if (instance_exists(obj_mensaje_qte_triunfado)) {
		instance_destroy(obj_mensaje_qte_triunfado);
	}
	
	// Crear el mensaje al fallar
	crear_elemento_gui(x, y, obj_mensaje_qte_fallido);
}
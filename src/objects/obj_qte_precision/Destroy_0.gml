if (evento_finalizado) {
	obj_jugador.cantidad_eventos_qte = 1;
    obj_jugador.accion = 15;
    obj_jugador.velocidad_vertical = -8;
    obj_jugador.gravedad = 0.21875;
    obj_jugador.image_index = 0;

	// Mensaje al completar el QTE
	var mensaje_triunfo = instance_create_depth(x, y, -100, obj_mensaje_qte_triunfado);
	tiempo_restante += 0.5;
	mensaje_triunfo.respuesta_rapida = (tiempo_restante >= (limite_final_circulo_c - 0.5)) and (tiempo_restante <= (limite_inicial_circulo_c + 0.5));
	mensaje_triunfo.respuesta_normal = (tiempo_restante >= (limite_final_circulo_b - 0.5)) and (tiempo_restante <= (limite_inicial_circulo_b + 0.5));
	
	// Determinar puntaje
	if (mensaje_triunfo.respuesta_rapida) {
		nivel.aumentar_puntaje_cool(2500);
	} else if (mensaje_triunfo.respuesta_normal) {
		nivel.aumentar_puntaje_cool(1250);
	}
	
	// Sonido de triunfo
	audio.reproducir_audio(snd_triunfar_qte);
	
	// Sonido del jugador
    audio.reproducir_audio(obj_jugador.audio_festejo);
} else {
    obj_jugador.cantidad_eventos_qte = 1;
    obj_jugador.accion = 15.5;
    obj_jugador.velocidad_vertical = -3;
    obj_jugador.velocidad_horizontal = obj_jugador.direccion_horizontal * 3;
    obj_jugador.gravedad = 0.21875;
	obj_jugador.image_index = 0;
	
	// Mensaje al fallar el QTE
    instance_create_depth(x, y, -100, obj_mensaje_qte_fallido);
}
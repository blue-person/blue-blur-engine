lista_botones = [];

if (evento_finalizado) {
	global.puntaje_cool += 5000;
    obj_jugador.cantidad_eventos_qte = 1;
    obj_jugador.accion = 15;
    obj_jugador.velocidad_vertical = -8;
	obj_jugador.gravedad = 0.21875;
    obj_jugador.indice_sprite = 0;
			
	var mensaje_triunfo = instance_create_depth(x, y, -100, obj_mensaje_qte_triunfado);
	mensaje_triunfo.respuesta_rapida = (tiempo_restante >= 66);
	mensaje_triunfo.respuesta_normal = (tiempo_restante >= 33) and (tiempo_restante <= 55);
	
	// Determinar puntaje
	if (mensaje_triunfo.respuesta_rapida) {
		global.puntaje_cool += 5000;
	} else if (mensaje_triunfo.respuesta_normal) {
		global.puntaje_cool += 3000;
	}
	
	// Sonido de triunfo
	audio.reproducir_audio(snd_triunfar_qte);
		
	// Sonido del jugador
    reproducir_sonido_triunfar_qte();
}
else
{
    obj_jugador.cantidad_eventos_qte = 1;
    obj_jugador.accion = 15.5;
    obj_jugador.velocidad_vertical = -3;
    obj_jugador.velocidad_horizontal = obj_jugador.direccion_horizontal * 3;
	obj_jugador.gravedad = 0.21875;
    obj_jugador.indice_sprite = 0;
	
	// Mensaje al fallar el QTE
    instance_create_depth(x, y, -100, obj_mensaje_qte_fallido);
}
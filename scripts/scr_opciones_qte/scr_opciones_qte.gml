function OpcionQTE(_indice_boton, _pos_x, _pos_y, _escala_x, _escala_y, _transparencia, _finalizado) constructor {
    indice_boton = _indice_boton;
    pos_x = _pos_x;
    pos_y = _pos_y;
    escala_x = _escala_x;
    escala_y = _escala_y;
    transparencia = _transparencia;
    finalizado = _finalizado;
}

function verificar_opcion_qte(_limite_tiempo, opcion_requerida, lista_botones) {
	var limite_tiempo = _limite_tiempo;
	var boton_aleatorio = lista_botones[opcion_requerida.indice_boton];
	
	if (boton_aleatorio.estado_pulsado) {
		opcion_requerida.finalizado = true;
	} else {
		for (var i = 0; i < array_length(lista_botones); i++) {
			var boton_actual = lista_botones[i];
	        if (boton_actual != boton_aleatorio) {
				if (boton_actual.estado_pulsado) then limite_tiempo = 0;
			}
	    }
	}
	
	if (opcion_requerida.finalizado) {
		audio_play_sound(snd_triunfar_boton_qte, 1, false);
	}
	
	return limite_tiempo;
}
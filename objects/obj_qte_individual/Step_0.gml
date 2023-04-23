limite_tiempo -= 1.5;

if (!evento_finalizado and (transparencia_boton < 1)) then transparencia_boton += 0.125;
if (evento_finalizado and (transparencia_boton == 0)) then instance_destroy();

if (limite_tiempo > 0) {
	if (boton_aleatorio.estado_pulsado) {
		evento_finalizado = true;
	} else {
		for (var i = 0; i < array_length(lista_botones); i++) {
			var boton_actual = lista_botones[i];
	        if (boton_actual != boton_aleatorio) {
				if (boton_actual.estado_pulsado) then limite_tiempo = 0;
			}
	    }
	}

    if (evento_finalizado) {
        tiempo_restante = limite_tiempo;
        limite_tiempo = 0;
    }
} else {
    if (evento_finalizado) {
        transparencia_boton -= 0.25;
        escala_x_boton += 0.125;
        escala_y_boton += 0.125;
    } else {
        instance_destroy();
    }
}
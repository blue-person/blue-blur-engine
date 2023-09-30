limite_tiempo -= incremento_tiempo;

if (limite_tiempo > 0) {
	for (var i = 0; i < array_length(lista_opciones_qte); i++) {
		var opcion_actual = lista_opciones_qte[i];
		if (!opcion_actual.finalizado and opcion_actual.transparencia < 1) {
			opcion_actual.transparencia += 0.125;
		}
	}
	
	var boton_a_finalizado = lista_opciones_qte[0].finalizado;
	var boton_b_finalizado = lista_opciones_qte[1].finalizado;
	var boton_c_finalizado = lista_opciones_qte[2].finalizado;
	
	if (!boton_a_finalizado and !boton_b_finalizado and !boton_c_finalizado) {
		limite_tiempo = verificar_opcion_qte(limite_tiempo, lista_opciones_qte[0], lista_botones);
	} else if (boton_a_finalizado and !boton_b_finalizado and !boton_c_finalizado) {
        limite_tiempo = verificar_opcion_qte(limite_tiempo, lista_opciones_qte[1], lista_botones);
    } else if (boton_a_finalizado and boton_b_finalizado and !boton_c_finalizado) {
        limite_tiempo = verificar_opcion_qte(limite_tiempo, lista_opciones_qte[2], lista_botones);
    } else {
        evento_finalizado = true;
        tiempo_restante = limite_tiempo;
        limite_tiempo = 0;
    }
} else {
    instance_destroy();
}

if (!evento_finalizado and (limite_tiempo > 0)) {
	for (var i = 0; i < array_length(lista_opciones_qte); i++) {
		var opcion_actual = lista_opciones_qte[i];
		if (opcion_actual.finalizado and opcion_actual.transparencia > 0) {
			opcion_actual.transparencia -= 0.125;
			opcion_actual.escala_x += 0.125;
			opcion_actual.escala_y += 0.125;
		}
	}
}
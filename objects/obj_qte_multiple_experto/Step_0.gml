limite_tiempo -= incremento_tiempo;

if (limite_tiempo > 0) {
	for (var i = 0; i < array_length(lista_opciones_qte); ++i) {
		var opcion_actual = lista_opciones_qte[i];
		if (!opcion_actual.finalizado and opcion_actual.transparencia < 1) {
			opcion_actual.transparencia += 0.125;
		}
	}
	
	var opcion_a_finalizada = lista_opciones_qte[0].finalizado;
	var opcion_b_finalizada = lista_opciones_qte[1].finalizado;
	var opcion_c_finalizada = lista_opciones_qte[2].finalizado;
	var opcion_d_finalizada = lista_opciones_qte[3].finalizado;
	var opcion_e_finalizada = lista_opciones_qte[4].finalizado;
	
	if (!opcion_a_finalizada and !opcion_b_finalizada and !opcion_c_finalizada and !opcion_d_finalizada and !opcion_e_finalizada) {
		limite_tiempo = verificar_opcion_qte(limite_tiempo, lista_opciones_qte[0], lista_botones);
	} else if (opcion_a_finalizada and !opcion_b_finalizada and !opcion_c_finalizada and !opcion_d_finalizada and !opcion_e_finalizada) {
        limite_tiempo = verificar_opcion_qte(limite_tiempo, lista_opciones_qte[1], lista_botones);
    } else if (opcion_a_finalizada and opcion_b_finalizada and !opcion_c_finalizada and !opcion_d_finalizada and !opcion_e_finalizada) {
        limite_tiempo = verificar_opcion_qte(limite_tiempo, lista_opciones_qte[2], lista_botones);
    } else if (opcion_a_finalizada and opcion_b_finalizada and opcion_c_finalizada and !opcion_d_finalizada and !opcion_e_finalizada) {
        limite_tiempo = verificar_opcion_qte(limite_tiempo, lista_opciones_qte[3], lista_botones);
    } else if (opcion_a_finalizada and opcion_b_finalizada and opcion_c_finalizada and opcion_d_finalizada and !opcion_e_finalizada) {
        limite_tiempo = verificar_opcion_qte(limite_tiempo, lista_opciones_qte[4], lista_botones);
    } else {
        evento_finalizado = true;
        tiempo_restante = limite_tiempo;
        limite_tiempo = 0;
    }
} else {
    instance_destroy();
}

if (!evento_finalizado and (limite_tiempo > 0)) {
	for (var i = 0; i < array_length(lista_opciones_qte); ++i) {
		var opcion_actual = lista_opciones_qte[i];
		if (opcion_actual.finalizado and opcion_actual.transparencia > 0) {
			opcion_actual.transparencia -= 0.125;
			opcion_actual.escala_x += 0.125;
			opcion_actual.escala_y += 0.125;
		}
	}
}
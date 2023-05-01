if (limite_tiempo > 0) {
	for (var i = 0; i < array_length(lista_opciones_qte); ++i) {
		var opcion_actual = lista_opciones_qte[i];
	    var pos_x = opcion_actual.pos_x;
	    var pos_y = opcion_actual.pos_y;
	    var escala_x = opcion_actual.escala_x;
	    var escala_y = opcion_actual.escala_y;
	    var transparencia = opcion_actual.transparencia;
		
		var boton_aleatorio = lista_botones[opcion_actual.indice_boton];
		var icono_boton = input_binding_get_icon(input_binding_get(boton_aleatorio));
		
		draw_sprite_ext(icono_boton, 0, pos_x, pos_y, escala_x, escala_y, 0, c_white, transparencia);
	}
	
	draw_healthbar(pos_x_1, pos_y_1, pos_x_2, pos_y_2, limite_tiempo, c_dkgray, c_green, c_lime, 0, true, false);	
}
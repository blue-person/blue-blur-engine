limite_tiempo = 100;
tiempo_restante = 0;
evento_finalizado = false;

if (input_source_using(INPUT_KEYBOARD)) {
	lista_botones = ["boton_izquierda", "boton_abajo", "boton_arriba", "boton_derecha"];
} else {
	lista_botones = ["boton_salto", "boton_boost", "boton_ataque", "boton_especial"];
}

indice_aleatorio = choose(0, 1, 2, 3);
boton_aleatorio = lista_botones[indice_aleatorio];
icono_boton = input_binding_get_icon(input_binding_get(boton_aleatorio));
transparencia_boton = 0;
escala_x_boton = 1;
escala_y_boton = 1;
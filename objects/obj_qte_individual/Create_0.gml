limite_tiempo = 100;
tiempo_restante = 0;
evento_finalizado = false;

var tipo_controles = determinar_tipo_controles();
if (tipo_controles == "teclado") {
	lista_botones = [obj_controles.boton_izquierda, obj_controles.boton_abajo, obj_controles.boton_arriba, obj_controles.boton_derecha];
} else {
	lista_botones = [obj_controles.boton_salto, obj_controles.boton_boost, obj_controles.boton_ataque, obj_controles.boton_especial];
}

sprites_controles = determinar_sprites_controles();
indice_aleatorio = choose(0, 1, 2, 3);
boton_aleatorio = lista_botones[indice_aleatorio];
transparencia_boton = 0;
escala_x_boton = 1;
escala_y_boton = 1;
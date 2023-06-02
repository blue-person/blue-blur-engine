limite_tiempo = 100;
tiempo_restante = 0;
evento_finalizado = false;

lista_botones = determinar_botones_qte();

indice_aleatorio = choose(0, 1, 2, 3);
boton_aleatorio = lista_botones[indice_aleatorio];
icono_boton = control.obtener_icono_boton(boton_aleatorio);
transparencia_boton = 0;
escala_x_boton = 1;
escala_y_boton = 1;
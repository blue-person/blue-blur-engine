// Variables del objeto
limite_tiempo = 100;
incremento_tiempo = 0.75;
tiempo_restante = 0;
evento_finalizado = false;

// Variables temporales para las posiciones
mitad_ancho = graficos.obtener_ancho() / 2;
mitad_altura = graficos.obtener_altura()  / 2;
distancia_separacion = 30;

// Posicion de la barra de tiempo
pos_x_1 = (mitad_ancho - distancia_separacion) - 25;
pos_y_1 = mitad_altura + 25;
pos_x_2 = (mitad_ancho + distancia_separacion) + 25;
pos_y_2 = mitad_altura + 28;

// Determinar que botones seran usados
lista_botones = determinar_botones_qte();

// Crear estructura de los botones del evento QTE
lista_opciones_qte = [
	// Boton 1
    new OpcionQTE(choose(0, 1, 2, 3), (mitad_ancho - distancia_separacion), mitad_altura, 1, 1, 0, false),
	// Boton 2
    new OpcionQTE(choose(0, 1, 2, 3), mitad_ancho, mitad_altura, 1, 1, 0, false),
	// Boton 3
	new OpcionQTE(choose(0, 1, 2, 3), (mitad_ancho + distancia_separacion), mitad_altura, 1, 1, 0, false)
];
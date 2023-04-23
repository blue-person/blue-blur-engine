event_inherited();
incremento_tiempo = 1.10;

// Crear estructura de los botones del evento QTE
lista_opciones_qte = [
	// Boton 1
    new OpcionQTE(choose(0, 1, 2, 3), (mitad_ancho - distancia_separacion * 2), mitad_altura, 1, 1, 0, false),
	// Boton 2
    new OpcionQTE(choose(0, 1, 2, 3), (mitad_ancho - distancia_separacion), mitad_altura, 1, 1, 0, false),
	// Boton 3
	new OpcionQTE(choose(0, 1, 2, 3), mitad_ancho, mitad_altura, 1, 1, 0, false),
	// Boton 4
	new OpcionQTE(choose(0, 1, 2, 3), (mitad_ancho + distancia_separacion), mitad_altura, 1, 1, 0, false),
	// Boton 5
	new OpcionQTE(choose(0, 1, 2, 3), (mitad_ancho + distancia_separacion * 2), mitad_altura, 1, 1, 0, false)
];
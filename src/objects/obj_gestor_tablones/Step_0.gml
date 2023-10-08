// Modificar los valores en base a la posicion del jugador
if (jugador != noone) {
	// Calcular el punto de tension del puente y sus gradientes
	var pos_x_1 = x;
	var pos_y_1 = y - 2;
	var pos_x_2 = x + ancho_puente;
	var pos_y_2 = y + maxima_tension_puente;
	var no_esta_colisionando = not collision_rectangle(pos_x_1, pos_y_1, pos_x_2, pos_y_2, jugador, true, true);
	if (no_esta_colisionando or not jugador.tocando_suelo) {
		// Eliminar el peso de los tablones
		for (var i = 0; i < cantidad_tablones; i++) {
		    pesos_tablones[i] = 0;
		}
	} else {
		// Variables
		var valor_a = max(floor(posicion / 16), 0);
		var valor_b = cantidad_tablones - 1;
        var punto_tension = min(valor_a, valor_b);
		
        var gradiente_izquierdo  = division_segura(pi * 0.5, punto_tension);
        var gradiente_derecho = division_segura(pi * 0.5, cantidad_tablones - punto_tension);
		
        var parte_izquierda = 0;
        var parte_derecha = pi;
		
		var valor_absoluto = abs(floor(posicion - ancho_medio_puente) / ancho_medio_puente);
        var distancia_al_centro = maxima_tension_puente * (1 - valor_absoluto);
		
        // Reposicionar todos los tablones
        for (var i = 0; i <= punto_tension; i++) {
            var peso_actual = sin(parte_izquierda) * distancia_al_centro;
            if (pesos_tablones[i] < peso_actual) {
                pesos_tablones[i] = peso_actual;
            }
            parte_izquierda += gradiente_izquierdo;
        }

        for (var i = cantidad_tablones - 1; i > punto_tension; i--) {
            var peso_actual = sin(parte_derecha) * distancia_al_centro;
            if (pesos_tablones[i] < peso_actual) {
                pesos_tablones[i] = peso_actual;
            }
            parte_derecha -= gradiente_derecho;
        }
	}
	
	// Cambiar altura de los tablones
	for (var i = 0; i < cantidad_tablones; i++) {
		var punto_inicial = tablones[i].y;
		var punto_final = y + pesos_tablones[i];
	    tablones[i].y += interpolacion_lineal(punto_inicial, punto_final, 0.2);
	}
}
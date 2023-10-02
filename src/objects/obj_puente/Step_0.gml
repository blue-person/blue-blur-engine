for (var n = 0; n < cantidad_tablones; n++) {
    pesos_tablones[n] = 0;
}

if (instance_exists(obj_jugador)) {
	var cantidad_instancias_jugador = instance_number(obj_jugador);

    for (var n = 0; n < cantidad_instancias_jugador; n++) {
        var instancia_jugador = instance_find(obj_jugador, n);
        var posicion = instancia_jugador.x - x;

        if (instancia_jugador == noone) {
            continue;
        }

        if (!collision_rectangle(x, y - 2, x + ancho_puente, y + maxima_tension_puente, instancia_jugador, true, true) or !instancia_jugador.tocando_suelo) {
            continue;
        }

        // Calcular el punto de tension del puente y sus gradientes
        var punto_tension = min(max(floor(posicion / 16), 0), cantidad_tablones - 1);
        var gradiente_izquierdo  = division_segura(pi * 0.5, punto_tension);
        var gradiente_derecho = division_segura(pi * 0.5, cantidad_tablones - punto_tension);
        var parte_izquierda = 0;
        var parte_derecha = pi;
        var distancia_al_centro = maxima_tension_puente * (1 - (abs(floor(posicion - ancho_medio_puente) / ancho_medio_puente)));
		
        // Reposicionar todos los tablones
        for (var i = 0; i <= punto_tension; i++) {
            peso_actual = sin(parte_izquierda) * distancia_al_centro;

            if (pesos_tablones[i] < peso_actual) {
                pesos_tablones[i] = peso_actual;
            }

            parte_izquierda += gradiente_izquierdo;
        }

        for (var i = cantidad_tablones - 1; i > punto_tension; i--) {
            peso_actual = sin(parte_derecha) * distancia_al_centro;

            if (pesos_tablones[i] < peso_actual) {
                pesos_tablones[i] = peso_actual;
            }

            parte_derecha -= gradiente_derecho;
        }
    }
}

// Cambiar altura de los tablones
for (var n = 0; n < cantidad_tablones; n++) {
    tablones[n].y += interpolacion_lineal(tablones[n].y, y + pesos_tablones[n], 0.2);
}
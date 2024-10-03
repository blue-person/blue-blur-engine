if (jugador_existe) {
	// Anular la altura de los nodos
    for (var i = 0; i < cantidad_nodos; ++i) {
        nodos[i].altura = 0;
    }

	// Determinar si se esta tocando el puente
	var pos_x_1 = x;
	var pos_y_1 = y - 2;
	var pos_x_2 = x + ancho_puente;
	var pos_y_2 = y + tension_maxima;
    var colision_con_jugador = collision_rectangle(pos_x_1, pos_y_1, pos_x_2, pos_y_2, jugador, true, true);
	
	// Gestionar la posicion de los nodos
    if (colision_con_jugador and jugador.tocando_suelo) {
        // Determinar punto de tension
        var posicion_jugador = jugador.x - x;
        var valor_a = max(0, floor(posicion_jugador / 16));
        var valor_b = cantidad_nodos - 1;
        var punto_tension = min(valor_a, valor_b);

        // Determinar gradientes
        var mitad_pi = pi * 0.5;
        var gradiente_izquierda = division_segura(mitad_pi, punto_tension);
        var gradiente_derecha = division_segura(mitad_pi, cantidad_nodos - punto_tension);

        // Determinar angulos
        var angulo_izquierdo = 0;
        var angulo_derecho = pi;

        // Determinar distancia desde el centro
        var dividendo = floor(posicion_jugador - mitad_ancho_puente);
        var multiplicador = 1 - (abs(dividendo / mitad_ancho_puente));
        var distancia_desde_centro = tension_maxima * multiplicador;

        // Reposicionar nodos izquierdos
        for (var i = 0; i <= punto_tension; ++i) {
            // Variables
            var altura_actual = sin(angulo_izquierdo) * distancia_desde_centro;

            // Reposicionar
            if (nodos[i].altura < altura_actual) {
                nodos[i].altura = altura_actual;
            }

            // Ajustar angulo
            angulo_izquierdo += gradiente_izquierda;
        }

        // Reposicionar nodos derechos
        for (var i = cantidad_nodos - 1; i > punto_tension; --i) {
            // Variables
            var altura_actual = sin(angulo_derecho) * distancia_desde_centro;

            // Reposicionar
            if (nodos[i].altura < altura_actual) {
                nodos[i].altura = altura_actual;
            }

            // Ajustar angulo
            angulo_derecho -= gradiente_derecha;
        }
    }

    // Cambiar altura de los nodos
    for (var i = 0; i < cantidad_nodos; ++i) {
        // Variables
        var altura_actual = nodos[i].objeto.y;
        var nueva_altura = y + nodos[i].altura;

        // Ajustar la altura
        nodos[i].objeto.y = altura_actual + (nueva_altura - altura_actual) * 0.2;
    }
}
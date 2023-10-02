// Reducir la transparencia si es mayor a 0
if (parametros_transiciones.negra.transparencia > 0) {
    parametros_transiciones.negra.transparencia -= 0.05;
}

// Cambiar la animación del personaje si la transparencia es 0.05
if (parametros_transiciones.negra.transparencia == 0.05) {
    animacion_personaje = 1;
}

// Control de la animación de presentación
switch (animacion_presentacion) {
    case 1:
        // Reducir la velocidad de presentación y ajustar la barra diagonal
        if (velocidad_presentacion < 9) {
            if (parametros_barra_diagonal.angulo > 0) {
                parametros_barra_diagonal.angulo -= 2;
            } else {
                parametros_barra_diagonal.angulo = 0;
                if (not alarm[0]) then alarm[0] = duracion_primera_fase;
            }
        }
		
        transparencia_marcos += 0.05;
        velocidad_presentacion = (velocidad_presentacion > 1) ? velocidad_presentacion - 0.18 : 1;
        break;
    case 2:
        // Cambiar la transparencia y ajustar la barra diagonal
        transparencia_marcos -= 0.15;
        velocidad_presentacion += 0.18;
		
        if (parametros_barra_diagonal.angulo > -70) {
            parametros_barra_diagonal.angulo -= 2;
        }
        break;
    case 3:
        // Cambiar la transparencia y ajustar la transición morada
        transparencia_marcos -= 0.15;
        velocidad_presentacion += 0.18;
        parametros_transiciones.morada.transparencia -= 0.2;
		
		// Verificar estado de la transicion
		if (parametros_transiciones.morada.transparencia <= 0) {
			// Mostrar la HUD y destruir la instancia
			hud.mostrar();
			instance_destroy();
		} else if (parametros_transiciones.morada.transparencia <= 0.9) {
			// Dar movimiento inicial al jugador
			with (jugador) {
				tocando_suelo = true;
				permitir_movimiento = true;
	
				if (not nivel.obtener_permiso_reaparicion()) {
					velocidad_horizontal = 9;
					direccion_horizontal = 1;
				}
			}
        }
        break;
}

// Control de la animación del personaje
if (animacion_personaje == 1) {
    if ((animacion_presentacion == 2) and (transparencia_marcos < 0.7)) {
        animacion_personaje = 2;
    }
} else if (animacion_personaje == 2) {
    // Interpolación lineal de la posición del personaje
    parametros_personaje.pos_x_actual += interpolacion_lineal(parametros_personaje.pos_x_actual, parametros_personaje.pos_x_final, 15);
    parametros_personaje.pos_y_actual += interpolacion_lineal(parametros_personaje.pos_y_actual, parametros_personaje.pos_y_final, 15);
    
    // Cambiar la animación de presentación si la posición se acerca
    var diferencia_posicion = abs(parametros_personaje.pos_x_final - parametros_personaje.pos_x_actual);
    if (diferencia_posicion <= 0.1) {
        animacion_presentacion = 3;
    }
}

// Mover texto de nombre y objetivo del nivel
parametros_nombre_nivel.texto.pos_x += velocidad_presentacion;
parametros_objetivo_nivel.texto.pos_x -= velocidad_presentacion;
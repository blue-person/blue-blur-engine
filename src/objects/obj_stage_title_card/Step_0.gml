if (parametros_transiciones.negra.transparencia > 0) {
	parametros_transiciones.negra.transparencia -= 0.05;
}

if (parametros_transiciones.negra.transparencia == 0.05) {
	animacion_personaje = 1;
}

switch (animacion_presentacion) {
    case 1:
        if (velocidad_presentacion < 9) {
	        if (parametros_barra_diagonal.angulo > 0) {
				parametros_barra_diagonal.angulo -= 2;
			} else {
	            parametros_barra_diagonal.angulo = 0;
				
				if (not alarm[0]) {
					alarm[0] = duracion_primera_fase;
				}
	        }
	    }
	    transparencia_marcos += 0.05;
	    if (velocidad_presentacion > 1) {
			velocidad_presentacion -= 0.18;
		} else {
	        velocidad_presentacion = 1;	
		}
        break;
    case 2:
	    transparencia_marcos -= 0.15;
	    velocidad_presentacion += 0.18;
        if (parametros_barra_diagonal.angulo > -70) {
			parametros_barra_diagonal.angulo -= 2;
		}
        break;
    case 3:
	    transparencia_marcos -= 0.15;
	    velocidad_presentacion += 0.18;
	    parametros_transiciones.morada.transparencia -= 0.2;
	    if (parametros_transiciones.morada.transparencia <= 0) {
			hud.mostrar();
			instance_destroy();
		}
        break;
}

switch (animacion_personaje) {
    case 1:
		if ((animacion_presentacion == 2) and (transparencia_marcos < 0.7)) {
		    animacion_personaje = 2;
		}
        break;
    case 2:
		parametros_personaje.pos_actual.pos_x = lerp(parametros_personaje.pos_actual.pos_x, parametros_personaje.pos_final.pos_x, 0.15);
		parametros_personaje.pos_actual.pos_y = lerp(parametros_personaje.pos_actual.pos_y, parametros_personaje.pos_final.pos_y, 0.15);
		
	    if (parametros_personaje.pos_actual.pos_x <= parametros_personaje.pos_final.pos_x) {
	        animacion_personaje = 3;
		
			if (not alarm[1]) {
				alarm[1] = graficos.obtener_velocidad_juego() / 2;
			}
	    }
        break;
	case 3:
		parametros_personaje.pos_actual.pos_x = parametros_personaje.pos_final.pos_x;
		parametros_personaje.pos_actual.pos_y = parametros_personaje.pos_final.pos_y;
		break;
}

parametros_nombre_nivel.texto.pos_x += velocidad_presentacion;
parametros_objetivo_nivel.texto.pos_x -= velocidad_presentacion;
if (transparencia_transicion_negra > 0) {
	transparencia_transicion_negra -= 0.05;
}

if (transparencia_transicion_negra == 0.05) {
	instance_create_depth(x, y, -101, obj_animacion_personaje);
}

switch (animacion_actual) {
    case 1:
        if (velocidad_presentacion < 9) {
	        if (angulo_salida > 0) {
				angulo_salida -= 2;
			} else {
	            angulo_salida = 0;
				
				if (alarm[0] == -1) {
					alarm[0] = 120;
				}
	        }
	    }
        break;
    case 2:
        if (angulo_salida > -70) {
			angulo_salida -= 2;
		}
        break;
    case 3:
	    transparencia_transicion_gris -= 0.2;
	    if (transparencia_transicion_gris <= 0) {
			instance_destroy();
		}
        break;
}

if (animacion_actual < 2) {
    transparencia_barra += 0.05;
    if (velocidad_presentacion > 1) {
		velocidad_presentacion -= 0.18;
	} else {
        velocidad_presentacion = 1;	
	}
} else {
    transparencia_barra -= 0.15;
    velocidad_presentacion += 0.18;
}

pos_x_nombre += velocidad_presentacion;
pos_x_mision -= velocidad_presentacion;
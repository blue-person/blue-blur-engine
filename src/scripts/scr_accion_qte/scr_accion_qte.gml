function gestion_evento_qte() {
	// Iniciar evento Quick Time Event
    if (accion == 14) {
        gravedad = 0;

        if (direccion_horizontal == 1) {
            if (velocidad_horizontal > 0) {
                velocidad_horizontal -= 0.125;
            } else {
                velocidad_horizontal = 0.625;
            }
        } else {
            if (velocidad_horizontal < 0) {
                velocidad_horizontal += 0.125;
            } else {
                velocidad_horizontal = -0.625;
            }
        }
		
        if (velocidad_vertical < 0) {
            velocidad_vertical += 0.125;
        } else {
            velocidad_vertical = 0;
        }
    }

    // Superar evento Quick Time Event
    if (accion == 15) {
        velocidad_horizontal = direccion_horizontal * 9;
        if (tocando_suelo) {
            accion = 0;
        }
    }

    // Fallar evento Quick Time Event
    if (accion == 15.5) {
        velocidad_horizontal += direccion_horizontal * aceleracion * 2;

        if (tocando_suelo) {
            accion = 0;
        }
    }
}
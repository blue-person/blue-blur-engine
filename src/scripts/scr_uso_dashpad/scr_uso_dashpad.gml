function gestion_uso_dashpad() {
	if (accion == 8) {
        if (velocidad_horizontal > 0) {
            velocidad_horizontal = limite_velocidad_maxima;
        } else if (velocidad_horizontal < 0) {
            velocidad_horizontal = -limite_velocidad_maxima;
        }
    }
}
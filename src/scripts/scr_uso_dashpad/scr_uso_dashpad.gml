function gestion_uso_dashpad() {
	if (accion == 8) {
		velocidad_horizontal = clamp(velocidad_horizontal, -limite_velocidad_maxima, limite_velocidad_maxima);
    }
}
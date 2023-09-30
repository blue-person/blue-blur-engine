function gestion_uso_bungee() {
	if (accion == 30) {
        velocidad_horizontal = 0;
        velocidad_vertical -= 0.5;
    }

    if (accion == 31) {
        velocidad_horizontal = 0;
        velocidad_vertical = 0;

        if (image_index >= 16) {
            accion = 0;
        }
    }
}
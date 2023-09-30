function gestion_accion_herirse() {
	if (accion == 22) {
        if (tocando_suelo) {
            velocidad_horizontal = 0;
            velocidad_vertical = 0;
        }

        if (image_index >= 21) {
            image_index = 0;
            accion = 0;
        }
    }
}
function gestion_uso_trampolin() {
	if (accion == 5) {
        if (velocidad_horizontal > 0) {
            direccion_horizontal = 1;
        } else if (velocidad_horizontal < 0) {
            direccion_horizontal = -1;
        }

        if (tocando_suelo) {
            accion = 0;
        }
    }
}
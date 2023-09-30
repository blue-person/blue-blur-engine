function gestion_accion_morir() {
	if (accion == 26) {
        if (tocando_suelo) {
            velocidad_horizontal = 0;
            velocidad_vertical = 0;
        }
    }
}
function gestion_uso_dashramp() {
	if (accion == 7) {
        velocidad_horizontal = direccion_horizontal * 12;

        if (tocando_suelo) {
            accion = 0;
        }
    }
}
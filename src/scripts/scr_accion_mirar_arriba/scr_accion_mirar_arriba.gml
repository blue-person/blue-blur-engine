function gestion_accion_mirar_arriba() {
	// Mirar hacia arriba
	if (control.boton_mantenido("boton_arriba") and tocando_suelo and (accion == 0)) {
        if (abs(velocidad_horizontal) < 0.2) {
            velocidad_horizontal = 0;
            accion = -3;
            image_index = 0;
        }
    }
	
	// Dejar de mirar arriba
    if ((accion == -3) and !control.boton_mantenido("boton_arriba") and (image_index >= 5)) {
        accion = 0;
    }
}
if (control.boton_mantenido("boton_especial")) {
	if ((obj_jugador.tocando_suelo) and (abs(obj_jugador.velocidad_horizontal) == 0) and (obj_jugador.accion == 0)) {
		transicion.iniciar_efecto_basico("negro", 0.05);
		
		if (alarm[0] == -1) {
			alarm[0] = 15;
		}
	}
}
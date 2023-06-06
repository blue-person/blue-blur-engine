if (permitir_depuracion) {
	if (pantalla.obtener_modo_pantalla() == "ventana") {
		pantalla.iniciar_modo_pantalla_completa();
	} else {
		pantalla.iniciar_modo_ventana();
	}
}
if (permitir_depuracion and permitir_modificar_modo_pantalla) {
	if (pantalla.obtener_modo_pantalla() == "ventana") {
		pantalla.iniciar_modo_pantalla_completa();
	} else {
		pantalla.iniciar_modo_ventana();
	}
}
if (permitir_depuracion and permitir_modificar_modo_pantalla) {
	if (graficos.obtener_modo_pantalla() == "ventana") {
		graficos.iniciar_modo_pantalla_completa();
	} else {
		graficos.iniciar_modo_ventana();
	}
}
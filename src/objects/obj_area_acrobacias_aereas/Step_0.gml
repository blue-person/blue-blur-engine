if (activar_efecto and jugador_existe) {
    if (jugador.accion != 26) {
		// Determinar si se esta cerca del objeto
		if (distance_to_object(jugador) <= 115) {
			// Determinar si se desea interactuar
			var colisionando_con_jugador = place_meeting(x, y, jugador);
			var jugador_volando = not jugador.tocando_suelo;
			
			if (colisionando_con_jugador and jugador_volando and controles.boton_presionado("boton_especial")) {
				// Ajustar efectos
				activar_efecto = false;
				audio.reproducir_audio(snd_acrobacia_aerea);
				audio.reproducir_audio(snd_rainbowring);
				dibujar_efectos(spr_efecto_acrobacias_aereas);
				
				// Cambiar parametros del jugador
				jugador.accion = 15;
			    jugador.velocidad_vertical = -cantidad_fuerza;
				jugador.image_index = 0;
			}
			
			// Ajustar transparencia del boton
			if (boton.transparencia < 1) then boton.transparencia += 0.2;
		} else {
			// Ajustar transparencia del boton
			if (boton.transparencia >= 0) then boton.transparencia -= 0.2;
		}
	}
} else if (not activar_efecto) {
	// Disminuir visibilidad
    image_xscale -= 0.1;
    image_yscale -= 0.1;
    image_alpha -= 0.1;
    
	// Destruir
    if (image_alpha <= 0) {
		instance_destroy();
	}
}
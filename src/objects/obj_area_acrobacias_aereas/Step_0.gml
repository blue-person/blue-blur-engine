if (activar_efecto and jugador_existe) {
	var jugador_esta_vivo = jugador.accion != 26;
	var colision_con_jugador = collision_circle(x, y, 35, jugador, true, true);
	
    if (jugador_esta_vivo and colision_con_jugador) {
		var jugador_saltando = (jugador.accion == 4) or (jugador.accion == 4.5);
		var jugador_intentando_saltar = controles.boton_presionado("boton_salto") and (not jugador.tocando_suelo);
		
		if (jugador_saltando or jugador_intentando_saltar) {
	        jugador.accion = 15;
	        jugador.velocidad_vertical = -cantidad_fuerza;
	        jugador.image_index = 0;
		
	        audio.reproducir_audio(snd_acrobacia_aerea);
	        audio.reproducir_audio(snd_rainbowring);
	        dibujar_efectos(spr_efecto_acrobacias_aereas);

			activar_efecto = false;
	    }
		
		if (transparencia_icono < 1) then transparencia_icono += 0.2;
	} else if (not colision_con_jugador) {
		if (transparencia_icono > 0) then transparencia_icono -= 0.2;
	}
} else {
    image_xscale -= 0.1;
    image_yscale -= 0.1;
    image_alpha -= 0.1;
    
    if (image_alpha <= 0) {
		instance_destroy();
	}
}
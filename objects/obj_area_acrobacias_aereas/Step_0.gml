if (activar_efecto) {
	var jugador_vivo = obj_jugador.accion != 26;
	var colision_con_jugador = collision_circle(x, y, 35, obj_jugador, true, true);
	var jugador_saltando = (obj_jugador.accion == 4) or (obj_jugador.accion == 4.5);
	var acciones_requeridas = jugador_saltando or control.boton_presionado("boton_salto");
	
    if (jugador_vivo and colision_con_jugador and acciones_requeridas) {
        obj_jugador.accion = 15;
        obj_jugador.velocidad_vertical = -cantidad_fuerza;
        obj_jugador.indice_sprite = 0;
		
        audio.reproducir_audio(snd_acrobacia_aerea);
        audio.reproducir_audio(snd_rainbowring);
        dibujar_efectos(spr_efecto_acrobacias_aereas);
		
		activar_efecto = false;
    }
} else {
    image_xscale -= 0.1;
    image_yscale -= 0.1;
    image_alpha -= 0.1;
    
	
    if (image_alpha <= 0) {
		instance_destroy();
	}
}
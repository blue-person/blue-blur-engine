if (activar_efecto) {
	sprite_index = obj_jugador.sprite_efecto_boost;
    obj_jugador.cantidad_boost -= 0.2;

    if (!obj_jugador.tocando_suelo) {
		tiempo_impulso_aereo--;
	} else {
        tiempo_impulso_aereo = 240;
	}
    
    if (image_alpha < 1) {
		image_alpha += 0.125;
	}
    
    image_angle = obj_jugador.direccion_aura_boost;
    if ((image_angle > 90) and (image_angle < 270)) {
		image_yscale = -1;
	}
	
	var boost_vacio = (obj_jugador.cantidad_boost <= 0);
	var sin_impulso_aereo = (tiempo_impulso_aereo < 0);
	var condiciones_velocidad = (obj_jugador.tocando_suelo and (obj_jugador.velocidad_horizontal < 2) and (obj_jugador.velocidad_horizontal > -2));
	
	if (!control.boton_mantenido("boton_boost") or boost_vacio or sin_impulso_aereo or condiciones_velocidad
	    or control.boton_liberado("boton_boost") or obj_jugador.zona_superada
	    or (obj_jugador.accion == 4) or (obj_jugador.accion == 4.5)
	    or (obj_jugador.accion == 12) or (obj_jugador.accion == 14)
	    or (obj_jugador.accion == 21) or (obj_jugador.accion == 24)
	    or (obj_jugador.accion == 25) or (obj_jugador.accion == 26)
	    or (obj_jugador.accion == 29) or (obj_jugador.accion == 30)) {
	    activar_efecto = false;
	}
} else {
    image_alpha -= 0.125;
    if (image_alpha <= 0) {
		instance_destroy();
	}
}

x = obj_jugador.x
y = obj_jugador.y

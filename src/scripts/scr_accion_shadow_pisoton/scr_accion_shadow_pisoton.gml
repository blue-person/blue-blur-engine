function gestion_accion_shadow_pisoton() {
	var boton_oprimido = controles.boton_presionado("boton_ataque");
	var acciones_validas = ((accion == 0) or (accion == 1)) and permitir_pisoton;
	var requisitos = !tocando_suelo and (tiempo_aire >= 10);
	var validacion_permiso_pisoton = (!permitir_pisoton and tocando_suelo);
	
	if (validacion_permiso_pisoton) then permitir_pisoton = true;
	
    if (boton_oprimido and acciones_validas and requisitos) {
        velocidad_horizontal = 0;
		accion = 18.5;
		image_index = 0;
        permitir_pisoton = false;
    }
	
	if (accion == 18) {
		velocidad_vertical = limite_velocidad_vertical;
	
		if (tocando_suelo) {
			efecto_haptico_colision();

			audio.detener_audio(snd_iniciar_pisoton);
			audio.reproducir_audio(snd_terminar_pisoton);
		
			if (abs(asin) > 0.55) {
				accion = 2;
				velocidad_horizontal = sign(asin) * -(velocidad_vertical / 1.5);
				velocidad_vertical = 0;
				audio.reproducir_audio(snd_rodar);
			} else {
				image_index = 0;
				accion = -1;
				velocidad_horizontal = 0;
				velocidad_vertical = 0;
			}
		}
	} else if (accion == 18.5) {
		velocidad_vertical = 0;
		velocidad_horizontal = 0;
	
		if (image_index >= 6) {
			audio.reproducir_audio(snd_ataque_shadow_b);
			audio.reproducir_audio(snd_iniciar_pisoton);
			velocidad_horizontal = direccion_horizontal * 5;
			accion = 18;
		}
	} else {
		audio.detener_audio(snd_iniciar_pisoton);
	}
}
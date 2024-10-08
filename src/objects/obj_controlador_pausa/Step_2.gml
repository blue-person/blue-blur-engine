if (pausar_juego) {
	// Reproducir audio
	if (controles.boton_presionado("boton_abajo") or controles.boton_presionado("boton_arriba")) {
		audio.reproducir_audio(snd_escoger_opcion);
	}
	
	// Determinar opcion seleccionada
	opcion_seleccionada += (controles.boton_presionado("boton_abajo") - controles.boton_presionado("boton_arriba"));
	opcion_seleccionada = (opcion_seleccionada + cantidad_opciones) % cantidad_opciones;

	// Gestionar pausa
	var boton_necesario_presionado = (controles.boton_presionado("boton_entrada") or controles.boton_presionado("boton_salto"));
	if (boton_necesario_presionado) {
		if (opciones_menu[opcion_seleccionada].estado == 3) {
			// Reproducir audio de negacion
			audio.reproducir_audio(snd_negar_opcion);
		} else {
			// Reproducir audio de confirmacion
			audio.reproducir_audio(snd_confirmar_opcion);
			audio.reproducir_audio(snd_salir_pausa);
			
			// Regresar al nivel
			room_goto(nivel_pausado);
			sprite_delete(imagen_fondo);
			
			// Reaunador sonidos
			audio.reanudar_todo();
			
			// Modificar datos
			nivel_pausado = noone;
			pausar_juego = false;
			
			// Activar alarma
			alarm[0] = 5;
		}
	} else {
		// Determinar el estado de las opciones
		for (var i = 0; i < cantidad_opciones; ++i) {
			opciones_menu[i].estado = (opcion_seleccionada == i) ? 1 : 0;
		}
		
		// Bloquear la opcion de reinicio en el caso dado
		if (nivel_pausado == rm_hub_world) {
			opciones_menu[1].estado = (1 == opcion_seleccionada) ? 3 : 2;
		}
	}
} else {
	var boton_necesario_presionado = (controles.boton_presionado("boton_entrada") or os_is_paused());
	var jugador_vivo = jugador.accion != 26;
	var no_presentando_nivel = not instance_exists(obj_escena_presentacion);
	var no_transicionando_entre_niveles = not instance_exists(obj_transicion_intraniveles);

	if (boton_necesario_presionado and jugador_vivo and no_presentando_nivel and no_transicionando_entre_niveles) {
		// Gestionar variables
		pausar_juego = true;
		opcion_seleccionada = 0;
		
		// Tomar un pantallazo del nivel y guardarlo como sprite
		surface_save(application_surface, archivo_pantallazo);
		imagen_fondo = sprite_add(archivo_pantallazo, 1, false, false, 0, 0);
		file_delete(archivo_pantallazo);
		
		// Gestionar los sonidos
		audio.pausar_todo();
		audio.reproducir_audio(snd_activar_pausa);
		
		// Almacenar la informacion del nivel pausado
		nivel_pausado = room;
		room_persistent = true;
		room_goto(rm_pausa);
	}
}
// Si se encuentra en pausa, se puede usar Enter o Saltar para escoger alguna opcion
if (pausar_juego) {
	boton_necesario = control.boton_presionado("boton_entrada") or control.boton_presionado("boton_salto");
} else {
	boton_necesario = control.boton_presionado("boton_entrada");
}

if (boton_necesario and !instance_exists(obj_presentacion_nivel) and !instance_exists(obj_transicion_niveles)) {
    if (!pausar_juego) {
		// Tomar pantallazo y guardarlo como un sprite
		surface_save(application_surface, archivo_pantallazo);
		sprite_escenario = sprite_add(archivo_pantallazo, 1, false, false, 0, 0);
		file_delete(archivo_pantallazo);

        // Desactivar todos los sonidos
		audio.pausar_todo();
		
		// Reproducir efecto de sonido
		audio.reproducir_audio(snd_activar_pausa);
		
		// Almacenar el nivel actual y enviar al jugador a la pantalla de pausa
        nivel_actual = room;
        room_persistent = true;
        room_goto(rm_pausa);
		
		// Ajustar variables
		pausar_juego = true;
		opcion_menu = 0;
    } else {
		// Reproducir efecto de sonido
		audio.reproducir_audio(snd_salir_pausa);
		
		// Regresar al nivel y reactivar los sonidos
        room_goto(nivel_actual);
		audio_resume_all();
		
		// Eliminar sprite y reiniciar variable del nivel
		sprite_delete(sprite_escenario);
		nivel_actual = -1;
		
		// Ajustar variable
		pausar_juego = false;
		
		// Activar alarma
        alarm[0] = 5;
    }
}

// Bloquear opciones del menu dependiendo del nivel donde este el jugador
if (pausar_juego) {
    if (control.boton_presionado("boton_abajo")) {
        if (nivel_actual == rm_hub_world) {
			opcion_menu = 2;
		} else if (opcion_menu < 2) {
			opcion_menu++;
		}
		audio.reproducir_audio(snd_escoger_opcion);
    } else if (control.boton_presionado("boton_arriba")) {
        if (nivel_actual == rm_hub_world) {
			opcion_menu = 0;
		} else if (opcion_menu > 0) {
            opcion_menu--;
		}
		audio.reproducir_audio(snd_escoger_opcion);
    }
}
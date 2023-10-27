function gestion_uso_jumppanel() {
	// Determinar si el nivel tiene jump panels
	var objeto_existe = instance_exists(obj_jump_panel);
	if (objeto_existe) {
		if (accion == 24) {
			// Mover hacia el jump panel necesario
			for (var i = 0; i < instance_number(obj_jump_panel); ++i) {
			    var jump_panel = instance_find(obj_jump_panel, i);
				if (jump_panel.indice == jump_panel_actual) {
					// Ajustar variables
					velocidad_horizontal = 0;
					velocidad_vertical = 0;
					
					// Ajustar direccion
			        if (x < jump_panel.x) {
			            direccion_horizontal = 1;
			        } else if (x > jump_panel.x) {
			            direccion_horizontal = -1;
			        }
					
					// Mover hacia el jump panel
					move_towards_point(jump_panel.x, jump_panel.y, 15);

					// Determinar si terminar la accion
				    if (tocando_suelo or place_meeting(x, y, obj_final_jump_panel)) {
						audio.reproducir_audio(audio_festejo);
						accion = 0;
						jump_panel_actual = 0;
						velocidad_horizontal = sign(direccion_horizontal) * 5;
				    }
					
					// Salir del evento
					exit;
				}
			}
		} else if (accion == 25) {
			// Ajustar velocidad
	        hspeed = 0;
	        vspeed = 0;
	        velocidad_horizontal = 0;
	        velocidad_vertical = 0;
			
			// Ajustar ubicacion
	        var jump_panel = instance_nearest(x, y, obj_jump_panel);
			var angulo_imagen = jump_panel.image_angle;
	        x = jump_panel.x - dsin(angulo_imagen) * 4;
	        y = jump_panel.y - dcos(angulo_imagen) * 4;
			
			// Salir del evento
			exit;
	    }
	}
}
function aumentar_vidas() {
	audio.reproducir_audio_aislado(snd_vida_extra, false);
	global.vidas_restantes++;
}

function disperar_rings() {
	// Variables
    var contador = 0;
	var angulo = 70.25;
	var cambiar_direccion = false;
	var velocidad = 3;
	var primer_conjunto = -1;
	var segundo_conjunto = -1;

	// Ajustar la cantidad de rings a dispersar
	if (jugador.rings > 20) {
		primer_conjunto = jugador.rings - 20;
		jugador.rings = 20;
	}

	// Ajustar el segundo conjunto
	if (primer_conjunto > 12) {
		segundo_conjunto = primer_conjunto - 12;
		primer_conjunto = 12;
	}

	// Ajustar el primer conjunto
	if (segundo_conjunto > 12) {
		primer_conjunto = 12;
	}

	// Dispersar los rings en el suelo
    while (contador < jugador.rings) {
        var ring_requerido = instance_create_depth(x, y, Profundidades.Backstage, obj_ring_dispersado_suelo);
        ring_requerido.vspeed = -sin(angulo) * velocidad;
        ring_requerido.hspeed = -jugador.direccion_horizontal * cos(angulo) * velocidad;

        if (cambiar_direccion) {
            ring_requerido.hspeed = -ring_requerido.hspeed;
            angulo += 22.5;
        }

        cambiar_direccion = not cambiar_direccion;
        contador++;

        if (contador == 16) {
            angulo = 70.25;
            velocidad = 2;
        }
    }

	// Dispersar los rings en la pantalla
    contador = 0;
	angulo = 60;
	cambiar_direccion = false;
	velocidad = 15.5;

    while (contador < primer_conjunto) {
        var ring_requerido = instance_create_depth(x, y, Profundidades.Interfaz, obj_ring_dispersado_pantalla);
        ring_requerido.vspeed = -sin(angulo) * velocidad;
        ring_requerido.hspeed = -jugador.direccion_horizontal * cos(angulo) * velocidad;
        ring_requerido.image_xscale = 1.2;
        ring_requerido.image_yscale = 1.2;
        angulo += 30;
        contador++;
    }
	
	// Quitar los rings del jugador
	jugador.rings = 0;
	audio.reproducir_audio(snd_perder_rings);
}

function herir_jugador(permitir_perder_rings = true) {
	// Variables
	jugador.image_index = 0;
	jugador.tocando_suelo = false;
	jugador.velocidad_vertical = -4;
	jugador.velocidad_horizontal = -5 * jugador.direccion_horizontal;
	jugador.permitir_ser_apuntado = false;
	
	// Gestionar la perdida de rings
	if (permitir_perder_rings) {
		if (jugador.rings > 0) {
			// Ajustar parametros
		    jugador.accion = 22;
		    jugador.tiempo_invencibilidad = 240;
			audio.reproducir_audio(jugador.audio_quejido);

			// Dispersar rings
		    disperar_rings();
		} else {
			// Matar al jugador
		    jugador.accion = 26;
		    jugador.alarma_3 = 120;
			audio.reproducir_audio(jugador.audio_muerte);

			// Desactivar HUD
		    if (instance_exists(hud)) then hud.ocultar();

			// Desactivar el controlador de pausa
		    if (instance_exists(obj_controlador_pausa)) {
				instance_destroy(obj_controlador_pausa);
			} 
		}
	} else {
		// Herir al jugador pero sin penalizarlo
		jugador.accion = 22;
		audio.reproducir_audio(jugador.audio_quejido);
	}
}
function recoger_ring(efecto_visual, efecto_sonido, valor_aumento_rings) {	
	instance_create_depth(x, y, 0, efecto_visual);

	audio.reproducir_audio_aislado(efecto_sonido, false);
	
	var valor_anterior = obj_jugador.rings;
	obj_jugador.rings += valor_aumento_rings;
	
	if (valor_anterior < 100) {
		if (obj_jugador.rings >= 100) {
			aumentar_vidas();
		}
	}
}

function disperar_rings() {
    var contador = 0;
	var angulo = 70.25;
	var voltear = false;
	var velocidad = 3;
	var primer_conjunto = -1;
	var segundo_conjunto = -1;

	if (other.rings > 20) {
		primer_conjunto = other.rings - 20;
		other.rings = 20;
	}

	if (primer_conjunto > 12) {
		segundo_conjunto = primer_conjunto - 12;
		primer_conjunto = 12;
	}

	if (segundo_conjunto > 12) {
		primer_conjunto = 12;
	}

    while (contador < other.rings) {
        var ring_requerido = instance_create_depth(x, y, 0, obj_ring_dispersado_suelo);
        ring_requerido.vspeed = -sin(angulo) * velocidad;
        ring_requerido.hspeed = -other.direccion_horizontal * cos(angulo) * velocidad;

        if (voltear) {
            ring_requerido.hspeed = -ring_requerido.hspeed;
            angulo += 22.5;
        }

        voltear = !voltear;
        contador++;

        if (contador == 16) {
            angulo = 70.25;
            velocidad = 2;
        }
    }

    contador = 0;
	angulo = 60;
	voltear = false;
	velocidad = 15.5;

    while (contador < primer_conjunto) {
        var ring_requerido = instance_create_depth(x, y, 0, obj_ring_dispersado_pantalla);
        ring_requerido.vspeed = -sin(angulo) * velocidad;
        ring_requerido.hspeed = -other.direccion_horizontal * cos(angulo) * velocidad;
        ring_requerido.image_xscale = 1.2;
        ring_requerido.image_yscale = 1.2;
        angulo += 30;
        contador++;
    }
	
	audio.reproducir_audio(snd_perder_rings);
	other.rings = 0;
}
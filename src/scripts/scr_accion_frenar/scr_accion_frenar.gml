function gestion_accion_frenar() {
	if ((accion == 0) and tocando_suelo) {
		var cambiar_hacia_izquierda = (direccion_horizontal == 1) and controles.boton_mantenido("boton_izquierda") and (velocidad_horizontal >= 3);
		var cambiar_hacia_derecha = (direccion_horizontal == -1) and controles.boton_mantenido("boton_derecha") and (velocidad_horizontal <= -3);
		
        if (cambiar_hacia_izquierda or cambiar_hacia_derecha) {
            if (colision_lineal_simple(obj_superficie_agua)) {
                audio.reproducir_audio(snd_frenar_agua);
            } else if (colision_lineal_superficie(obj_material_vidrio, obj_muro_vidrio_posterior, obj_muro_vidrio_frontal)) {
                audio.reproducir_audio(snd_frenar_vidrio);
            } else if (colision_lineal_superficie(obj_material_pasto, obj_muro_pasto_posterior, obj_muro_pasto_frontal)) {
                audio.reproducir_audio(snd_frenar_pasto);
            } else if (colision_lineal_superficie(obj_material_piedra, obj_muro_piedra_posterior, obj_muro_piedra_frontal)) {
                audio.reproducir_audio(snd_frenar);
            } else if (colision_lineal_superficie(obj_material_metal, obj_muro_metal_posterior, obj_muro_metal_frontal)) {
                audio.reproducir_audio(snd_frenar_metal);
            } else if (colision_lineal_superficie(obj_material_madera, obj_muro_madera_posterior, obj_muro_madera_frontal)) {
                audio.reproducir_audio(snd_frenar_madera);
            } else if (colision_lineal_superficie(obj_material_tierra, obj_muro_tierra_posterior, obj_muro_tierra_frontal)) {
                audio.reproducir_audio(snd_frenar_tierra);
            } else {
                audio.reproducir_audio(snd_frenar);
            }
            accion = -4;
            image_index = 0;
        }
    }

    if (accion == -4) {
        if (velocidad_horizontal > 1) {
            velocidad_horizontal -= desaceleracion;
        }

        if (velocidad_horizontal < -1) {
            velocidad_horizontal += desaceleracion;
        }

        if ((velocidad_horizontal > 1) and controles.boton_mantenido("boton_izquierda")) {
            velocidad_horizontal -= desaceleracion / 0.75;
        }

        if ((velocidad_horizontal < -1) and controles.boton_mantenido("boton_derecha")) {
            velocidad_horizontal += desaceleracion / 0.75;
        }

        if (((direccion_horizontal == 1) and controles.boton_mantenido("boton_derecha") and !controles.boton_mantenido("boton_izquierda")) or ((direccion_horizontal == -1) and controles.boton_mantenido("boton_izquierda") and !controles.boton_mantenido("boton_derecha"))) {
            accion = 0;
        }

        if ((abs(velocidad_horizontal) <= 1) or !tocando_suelo) {
            accion = 0;
            direccion_horizontal = -direccion_horizontal;
        }
    }
}
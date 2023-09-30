function gestion_accion_aterrizar() {
	if (permitir_movimiento and ((accion != 0) or ((accion == 0) and (velocidad_vertical > 0) and ((sprite_index == spr_sonic_cayendo) or (sprite_index == spr_shadow_saltando)))) and (accion > -1) and (accion != 2) and (accion != 16) and (accion != 17) and (accion != 8) and (accion != 9) and (accion != 22) and (accion != 26) and (accion != 34) and (accion != 35) and tocando_suelo and colision_lineal_simple(obj_superficie)) {
        var sonido_aterrizar = snd_aterrizar;
		
		if (colision_lineal_simple(obj_superficie_agua)) {
            sonido_aterrizar = snd_aterrizar_agua;
        } else if (colision_lineal_superficie(obj_material_vidrio, obj_muro_vidrio_posterior, obj_muro_vidrio_frontal)) {
			sonido_aterrizar = snd_aterrizar_vidrio;
        } else if (colision_lineal_superficie(obj_material_pasto, obj_muro_pasto_posterior, obj_muro_pasto_frontal)) {
			sonido_aterrizar = snd_aterrizar_pasto;
        } else if (colision_lineal_superficie(obj_material_metal, obj_muro_metal_posterior, obj_muro_metal_frontal)) {
			sonido_aterrizar = snd_aterrizar_metal;
        } else if (colision_lineal_superficie(obj_material_madera, obj_muro_madera_posterior, obj_muro_madera_frontal)) {
			sonido_aterrizar = snd_aterrizar_madera;
        } else if (colision_lineal_superficie(obj_material_tierra, obj_muro_tierra_posterior, obj_muro_tierra_frontal)) {
			sonido_aterrizar = snd_aterrizar_tierra;
        }
		
		audio.reproducir_audio(sonido_aterrizar);
    }

    if (tocando_suelo and (accion == 1)) {
        accion = 0;
    }
}
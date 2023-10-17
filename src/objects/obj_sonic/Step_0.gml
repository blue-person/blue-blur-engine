// Establecer el sprite por defecto
if (not permitir_movimiento) {
    sprite_index = spr_sonic_normal
    exit;
}

// Manejar las alarmas personalizadas
if (alarma_0 > 0) {
    alarma_0--;
	
    if (alarma_0 == 1) {
		gravedad = 0.21875;
	}
}

if (alarma_1 > 0) {
    alarma_1--;
	
    if ((alarma_1 == 1) and (accion = 8)) {
		accion = 0;
	}
}

// Homing Attack
if (alarma_2 > 0) {
    alarma_2--;
	
	if ((alarma_2 == 1) and (accion == 4.5)) {
		accion = 0;
		gravedad = 0.21875;
		velocidad_vertical = 0;
	}
}

// Reiniciar el nivel al morir
if (alarma_3 > 0) {
    alarma_3--;
	
    if (alarma_3 == 1) {
        room_persistent = false;
		if (global.vidas_restantes > 0) {
			global.vidas_restantes--;
			transiciones.iniciar_efecto_intraniveles("morado", 0.025, room);
		} else {
			global.vidas_restantes = 3;
			transiciones.iniciar_efecto_intraniveles("morado", 0.0095, rm_hub_world);
		}
    }
}

// Hacer un rastro que sigue al personaje cuando usa el boost
if (permitir_uso_boost) {
    valor_incremento_rastro += 1;
	
    if (valor_incremento_rastro >= 7) {
        instance_create_depth(x, y - 1, 0, obj_rastro);
        valor_incremento_rastro = 0;
    }
    
    if (tocando_suelo and (valor_incremento_rastro == 6) and (velocidad_horizontal != 0)) {
        var rastro_boost = instance_create_depth(x, y, 0, obj_destello_boost);
        rastro_boost.image_xscale = direccion_horizontal;
        rastro_boost.image_angle = angulo;
    }
}

if (accion == 15) {
    valor_incremento_rastro++;
	
    if (valor_incremento_rastro >= 5) {
        instance_create_depth(x, y, 0, obj_destello_rastro);
        valor_incremento_rastro = 0;
    }
}

if (not sumergido_agua and tocando_suelo) and (abs(velocidad_horizontal) >= 6) and (accion == 0 or accion == 1 or accion == 2) {
    caminar_sobre_agua = true;
} else {
    caminar_sobre_agua = false;
}

// Fisicas dentro del agua
gestion_fisicas_agua_entidad();

if (sumergido_agua and (random(1) < 0.0115)) {
	var pos_x = x + choose(5, 7, 9) * direccion_horizontal;
	var pos_y = y - 5;
	instance_create_depth(pos_x, pos_y, -2, obj_burbuja_agua);
}

// Ejecutar scripts esenciales
gestion_fisicas_entidad();

// Gestionar los movimientos del personaje
if (not zona_superada) {
	gestion_movimiento_sonic();
} else {
    accion = 0;
    direccion_horizontal = 1;
	
    if (abs(velocidad_horizontal) < 9) {
		velocidad_horizontal += aceleracion;
	}
}

// Cambiar la capa del nivel. Se hace cuando el personaje pasa por un loop, por ejemplo
if (collision_circle(x, y, mascara_colision, obj_capa_posterior, true, true)) {
    capa_actual = "posterior";
}

if (collision_circle(x, y, mascara_colision, obj_capa_frontal, true, true)) {
    capa_actual = "frontal";
}

if (collision_circle(x, y, mascara_colision, obj_cambiar_capa_pf, true, true)) {
	if (tocando_suelo) {
		if (velocidad_horizontal > 0) {
			capa_actual = "posterior";
		}
		if (velocidad_horizontal < 0) {
			capa_actual = "frontal";
		}
	}
}

if (collision_circle(x, y, mascara_colision, obj_cambiar_capa_fp, true, true)) {
	if (tocando_suelo) {
		if (velocidad_horizontal > 0) {
			capa_actual = "frontal";
		}
		if (velocidad_horizontal < 0) {
			capa_actual = "posterior";
		}
	}
}

// Hacer que suenen los pasos del jugador dependiendo de la superficie donde este
if (tocando_suelo) {
    if (colision_lineal_simple(obj_superficie_agua)) {
		sonido_pisada_a = snd_pisada_agua_a;
	    sonido_pisada_b = snd_pisada_agua_b;
    } else if (colision_lineal_superficie(obj_material_vidrio, obj_muro_vidrio_posterior, obj_muro_vidrio_frontal)) {
        sonido_pisada_a = snd_pisada_vidrio_a;
        sonido_pisada_b = snd_pisada_vidrio_b;
    } else if (colision_lineal_superficie(obj_material_pasto, obj_muro_pasto_posterior, obj_muro_pasto_frontal)) {
        sonido_pisada_a = snd_pisada_pasto_a;
        sonido_pisada_b = snd_pisada_pasto_b;
    } else if (colision_lineal_superficie(obj_material_piedra, obj_muro_piedra_posterior, obj_muro_piedra_frontal)) {
        sonido_pisada_a = snd_pisada_piedra_a;
        sonido_pisada_b = snd_pisada_piedra_b;
    } else if (colision_lineal_superficie(obj_material_metal, obj_muro_metal_posterior, obj_muro_metal_frontal)) {
        sonido_pisada_a = snd_pisada_metal_a;
        sonido_pisada_b = snd_pisada_metal_b;
    } else if (colision_lineal_superficie(obj_material_madera, obj_muro_madera_posterior, obj_muro_madera_frontal)) {
        sonido_pisada_a = snd_pisada_madera_a;
        sonido_pisada_b = snd_pisada_madera_b;
    } else if (colision_lineal_superficie(obj_material_tierra, obj_muro_tierra_posterior, obj_muro_tierra_frontal)) {
        sonido_pisada_a = snd_pisada_tierra_a;
        sonido_pisada_b = snd_pisada_tierra_b;
    } else {
        sonido_pisada_a = snd_pisada_a;
        sonido_pisada_b = snd_pisada_b;
    }
}

// Reproducir sonidos de pisadas
if ((accion == 0) and (sprite_index != spr_sonic_normal) and tocando_suelo and !zona_superada) {
    sonido_pisadas_general(sonido_pisada_a, sonido_pisada_b);
}

// Permitir invencibilidad al personaje de manera temporal despues de ser herido
if (tiempo_invencibilidad > 0) {
    tiempo_invencibilidad--;
	
    if (tiempo_invencibilidad == 1) {
		permitir_ser_apuntado = true;
	}
}

// Gestionar el tiempo en el aire
if (not tocando_suelo) {
	tiempo_aire++;
} else {
	tiempo_aire = 0;
}
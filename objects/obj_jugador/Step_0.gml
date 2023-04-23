// Determinar el sprite
if (!permitir_movimiento) {
    switch (global.personaje_actual) {
        case "Sonic":
            sprite_actual = spr_sonic_normal
            break;
        case "Shadow":
            sprite_actual = spr_shadow_normal;
            break;
    }
    exit;
}

// Dar boost infinito cuando se esta en el hub
if (room == rm_hub_world) then cantidad_boost = 100;

// Manejar las alarmas personalizadas
if (alarma_0 > 0) {
    --alarma_0;
	
    if (alarma_0 == 1) {
		gravedad = 0.21875;
	}
}

if (alarma_1 > 0) {
    --alarma_1;
	
    if ((alarma_1 == 1) and (accion = 8)) {
		accion = 0;
	}
}

// Homing Attack
if (alarma_2 > 0) {
    --alarma_2;

	if ((alarma_2 == 1) and (accion == 4.5)) {
		accion = 0;
		gravedad = 0.21875;
		velocidad_vertical = 0;
	}
}

// Reiniciar el nivel al morir
if (alarma_3 > 0) {
    --alarma_3;
	
    if (alarma_3 == 1) {
		if (global.vidas_restantes > 0) {
			--global.vidas_restantes;
			iniciar_transicion_niveles(room, "negro", 0.025);
		} else {
			global.vidas_restantes = 3;
			iniciar_transicion_niveles(rm_hub_world, "negro", 0.0095);
		}
    }
}

if (alarma_4 > 0) {
	--alarma_4;
	
    if (!instance_exists(obj_invertir_colores)) {
		instance_create_depth(0, 0, -16000, obj_invertir_colores);
	}
	
    if (alarma_4 == 1) {
        instance_destroy(obj_invertir_colores);
        room_speed = 60;
        --alarma_4;
    }
}

if (alarma_5 > 0) {
    --alarma_5;
    if (alarm == 1) {
        hspeed = 0;
        vspeed = 0;
		
        var canon_mas_cercano = instance_nearest(x, y, obj_canon);
		var angulo_canon = canon_mas_cercano.angulo_conducto;
		var fuerza_canon = canon_mas_cercano.cantidad_fuerza;
		
		accion = 35.2;
		velocidad_horizontal = dcos(angulo_canon) * fuerza_canon;
        velocidad_vertical = dsin(angulo_canon) * fuerza_canon;
    }
}

// Controlar la cantidad de boost
if (cantidad_boost > 100) then cantidad_boost = 100;
if (cantidad_boost < 0) then cantidad_boost = 0;

// Hacer un rastro que sigue al personaje cuando usa el boost
if (instance_exists(obj_efecto_boost) or ((global.personaje_actual == "Shadow") and (accion == 4.5))) {
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
    ++valor_incremento_rastro;
	
    if (valor_incremento_rastro >= 5) {
        instance_create_depth(x, y, 0, obj_destello_rastro);
        valor_incremento_rastro = 0;
    }
}

if (sumergido_agua and (random(1) < 0.0115)) {
	var pos_x = x + choose(5, 7, 9) * direccion_horizontal;
	instance_create_depth(pos_x, y - 5, -2, obj_burbuja_agua);
}

// Ejecutar scripts esenciales
manejo_fisicas_jugador();

if (!zona_superada) {
	movimiento_jugador();
} else {
    accion = 0;
    direccion_horizontal = 1;
	
    if (abs(velocidad_horizontal) < 9) {
		velocidad_horizontal += aceleracion;
	}
}

// Cambiar la capa del nivel. Se hace cuando el personaje pasa por un loop, por ejemplo
if (collision_circle(x, y, 16, obj_capa_posterior, true, true)) {
    capa_nivel = 0;
}

if (collision_circle(x, y, 16, obj_capa_frontal, true, true)) {
    capa_nivel = 1;
}

if (collision_circle(x, y, 16, obj_cambiar_capa_pf, true, true)) {
	if (tocando_suelo) {
		if (velocidad_horizontal > 0) {
			capa_nivel = 0;
		}
		if (velocidad_horizontal < 0) {
			capa_nivel = 1;
		}
	}
}

if (collision_circle(x, y, 16, obj_cambiar_capa_fp, true, true)) {
	if (tocando_suelo) {
		if (velocidad_horizontal > 0) {
			capa_nivel = 1;
		}
		if (velocidad_horizontal < 0) {
			capa_nivel = 0;
		}
	}
}

// Hacer que suenen los pasos del jugador dependiendo de la superficie donde este
if (tocando_suelo) {
	caminar_sobre_agua = false;
    if (calcular_colision_linea(obj_superficie_agua)) {
        caminar_sobre_agua = true;
		sonido_pisada_a = snd_pisada_agua_a;
	    sonido_pisada_b = snd_pisada_agua_b;
    } else if (verificar_colision_tipo_suelo(obj_material_vidrio, obj_muro_vidrio_posterior, obj_muro_vidrio_frontal)) {
        sonido_pisada_a = snd_pisada_vidrio_a;
        sonido_pisada_b = snd_pisada_vidrio_b;
    } else if (verificar_colision_tipo_suelo(obj_material_pasto, obj_muro_pasto_posterior, obj_muro_pasto_frontal)) {
        sonido_pisada_a = snd_pisada_pasto_a;
        sonido_pisada_b = snd_pisada_pasto_b;
    } else if (verificar_colision_tipo_suelo(obj_material_piedra, obj_muro_piedra_posterior, obj_muro_piedra_frontal)) {
        sonido_pisada_a = snd_pisada_a;
        sonido_pisada_b = snd_pisada_b;
    } else if (verificar_colision_tipo_suelo(obj_material_metal, obj_muro_metal_posterior, obj_muro_metal_frontal)) {
        sonido_pisada_a = snd_pisada_metal_a;
        sonido_pisada_b = snd_pisada_metal_b;
    } else if (verificar_colision_tipo_suelo(obj_material_madera, obj_muro_madera_posterior, obj_muro_madera_frontal)) {
        sonido_pisada_a = snd_pisada_madera_a;
        sonido_pisada_b = snd_pisada_madera_b;
    } else if (verificar_colision_tipo_suelo(obj_material_tierra, obj_muro_tierra_posterior, obj_muro_tierra_frontal)) {
        sonido_pisada_a = snd_pisada_tierra_a;
        sonido_pisada_b = snd_pisada_tierra_b;
    } else {
        sonido_pisada_a = snd_pisada_a;
        sonido_pisada_b = snd_pisada_b;
    }
}

if ((global.personaje_actual == "Shadow") and ((sprite_actual == spr_shadow_patinando_a) or (sprite_actual == spr_shadow_patinando_b))) {
    sonido_pisada_a = snd_propulsores_shadow_a;
    sonido_pisada_b = snd_propulsores_shadow_b;
}

if ((accion == 0) and (sprite_actual != spr_sonic_normal) and (sprite_actual != spr_shadow_normal) and tocando_suelo and !zona_superada and !((global.personaje_actual == "Shadow") and ((sprite_actual == spr_shadow_patinando_b) or (sprite_actual == spr_shadow_patinando_a) or (sprite_actual == spr_shadow_volando)))) {
    sonido_pisadas_general(sonido_pisada_a, sonido_pisada_b);
} else if (global.personaje_actual == "Shadow") {
	sonido_pisadas_shadow(sonido_pisada_a, sonido_pisada_b);
}

// Permitir invencibilidad al personaje de manera temporal despues de ser herido
if (tiempo_invencibilidad > 0) {
    --tiempo_invencibilidad;
	
    if (tiempo_invencibilidad == 1) {
		permitir_ser_apuntado = true;
	}
}

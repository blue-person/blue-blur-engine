function movimiento_jugador() {
	var distancia_light_ring = 0;
    var light_ring_cercano = noone;
	var canon_mas_cercano = noone;
    var elemento_apuntable_cercano = noone;

    // Manejo del boost
    manejo_movimiento_boost();

    // Frenar al cambiar de direccion
    if ((accion == 0) and tocando_suelo) {
        if (((direccion_horizontal == 1) and control.boton_mantenido("boton_izquierda") and (velocidad_horizontal >= 3)) or ((direccion_horizontal == -1) and control.boton_mantenido("boton_derecha") and (velocidad_horizontal <= -3))) {
            if (colision_lineal_simple(obj_superficie_agua)) {
                audio_play_sound(snd_frenar_agua, 1, 0);
            } else if (colision_lineal_superficie(obj_material_vidrio, obj_muro_vidrio_posterior, obj_muro_vidrio_frontal)) {
                audio_play_sound(snd_frenar_vidrio, 1, 0);
            } else if (colision_lineal_superficie(obj_material_pasto, obj_muro_pasto_posterior, obj_muro_pasto_frontal)) {
                audio_play_sound(snd_frenar_pasto, 1, 0);
            } else if (colision_lineal_superficie(obj_material_piedra, obj_muro_piedra_posterior, obj_muro_piedra_frontal)) {
                audio_play_sound(snd_frenar, 1, 0);
            } else if (colision_lineal_superficie(obj_material_metal, obj_muro_metal_posterior, obj_muro_metal_frontal)) {
                audio_play_sound(snd_frenar_metal, 1, 0);
            } else if (colision_lineal_superficie(obj_material_madera, obj_muro_madera_posterior, obj_muro_madera_frontal)) {
                audio_play_sound(snd_frenar_madera, 1, 0);
            } else if (colision_lineal_superficie(obj_material_tierra, obj_muro_tierra_posterior, obj_muro_tierra_frontal)) {
                audio_play_sound(snd_frenar_tierra, 1, 0);
            } else {
                audio_play_sound(snd_frenar, 1, 0);
            }
            accion = -4;
            indice_sprite = 0;
        }
    }

    if (accion == -4) {
        if (velocidad_horizontal > 1) {
            velocidad_horizontal -= desaceleracion;
        }

        if (velocidad_horizontal < -1) {
            velocidad_horizontal += desaceleracion;
        }

        if (velocidad_horizontal > 1 and control.boton_mantenido("boton_izquierda")) {
            velocidad_horizontal -= desaceleracion / 0.75;
        }

        if ((velocidad_horizontal < -1) and control.boton_mantenido("boton_derecha")) {
            velocidad_horizontal += desaceleracion / 0.75;
        }

        if (((direccion_horizontal == 1) and control.boton_mantenido("boton_derecha") and !control.boton_mantenido("boton_izquierda")) or ((direccion_horizontal == -1) and control.boton_mantenido("boton_izquierda") and !control.boton_mantenido("boton_derecha"))) {
            accion = 0;
        }

        if ((abs(velocidad_horizontal) <= 1) or !tocando_suelo) {
            accion = 0;
            direccion_horizontal = -direccion_horizontal;
        }
    }

    // Determinar direccion
    if (accion == 0) {
        if (control.boton_mantenido("boton_izquierda")) {
            direccion_horizontal = -1;
        } else if (control.boton_mantenido("boton_derecha")) {
            direccion_horizontal = 1;
        }
    }

    // Manejar movimiento
    if ((accion == 0) or (accion == 1) or (accion == 16)) {
        if (tocando_suelo) {
            if (control.boton_mantenido("boton_derecha")) {
                if (velocidad_horizontal > 0) {
                    if (velocidad_horizontal < limite_velocidad_actual) {
                        velocidad_horizontal += aceleracion;
                    }
                } else {
                    velocidad_horizontal += desaceleracion;
                }
            }
            if (control.boton_mantenido("boton_izquierda")) {
                if (velocidad_horizontal < 0) {
                    if (velocidad_horizontal > -limite_velocidad_actual) {
                        velocidad_horizontal -= aceleracion;
                    }
                } else {
                    velocidad_horizontal -= desaceleracion;
                }
            }

            if (!control.boton_mantenido("boton_derecha") and !control.boton_mantenido("boton_izquierda")) {
                if (velocidad_horizontal > 0) {
                    velocidad_horizontal -= friccion;
                }

                if (velocidad_horizontal < 0) {
                    velocidad_horizontal += friccion;
                }

                if (velocidad_horizontal <= friccion and velocidad_horizontal >= -friccion) {
                    velocidad_horizontal = 0;
                }
            }

            if (control.boton_mantenido("boton_derecha") and control.boton_mantenido("boton_izquierda")) {
                if (abs(velocidad_horizontal) <= desaceleracion) {
                    velocidad_horizontal = 0;
                }
            }
        } else {
            if ((accion == 0) or (accion == 16)) {
                if (control.boton_mantenido("boton_derecha")) {
                    if (velocidad_horizontal > 0) {
                        if (velocidad_horizontal < limite_velocidad_actual) {
                            velocidad_horizontal += aceleracion;
                        }
                    } else {
                        velocidad_horizontal += desaceleracion;
                    }
                }

                if (control.boton_mantenido("boton_izquierda")) {
                    if (velocidad_horizontal < 0) {
                        if (velocidad_horizontal > -limite_velocidad_actual) {
                            velocidad_horizontal -= aceleracion;
                        }
                    } else {
                        velocidad_horizontal -= desaceleracion;
                    }
                }

                if (!control.boton_mantenido("boton_derecha") and !control.boton_mantenido("boton_izquierda")) {
                    if (velocidad_horizontal > 0) {
                        velocidad_horizontal -= friccion;
                    }

                    if (velocidad_horizontal < 0) {
                        velocidad_horizontal += friccion;
                    }

                    if (velocidad_horizontal <= friccion and velocidad_horizontal >= -friccion) {
                        velocidad_horizontal = 0;
                    }
                }

                if (control.boton_mantenido("boton_derecha") and control.boton_mantenido("boton_izquierda")) {
                    if (abs(velocidad_horizontal) <= desaceleracion) {
                        velocidad_horizontal = 0;
                    }
                }
            } else if (accion == 1) {
                if (control.boton_mantenido("boton_derecha")) {
                    if (velocidad_horizontal > 0) {
                        if (velocidad_horizontal < limite_velocidad_actual) {
                            velocidad_horizontal += aceleracion;
                        }
                    } else {
                        velocidad_horizontal += desaceleracion;
                    }
                }

                if (control.boton_mantenido("boton_izquierda")) {
                    if (velocidad_horizontal < 0) {
                        if (velocidad_horizontal > -limite_velocidad_actual) {
                            velocidad_horizontal -= aceleracion;
                        }
                    } else {
                        velocidad_horizontal -= desaceleracion;
                    }
                }

                if (!control.boton_mantenido("boton_derecha") and !control.boton_mantenido("boton_izquierda")) {
                    if (velocidad_horizontal > 0) {
                        velocidad_horizontal -= friccion;
                    }

                    if (velocidad_horizontal < 0) {
                        velocidad_horizontal += friccion;
                    }

                    if (velocidad_horizontal <= friccion and velocidad_horizontal >= -friccion) {
                        velocidad_horizontal = 0;
                    }
                }

                if (control.boton_mantenido("boton_derecha") and control.boton_mantenido("boton_izquierda")) {
                    if (abs(velocidad_horizontal) <= desaceleracion) {
                        velocidad_horizontal = 0;
                    }
                }
            }
        }
    }

    if (accion == 2) {
        if (tocando_suelo) {
            if (velocidad_horizontal > friccion_bola) {
                velocidad_horizontal -= friccion_bola;

                if (control.boton_mantenido("boton_izquierda")) {
                    velocidad_horizontal -= desaceleracion_bola;
                }
            }

            if (velocidad_horizontal < -friccion_bola) {
                velocidad_horizontal += friccion_bola;

                if (control.boton_mantenido("boton_derecha")) {
                    velocidad_horizontal += desaceleracion_bola;
                }
            }

            if ((velocidad_horizontal < friccion_bola) and (velocidad_horizontal > -friccion_bola)) {
                velocidad_horizontal = 0;
            }
        } else {
            if (control.boton_mantenido("boton_derecha")) {
                if (velocidad_horizontal >= 0) {
                    if (velocidad_horizontal < velocidad_horizontal_normal) {
                        velocidad_horizontal += aceleracion * 2;
                    }
                }
            }
            if (control.boton_mantenido("boton_izquierda")) {
                if (velocidad_horizontal <= 0) {
                    if (velocidad_horizontal > -velocidad_horizontal_normal) {
                        velocidad_horizontal -= aceleracion * 2;
                        velocidad_horizontal -= aceleracion * 2;
                    }
                }
            }
        }
    }

    // Manejo del salto
    if (control.boton_presionado("boton_salto") and tocando_suelo and ((accion == -4) or (accion == 0) or (accion == 2) or (accion == 9) or (accion == 11))) {
        accion = 1;
		tocando_suelo = false;
        velocidad_vertical = acos * altura_salto + (-asin * velocidad_horizontal) / 1.5;
        velocidad_horizontal = velocidad_horizontal * acos + asin * altura_salto;

        angulo = 0;
        acos = 1;
        asin = 0;
		
		audio_play_sound(snd_salto, 1, false);
        if (!instance_exists(obj_efecto_salto)) {
            instance_create_depth(x, y, 0, obj_efecto_salto);
        }
    }

    // Manejo de la altura minima del salto
    if (control.boton_liberado("boton_salto") and (velocidad_vertical < altura_salto_minima) and (accion == 1)) {
        velocidad_vertical = altura_salto_minima;
    }

    if ((accion == 1) and !tocando_suelo) {
        if (control.boton_mantenido("boton_derecha")) {
            if (velocidad_horizontal >= 0) {
                if (velocidad_horizontal < limite_velocidad_actual) {
                    velocidad_horizontal += aceleracion / 2;
                }
            } else {
                velocidad_horizontal += desaceleracion / 2;
            }
        }

        if (control.boton_mantenido("boton_izquierda")) {
            if (velocidad_horizontal <= 0) {
                if (velocidad_horizontal > -limite_velocidad_actual) {
                    velocidad_horizontal -= aceleracion / 2;
                } else {
                    velocidad_horizontal -= desaceleracion / 2;
                }
            }

            if (!control.boton_mantenido("boton_derecha") and !control.boton_mantenido("boton_izquierda")) {
                if (velocidad_horizontal > 0) {
                    velocidad_horizontal -= friccion;
                }

                if (velocidad_horizontal < 0) {
                    velocidad_horizontal += friccion;
                }

                if ((velocidad_horizontal <= friccion) and (velocidad_horizontal >= -friccion)) {
                    velocidad_horizontal = 0;
                }
            }
        }
    }

    // Aterrizar en el suelo
    if (permitir_movimiento and ((accion != 0) or ((accion == 0) and (velocidad_vertical > 0) and ((sprite_actual == spr_sonic_cayendo) or (sprite_actual == spr_shadow_saltando)))) and (accion > -1) and (accion != 2) and (accion != 16) and (accion != 17) and (accion != 8) and (accion != 9) and (accion != 22) and (accion != 26) and (accion != 34) and (accion != 35) and tocando_suelo and colision_lineal_simple(obj_superficie)) {
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
		
		audio_play_sound(sonido_aterrizar, 1, 0);
    }

    if (tocando_suelo and (accion == 1)) {
        accion = 0;
    }

    // Agacharse y rodar
    if (control.boton_mantenido("boton_abajo") and tocando_suelo and ((accion == 0) or (accion == 1))) {
        if (abs(velocidad_horizontal) < 1.03125) {
            velocidad_horizontal = 0;
            accion = -1;
            indice_sprite = 0;
        }

        if (abs(velocidad_horizontal) >= 1.03125) {
            accion = 2;
            audio_play_sound(snd_rodar, 1, false);
        }	
    }
	
    // Dejar de agacharse
    if ((accion == -1) and !control.boton_mantenido("boton_abajo") and (indice_sprite >= 5)) {
        accion = 0;
    }

    // Dejar de rodar
    if ((accion == 2) and (abs(velocidad_horizontal) < 0.5) and tocando_suelo) {
        accion = 0;
    }

    // Dejar de rodar al ir por el suelo
    if ((accion == 2) and (velocidad_vertical > 0) and !tocando_suelo and colision_con_suelo()) {
        accion = 0;
    }

    // Mirar hacia arriba
    if (control.boton_mantenido("boton_arriba") and tocando_suelo and (accion == 0)) {
        if (abs(velocidad_horizontal) < 0.2) {
            velocidad_horizontal = 0;
            accion = -3;
            indice_sprite = 0;
        }
    }

    if ((!control.boton_mantenido("boton_arriba") or !tocando_suelo or control.boton_mantenido("boton_derecha") or control.boton_mantenido("boton_izquierda")) and ((accion == -3) and (indice_sprite >= 5))) {
        accion = 0;
    }

    // Spindash
    if (velocidad_spindash > 0) {
        velocidad_spindash = velocidad_spindash - ((velocidad_spindash div 1) / 265);
    }

    if (velocidad_spindash > 192) {
        velocidad_spindash = 192;
    }

    if ((accion == -2) and control.boton_presionado("boton_salto")) {
        velocidad_spindash += 8;
        audio_play_sound(snd_cargar_spindash, 1, false);
    }

    if ((accion == -2) and !control.boton_mantenido("boton_abajo")) {
        velocidad_horizontal = direccion_horizontal * 9 + (direccion_horizontal * floor(velocidad_spindash) / 8);
        accion = 2;
        velocidad_spindash = 0;
        audio_play_sound(snd_soltar_spindash, 1, false);
    }

    if ((accion == -1) and control.boton_presionado("boton_salto")) {
        velocidad_spindash = 0;
        accion = -2;
        indice_sprite = 0;
        instance_create_depth(x, y, 0, obj_humo_spindash);
        audio_play_sound(snd_cargar_spindash, 1, false);
    }

    // Homing attack
    if ((accion == 1) or ((accion == 0) and !tocando_suelo) or (accion == 10) or (accion == 13)) {
        puede_hacer_homing = true;
    } else {
        puede_hacer_homing = false;
    }

    elemento_apuntable_cercano = instance_nearest(x, y, obj_apuntable);
    if (puede_hacer_homing and (distance_to_object(elemento_apuntable_cercano) <= 200) and (elemento_apuntable_cercano.y > (y - 10)) and !collision_line(x, y, elemento_apuntable_cercano.x, elemento_apuntable_cercano.y, obj_superficie, true, true) and elemento_apuntable_cercano.permitir_ser_apuntado and (((x < (elemento_apuntable_cercano.x + 2)) and (direccion_horizontal == 1)) or ((x > (elemento_apuntable_cercano.x - 2)) and (direccion_horizontal == -1)))) {
        if (!instance_exists(obj_enfoque_homing)) {
            instance_create_depth(elemento_apuntable_cercano.x, elemento_apuntable_cercano.y, -9999, obj_enfoque_homing);
        }
    } else if ((distance_to_object(elemento_apuntable_cercano) > 200) or tocando_suelo or (elemento_apuntable_cercano.y <= (y - 10)) or ((x <= elemento_apuntable_cercano.x) and (direccion_horizontal == -1)) or ((x >= elemento_apuntable_cercano.x) and (direccion_horizontal == 1))) {
        if (instance_exists(obj_enfoque_homing)) {
            instance_destroy(obj_enfoque_homing);
        }
    }

    if (((accion == 1) and permitir_homing_attack and control.boton_liberado("boton_salto")) or ((accion == 0) and !tocando_suelo) or (accion == 5)) {
        permitir_homing_attack = false;
    }

    if (instance_exists(obj_enfoque_homing)) {
        if (control.boton_presionado("boton_salto") and !permitir_homing_attack) {
            if (accion != 4) {
                audio_play_sound(snd_homing_attack, 1, false);
            }

            accion = 4;
            velocidad_horizontal = 0;
            velocidad_vertical = 0;
            move_towards_point(obj_enfoque_homing.x, obj_enfoque_homing.y, 20);
        }
    } else {
        if (control.boton_presionado("boton_salto") and !tocando_suelo and ((accion == 1) or (accion == 0)) and !permitir_homing_attack and permitir_air_dash) {
            if (accion != 4.5) {
                switch (global.personaje_actual) {
                    case "Sonic":
                        audio_play_sound(snd_homing_attack, 1, false);
                        break;
                    case "Shadow":
                        audio_play_sound(snd_teletransportacion, 1, false);
                        break;
                }
            }

            accion = 4.5;
            alarma_2 = 15;
            permitir_homing_attack = true;
            permitir_air_dash = false;
            indice_sprite = 0;
        } else if ((accion == 4.5) and tocando_suelo) {
            accion = 0;
            alarma_2 = 0;
            permitir_homing_attack = false;
            permitir_air_dash = false;
            gravedad = 0.21875;
        }
    }

    if (!permitir_homing_attack and tocando_suelo) {
        permitir_homing_attack = true;
    }

    if (!permitir_air_dash and tocando_suelo) {
        permitir_air_dash = true;
    }

    if (accion == 4.5) {
		if (control.boton_mantenido("boton_derecha")) {
			direccion_horizontal = 1;
		} 
		else if (control.boton_mantenido("boton_izquierda")) {
			direccion_horizontal = -1;
		}
		
		var velocidad_homing_attack = 0;
		switch (global.personaje_actual) {
		    case "Sonic":
				velocidad_homing_attack = 10.5;
		        break;
		    case "Shadow":
		        velocidad_homing_attack = 12;
		        break;
		}
		velocidad_horizontal = direccion_horizontal * velocidad_homing_attack;
        velocidad_vertical = 0;
		control.inhabilitar_lectura(2);
		//alarm[3] = 2;
    }

    if ((accion == 4) and instance_exists(obj_enfoque_homing)) {
        move_towards_point(obj_enfoque_homing.x, obj_enfoque_homing.y, 20);
    } else {
        vspeed = 0;
        hspeed = 0;
    }

    if ((accion == 4) and (place_meeting(x, y, obj_superficie) or tocando_suelo)) {
        accion = 0;
    }
    // Luego del homing attack, el personaje realiza una acrobacia en el aire, lo cual es la accion 10.
    // La acrobacia en el aire y el air dash se controla en el codigo de la funcion dibujar_sprites_sonic.

    // Saltar en trampolin y atravesar dash rings
    if ((accion == 5) or (accion == 6)) {
        if (velocidad_horizontal > 0) {
            direccion_horizontal = 1;
        } else if (velocidad_horizontal < 0) {
            direccion_horizontal = -1;
        }

        if (tocando_suelo) {
            accion = 0;
        }
    }

    // Dash ramp
    if (accion == 7) {
        velocidad_horizontal = direccion_horizontal * 12;

        if (tocando_suelo) {
            accion = 0;
        }
    }

    // Dash pad
    if (accion == 8) {
        if (velocidad_horizontal > 0) {
            velocidad_horizontal = limite_velocidad_horizontal;
        } else if (velocidad_horizontal < 0) {
            velocidad_horizontal = -limite_velocidad_horizontal;
        }
    }

    // Deslizarse en el suelo
    switch (global.personaje_actual) {
        case "Sonic":
            if (tocando_suelo and (accion == 0) and (abs(velocidad_horizontal) >= 3) and control.boton_mantenido("boton_ataque")) {
                sprite_actual = spr_sonic_trotando;
                accion = 9;
                audio_play_sound(snd_ataque_sonic_c, 1, false);
            }

            if (accion == 9) {
                if (velocidad_horizontal > 0) {
                    direccion_horizontal = 1;
                } else if (velocidad_horizontal < 0) {
                    direccion_horizontal = -1;
                }

                if (direccion_horizontal == 1 and control.boton_mantenido("boton_izquierda")) {
                    velocidad_horizontal -= desaceleracion;
                } else if (direccion_horizontal == -1 and control.boton_mantenido("boton_derecha")) {
                    velocidad_horizontal += desaceleracion;
                }

                if (velocidad_horizontal > 0) {
                    velocidad_horizontal -= friccion;
                }

                if (velocidad_horizontal < 0) {
                    velocidad_horizontal += friccion;
                }

                if ((abs(velocidad_horizontal) < 1) or !tocando_suelo) {
                    accion = 0;
                }

                if (!control.boton_mantenido("boton_ataque")) {
                    accion = 2;
                }
            }
            break;

        case "Shadow":
            if (tocando_suelo and (accion == 0) and control.boton_presionado("boton_ataque")) {
                indice_sprite = 0;

                if (abs(velocidad_horizontal) < 10) {
                    velocidad_horizontal = 10 * direccion_horizontal;
                }

                accion = 9;
                audio_play_sound(snd_ataque_shadow_b, 1, false);
                audio_play_sound(snd_teletransportacion, 1, false);
            }

            if (accion == 9) {
                if (velocidad_horizontal > 0) {
                    velocidad_horizontal -= friccion;
                }

                if (velocidad_horizontal < 0) {
                    velocidad_horizontal += friccion;
                }

                if ((indice_sprite >= 24) or !tocando_suelo) {
                    accion = 0;
                }
            }
            break;
    }

    // Deslizarse por rieles (Grinding)
    if (velocidad_vertical >= 0) {
        permitir_grinding = true;
    } else {
        permitir_grinding = false;
    }

    if (permitir_grinding and tocando_suelo and colision_con_riel()) {
        if (accion == 2) {
            accion = 0;
        }

        if ((accion != 11) and (accion != 16.5)) {
            audio_play_sound(snd_usar_riel, 1, false);

            if (!instance_exists(obj_efecto_grinding)) {
                instance_create_depth(x, y, 0, obj_efecto_grinding);
            }
        }
        accion = 11;
    }

    if (accion == 11) {
        if (velocidad_horizontal > 0) {
            direccion_horizontal = 1;
        } else if (velocidad_horizontal < 0) {
            direccion_horizontal = -1;
        }

        if (abs(velocidad_horizontal) < velocidad_horizontal_normal) {
            velocidad_horizontal += aceleracion * direccion_horizontal;
        }

        if (instance_exists(obj_efecto_boost)) {
            velocidad_horizontal = limite_velocidad_horizontal * direccion_horizontal;
        }

        velocidad_horizontal += -asin * (desaceleracion / 6);
        if (!tocando_suelo or !colision_con_riel()) {
            accion = 0;
        }
    }

    if ((accion == 11) or (accion == 16.5)) {
        if (!audio_is_playing(snd_grinding)) {
            audio_play_sound(snd_grinding, 1, false);
        }
    }

    if ((accion != 11) and (accion != 16.5) and (accion != 32) and (accion != 32.5) and audio_is_playing(snd_grinding)) {
        audio_stop_sound(snd_grinding);
    }

    // Usar swingbar
    if (accion == 12) {
        var swingbar_cercana = instance_nearest(x, y, obj_swingbar);
        x = swingbar_cercana.x;
        y = swingbar_cercana.y;

        velocidad_horizontal = 0;
        velocidad_vertical = 0;

        if (control.boton_presionado("boton_salto") and (((indice_sprite % 15) >= 0) and ((indice_sprite % 15) < 5))) {
            audio_play_sound(snd_vuelta_aerea, 1, false);
            accion = 13;
            velocidad_vertical = -8;
            velocidad_horizontal = direccion_horizontal * 10;
        } else if (control.boton_presionado("boton_salto")) {
            accion = 0;
            y += 10;
        }
    }

    // Terminar de usar la swingbar
    if (accion == 13) {
        if ((velocidad_vertical >= 2) or tocando_suelo) {
            accion = 0;
        }
    }

    // Iniciar evento especial Quick Time Event
    if (accion == 14) {
        gravedad = 0;

        if (direccion_horizontal == 1) {
            if (velocidad_horizontal > 0) {
                velocidad_horizontal -= 0.125;
            } else {
                velocidad_horizontal = 0.625;
            }
        } else {
            if (velocidad_horizontal < 0) {
                velocidad_horizontal += 0.125;
            } else {
                velocidad_horizontal = -0.625;
            }
        }
		
        if (velocidad_vertical < 0) {
            velocidad_vertical += 0.125;
        } else {
            velocidad_vertical = 0;
        }
    }

    // Superar evento especial Quick Time Event
    if (accion == 15) {
        velocidad_horizontal = direccion_horizontal * 9;
        if (tocando_suelo) {
            accion = 0;
        }
    }

    // Fallar evento especial Quick Time Event
    if (accion == 15.5) {
        velocidad_horizontal += direccion_horizontal * aceleracion * 2;

        if (tocando_suelo) {
            accion = 0;
        }
    }

    // Manejar el movimiento al pasar por una cinta de Moebius. Sin embargo, el manejo principal del movimiento se hace en obj_cinta_moebius.
    if (accion == 16) {
		var velocidad_insuficiente = (abs(obj_jugador.velocidad_horizontal) <= 4);
		var sin_colisionar = !place_meeting(x, y, obj_cinta_moebius);
		
        velocidad_vertical = 0;
        angulo = 0;

        if (tocando_suelo or velocidad_insuficiente or sin_colisionar) {
            accion = 0;
            indice_sprite = 0;
        }
    }

    if (accion == 16.5) {
		var velocidad_insuficiente = (abs(obj_jugador.velocidad_horizontal) <= 4);
		var sin_colisionar = !place_meeting(x, y, obj_riel_cinta_moebius);
		
        velocidad_vertical = 0;
        angulo = 0;

        if (tocando_suelo or velocidad_insuficiente or sin_colisionar) {
            accion = 11;
            indice_sprite = 0;
        }
    }

    // Pasar por el corkscrew mientras se esta rodando
    if (accion == 17) {
		var velocidad_insuficiente = (abs(obj_jugador.velocidad_horizontal) <= 4);
		var sin_colisionar = !place_meeting(x, y, obj_cinta_moebius);
		
        velocidad_vertical = 0;
        angulo = 0;

        if (tocando_suelo or velocidad_insuficiente or sin_colisionar) {
            accion = 2;
            indice_sprite = 0;
        }
    }

    // Pisoton
	manejo_movimiento_pisoton();

    // Mantenerse en la pared antes de saltar
    if (accion == 19) {
        velocidad_vertical = 0;
        velocidad_horizontal = 0;

        if (control.boton_presionado("boton_salto")) {
            alarm[2] = 0;
            direccion_horizontal = -direccion_horizontal;
            accion = 20;
            velocidad_vertical = -7;
            velocidad_horizontal = direccion_horizontal * 9;
            audio_play_sound(snd_walljump, 1, false);
        }
    }

    // Saltar de la pared
    if (accion == 20) {
        if (tocando_suelo or (velocidad_vertical >= 0)) {
            accion = 0;
        }
    }

    // Four Way Cannon
    if (accion == 21) {
        velocidad_vertical = 0;
        velocidad_horizontal = 0;

        if (control.boton_presionado("boton_salto")) {
            var permitir_disparo = false;
			var potencia_disparo = 10;
			
            if (control.boton_mantenido("boton_arriba")) {
                velocidad_vertical = -potencia_disparo;
                accion = 0;
                permitir_disparo = true;
            } else if (control.boton_mantenido("boton_derecha")) {
                alarma_0 = 30;
                gravedad = 0;
                velocidad_horizontal = potencia_disparo;
                accion = 6;
                permitir_disparo = true;
            } else if (control.boton_mantenido("boton_izquierda")) {
                alarma_0 = 30;
                gravedad = 0;
                velocidad_horizontal = -potencia_disparo;
                accion = 6;
                permitir_disparo = true;
            } else if (control.boton_mantenido("boton_abajo")) {
                velocidad_vertical = potencia_disparo;
                accion = 0;
                permitir_disparo = true;
            }

            if (permitir_disparo) {
                audio_play_sound(snd_fourwaycannon_disparo, 1, false);
                audio_play_sound(snd_rainbowring, 1, false);
            }
        }
    }

    // Ser herido
    if (accion == 22) {
        if (tocando_suelo) {
            velocidad_horizontal = 0;
            velocidad_vertical = 0;
        }

        if (indice_sprite >= 21) {
            indice_sprite = 0;
            accion = 0;
        }
    }

    // Light ring dash
	light_ring_cercano = instance_nearest(x, y, obj_lightdash_ring);
	distancia_light_ring = distance_to_object(light_ring_cercano);
	
    if ((distancia_light_ring <= 25) and control.boton_mantenido("boton_especial")) {
		var apuntando_derecha = ((light_ring_cercano.x > x) and (direccion_horizontal == 1));
		var apuntando_izquierda = ((light_ring_cercano.x < x) and (direccion_horizontal == -1));
		if (apuntando_derecha or apuntando_izquierda) then accion = 23;
	}

    if (accion == 23) {
        if (distancia_light_ring <= 50) {
	        angulo_imagen = point_direction(x, y, light_ring_cercano.x, light_ring_cercano.y);
			x = light_ring_cercano.x;
			y = light_ring_cercano.y;
		} else {			
            velocidad_horizontal = direccion_horizontal * 9 * cos(angulo_imagen);
            velocidad_vertical = 9 * sin(angulo_imagen);
            accion = 0;
			
			var audio_requerido;
			switch (global.personaje_actual) {
			    case "Sonic":
			        audio_requerido = snd_festejo_sonic;
			        break;
			    case "Shadow":
			        audio_requerido = snd_festejo_shadow;
			        break;
			}

			if (!audio_is_playing(audio_requerido)) {
				audio_play_sound(audio_requerido, 1, false);
			}
        }
    }

    // Impulsar hacia jump panel
    if (accion == 24) {
        var velocidad_impulso = 15;
        var jump_panel_requerido;

        velocidad_horizontal = 0;
        velocidad_vertical = 0;

        switch (jump_panel) {
            case 1:
                jump_panel_requerido = instance_nearest(x, y, obj_jumppanel_1);
                break;
            case 2:
                jump_panel_requerido = instance_nearest(x, y, obj_jumppanel_2);
                break;
            case 3:
                jump_panel_requerido = instance_nearest(x, y, obj_jumppanel_3);
                break;
            case 4:
                jump_panel_requerido = instance_nearest(x, y, obj_jumppanel_4);
                break;
            case 5:
                jump_panel_requerido = instance_nearest(x, y, obj_jumppanel_final);
                break;
        }

        move_towards_point(jump_panel_requerido.x, jump_panel_requerido.y, velocidad_impulso);
        if (x > jump_panel_requerido.x) {
            direccion_horizontal = -1;
        } else if (x < jump_panel_requerido.x) {
            direccion_horizontal = 1;
        }

        if (tocando_suelo or place_meeting(x, y, obj_jumppanel_final)) {
            accion = 0;
            velocidad_horizontal = direccion_horizontal * 5;
            jump_panel = 1;
        }
    }

    // Mantener pegado al jump panel
    if (accion == 25) {
        hspeed = 0;
        vspeed = 0;

        velocidad_horizontal = 0;
        velocidad_vertical = 0;

        var jump_panel_cercano = instance_nearest(x, y, obj_jumppanel);
        x = jump_panel_cercano.x - dsin(jump_panel_cercano.image_angle) * 4;
        y = jump_panel_cercano.y - dcos(jump_panel_cercano.image_angle) * 4;
    }

    // Morir
    if (accion == 26) {
        if (tocando_suelo) {
            velocidad_horizontal = 0;
            velocidad_vertical = 0;
        }
    }

    // Agarrarse de polea
    if (accion == 27) {
        var polea_cercana = instance_nearest(x, y, obj_manija_polea);
        x = polea_cercana.x
        y = polea_cercana.y + polea_cercana.vspeed;

        velocidad_vertical = 0;
        velocidad_horizontal = 0;
    }

    // Agarrarse de poste giratorio
    if (accion == 29) {
        if (place_meeting(x, y, obj_poste_giratorio)) {
            velocidad_horizontal = 0;
            velocidad_vertical = 0;

            x = instance_nearest(x, y, obj_poste_giratorio).x;
            y += 2;

            if (control.boton_presionado("boton_salto")) {
                accion = 1;

                if (control.boton_mantenido("boton_derecha")) {
                    velocidad_horizontal = 7;
                } else if (control.boton_mantenido("boton_izquierda")) {
                    velocidad_horizontal = -7;
                } else {
                    velocidad_horizontal = direccion_horizontal * 7;
                }
                audio_play_sound(snd_salto, 1, false);
            }
        } else {
            accion = 0;
        }
    }

    // Salto de bungee
    if (accion == 30) {
        velocidad_horizontal = 0;
        velocidad_vertical -= 0.5;
    }

    if (accion == 31) {
        velocidad_horizontal = 0;
        velocidad_vertical = 0;

        if (indice_sprite >= 16) {
            accion = 0;
        }
    }

    // Usar zipline
    if (accion == 32) {
        direccion_horizontal = 1;
        velocidad_vertical = 0;

        y = instance_nearest(x, y, obj_activador_zipline).y + 2;
        velocidad_horizontal += 0.125;
    }

    if (accion == 32.5) {
        velocidad_horizontal = 0;
        velocidad_vertical = 0;

        var final_zipline_cercano = instance_nearest(x, y, obj_final_zipline);
        move_towards_point(final_zipline_cercano.x, final_zipline_cercano.y - 12, velocidad_zipline);

        if (velocidad_zipline < limite_velocidad_horizontal) {
            velocidad_zipline += 0.125;
        }

        if (instance_exists(obj_efecto_boost)) {
            velocidad_zipline = limite_velocidad_horizontal;
        }
    }

    // Tirar de grab-pole
    if (accion == 33) {
        velocidad_vertical = 0;
        velocidad_horizontal = 0;
    }

    // Movimiento del auto-tunnel
    if (accion == 34) {
        velocidad_horizontal = 12;
        tocando_suelo = true;
    }

    // Rotate Jump Launcher
    if (accion >= 35 and accion < 36) {
        tocando_suelo = false;
    }

    if (accion == 35) {
        velocidad_vertical = 0;
        velocidad_horizontal = 0;

        canon_mas_cercano = instance_nearest(x, y, obj_canon);
        y = canon_mas_cercano.y;
        move_towards_point(canon_mas_cercano.x, canon_mas_cercano.y, 3);

        if (distance_to_point(canon_mas_cercano.x, canon_mas_cercano.y) < 2) {
            accion = 35.1;
            canon_mas_cercano.alarm[0] = 60;
        }
    }

    if (accion == 35.1) {
		canon_mas_cercano = instance_nearest(x, y, obj_canon);
        x = canon_mas_cercano.x;
        y = canon_mas_cercano.y;

        velocidad_horizontal = 0;
        velocidad_vertical = 0;
    }

    if (accion == 35.2) {
        if ((velocidad_vertical >= 2) or tocando_suelo) {
            accion = 0;
        }
    }

    // Wallrun
    if (accion == 36) {
        velocidad_horizontal = 10;
        velocidad_vertical = 0;
        tocando_suelo = false;

        var distancia = 56
        if (!collision_point(x, y - distancia, obj_superficie, true, true) and control.boton_presionado("boton_arriba")) {
            y -= distancia;
            audio_play_sound(snd_quickstep, 1, false)
        } else if (!collision_point(x, y + distancia, obj_superficie, true, true) and control.boton_presionado("boton_abajo")) {
            y += distancia;
            audio_play_sound(snd_quickstep, 1, false);
        }
    }

    // Ventilador gigante
    if ((accion != 26) and (accion != 37) and place_meeting(x, y, obj_ventilador_gigante)) {
        accion = 37;
        indice_sprite = 0;
    }

    if (accion == 37) {
        if (tocando_suelo) then accion = 0;

        if (place_meeting(x, y, obj_ventilador_gigante)) {
            if (velocidad_vertical > -2) {
                velocidad_vertical += -2;
            } else {
                velocidad_vertical = -2;
            }
        }

        if (control.boton_mantenido("boton_derecha")) {
            if (velocidad_horizontal > 0) {
                if (velocidad_horizontal < limite_velocidad_actual) {
                    velocidad_horizontal += aceleracion;
                }
            } else {
                velocidad_horizontal += desaceleracion;
            }
        }

        if (control.boton_mantenido("boton_izquierda")) {
            if (velocidad_horizontal < 0) {
                if (velocidad_horizontal > -limite_velocidad_actual) {
                    velocidad_horizontal -= aceleracion;
                }
            } else {
                velocidad_horizontal -= desaceleracion;
            }
        }

        if (!control.boton_mantenido("boton_derecha") and !control.boton_mantenido("boton_izquierda")) {
            if (velocidad_horizontal > 0) {
                velocidad_horizontal -= friccion;
            }

            if (velocidad_horizontal < 0) {
                velocidad_horizontal += friccion;
            }

            if ((velocidad_horizontal <= friccion) and (velocidad_horizontal >= -friccion)) {
                velocidad_horizontal = 0;
            }
        }

        if (control.boton_mantenido("boton_derecha") and control.boton_mantenido("boton_izquierda")) {
            if (abs(velocidad_horizontal) <= desaceleracion) then velocidad_horizontal = 0;
        }

        if (control.boton_mantenido("boton_izquierda") and !control.boton_mantenido("boton_derecha")) {
            direccion_horizontal = -1;
        } else if (control.boton_mantenido("boton_derecha") and !control.boton_mantenido("boton_izquierda")) {
            direccion_horizontal = 1;
        }
    }
	
	// Fisicas dentro del agua
	if (instance_exists(obj_profundidad_agua)) {
		var superficie_agua = instance_nearest(x, y, obj_superficie_agua);
		var colisionando_con_agua = collision_point(x, y, obj_profundidad_agua, true, true);
		var altura_salpicadura = superficie_agua.y - 16;
		
		if (not sumergido_agua and colisionando_con_agua) {
			sumergido_agua = true;
			
			// Efectos al entrar al agua
			instance_create_depth(x, altura_salpicadura, -10, obj_efecto_salpicadura_agua);
			audio_play_sound(snd_entrar_agua, 1, false);
			
			// Movimiento al entrar al agua
			velocidad_vertical *= 0.25;
			velocidad_horizontal *= 0.5;
			limite_velocidad_vertical = 3.5;
			limite_velocidad_horizontal = 8;
			altura_salto = -3.5;
			altura_salto_minima = -2;
		}
		
		if (sumergido_agua and not colisionando_con_agua) {
			sumergido_agua = false;
			
			// Efectos al salir del agua
			instance_create_depth(x, altura_salpicadura, -10, obj_efecto_salpicadura_agua);
			audio_play_sound(snd_salir_agua, 1, false);
			
			// Da un pequeño impulso al salir del agua
			if (accion == 1) then velocidad_vertical *= 1.625;
			
			// Movimiento al salir del agua
			limite_velocidad_vertical = 16;
			limite_velocidad_horizontal = 13;
			velocidad_horizontal_normal = 12;
			altura_salto = -6.5;
			altura_salto_minima = -4;
			
			// Fisicas al salir del agua
			aceleracion = 0.125;
			desaceleracion = 0.125;
			friccion = 0.046875;
			gravedad = 0.21875;
			friccion_bola = 0.023475;
			desaceleracion_bola = 0.1484375;
		}
		
		// Fisicas al estar dentro del agua
		if (sumergido_agua) {
			aceleracion = 0.0234375;
			desaceleracion = 0.25;
			friccion = 0.0234375;
			gravedad = 0.0625;
			friccion_bola = 0.0117375;
			desaceleracion_bola = 0.296875;
		}
	}
}
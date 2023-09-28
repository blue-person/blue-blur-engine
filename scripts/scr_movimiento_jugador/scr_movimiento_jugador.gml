function gestion_movimiento_jugador() {
	var distancia_light_ring = 0;
    var light_ring_cercano = noone;
	var canon_mas_cercano = noone;

    // Gestionar el boost
    gestion_boost();
	
    // Movimiento basico
    gestion_movimiento_basico();
	
    // Frenar al cambiar de direccion
    gestion_accion_frenar();

    // Gestion del salto
    gestion_accion_salto();

    // Aterrizar en el suelo
    gestion_accion_aterrizar();

    // Agacharse y rodar
    gestion_accion_agacharse();

    // Mirar hacia arriba
    gestion_accion_mirar_arriba();
	
    // Spindash
    gestion_spindash();

    // Homing attack
    gestion_homing_attack();

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
                sprite_index = spr_sonic_trotando;
                accion = 9;
                audio.reproducir_audio(snd_ataque_sonic_c);
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
                image_index = 0;

                if (abs(velocidad_horizontal) < 10) {
                    velocidad_horizontal = 10 * direccion_horizontal;
                }

                accion = 9;
                audio.reproducir_audio(snd_ataque_shadow_b);
                audio.reproducir_audio(snd_teletransportacion);
            }

            if (accion == 9) {
                if (velocidad_horizontal > 0) {
                    velocidad_horizontal -= friccion;
                }

                if (velocidad_horizontal < 0) {
                    velocidad_horizontal += friccion;
                }

                if ((image_index >= 24) or !tocando_suelo) {
                    accion = 0;
                }
            }
            break;
    }

    // Deslizarse por rieles (Grinding)
    gestion_grinding();

    // Usar swingbar
    gestion_uso_swingbar();

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
            image_index = 0;
        }
    }

    if (accion == 16.5) {
		var velocidad_insuficiente = (abs(obj_jugador.velocidad_horizontal) <= 4);
		var sin_colisionar = !place_meeting(x, y, obj_riel_cinta_moebius);
		
        velocidad_vertical = 0;
        angulo = 0;

        if (tocando_suelo or velocidad_insuficiente or sin_colisionar) {
            accion = 11;
            image_index = 0;
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
            image_index = 0;
        }
    }

    // Pisoton
	gestion_accion_pisoton();

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
            audio.reproducir_audio(snd_walljump);
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
                audio.reproducir_audio(snd_fourwaycannon_disparo);
                audio.reproducir_audio(snd_rainbowring);
            }
        }
    }

    // Ser herido
    if (accion == 22) {
        if (tocando_suelo) {
            velocidad_horizontal = 0;
            velocidad_vertical = 0;
        }

        if (image_index >= 21) {
            image_index = 0;
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
	        image_angle = point_direction(x, y, light_ring_cercano.x, light_ring_cercano.y);
			x = light_ring_cercano.x;
			y = light_ring_cercano.y;
		} else {			
            velocidad_horizontal = direccion_horizontal * 9 * cos(image_angle);
            velocidad_vertical = 9 * sin(image_angle);
            accion = 0;
			
			var audio_requerido = audio_festejo;
			audio.reproducir_audio_aislado(audio_requerido, false);
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
                jump_panel_requerido = instance_nearest(x, y, obj_jump_panel_1);
                break;
            case 2:
                jump_panel_requerido = instance_nearest(x, y, obj_jump_panel_2);
                break;
            case 3:
                jump_panel_requerido = instance_nearest(x, y, obj_jump_panel_3);
                break;
            case 4:
                jump_panel_requerido = instance_nearest(x, y, obj_jump_panel_4);
                break;
            case 5:
                jump_panel_requerido = instance_nearest(x, y, obj_jump_panel_final);
                break;
        }

        move_towards_point(jump_panel_requerido.x, jump_panel_requerido.y, velocidad_impulso);
        if (x > jump_panel_requerido.x) {
            direccion_horizontal = -1;
        } else if (x < jump_panel_requerido.x) {
            direccion_horizontal = 1;
        }

        if (tocando_suelo or place_meeting(x, y, obj_jump_panel_final)) {
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

        var jump_panel_cercano = instance_nearest(x, y, obj_jump_panel);
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
                audio.reproducir_audio(snd_salto);
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

        if (image_index >= 16) {
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
            audio.reproducir_audio(snd_quickstep, 1, false)
        } else if (!collision_point(x, y + distancia, obj_superficie, true, true) and control.boton_presionado("boton_abajo")) {
            y += distancia;
            audio.reproducir_audio(snd_quickstep);
        }
    }

    // Ventilador gigante
    if ((accion != 26) and (accion != 37) and place_meeting(x, y, obj_ventilador_gigante)) {
        accion = 37;
        image_index = 0;
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
	if (instance_exists(obj_water)) {
		var superficie_agua = instance_nearest(x, y, obj_superficie_agua);
		var colisionando_con_agua = collision_point(x, y, obj_water, true, true);
		var altura_salpicadura = superficie_agua.y - 16;
		
		if (not sumergido_agua and colisionando_con_agua) {
			sumergido_agua = true;
			
			// Efectos al entrar al agua
			instance_create_depth(x, altura_salpicadura, -10, obj_efecto_salpicadura_agua);
			audio.reproducir_audio(snd_entrar_agua);
			
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
			audio.reproducir_audio(snd_salir_agua);
			
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
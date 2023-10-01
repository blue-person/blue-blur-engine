function gestion_animaciones_shadow() {
    // Estando de pie
    if ((velocidad_horizontal = 0) and tocando_suelo and (accion == 0)) {
        sprite_index = spr_shadow_normal;
        fotograma += 0.20;
        ultima_accion_realizada = 0;
    }

    // Agacharse
    if (accion == -1) {
        sprite_index = spr_shadow_agachandose;

        if (controles.boton_mantenido("boton_abajo") and (image_index == 3)) {
            fotograma = 0;
        }
        else {
            fotograma += 0.5;
        }
    }

    // Mirar hacia arriba
    if (accion == -3) {
        sprite_index = spr_shadow_mirar_arriba;

        if (controles.boton_mantenido("boton_arriba") and (image_index == 2)) {
            fotograma = 0;
        }
        else {
            fotograma += 0.25;
        }
    }

    // Caminar, trotar y correr
    if (((velocidad_horizontal != 0) and tocando_suelo) and (accion == 0)) {
        if (ultima_accion_realizada == 0) {
            image_index = 0;
        }
        ultima_accion_realizada = 1;

        if (abs(velocidad_horizontal) < 3) {
            sprite_index = spr_shadow_caminando;
            fotograma += calcular_fotograma(6, 1);
        } else if ((abs(velocidad_horizontal) >= 3) and (abs(velocidad_horizontal) < 6)) {
            sprite_index = spr_shadow_trotando;
            fotograma += calcular_fotograma(7, 1);
        } else if ((abs(velocidad_horizontal) >= 6) and (abs(velocidad_horizontal) < 10)) {
            sprite_index = spr_shadow_patinando_a;
            fotograma += calcular_fotograma(9, 0.5);
        } else if ((abs(velocidad_horizontal) >= 10) and (abs(velocidad_horizontal) < 13)) {
            sprite_index = spr_shadow_patinando_b;
            fotograma += 1;
        } else if (abs(velocidad_horizontal) >= 13) {
            sprite_index = spr_shadow_volando;
            fotograma += 1
        }

        if ((sprite_index == spr_shadow_caminando) or (sprite_index == spr_shadow_trotando)) {
            if (image_index >= 8) {
                image_index = 0;
            }
        } else if (sprite_index == spr_shadow_volando) {
            if (image_index >= 5) {
                image_index = 0;
            }
        } else if (sprite_index == spr_shadow_patinando_a) {
            if (image_index >= 29) {
                image_index = 0;
            }
        }
        else {
            if (image_index >= 35) {
                image_index = 0;
            }
        }
    } else if (!tocando_suelo and (accion == 0)) {
        sprite_index = spr_shadow_saltando;
        fotograma += 0.25;

        if (velocidad_vertical < -3) {
            if (image_index >= 3) {
                image_index = 0;
            }
        }
        else {
            if (image_index < 3) {
                image_index = 3;
            }

            if (image_index >= 13) {
                image_index = 10;
            }
        }
    }

    // Frenar en el suelo
    if (accion == -4) {
        sprite_index = spr_shadow_frenando;

        if (image_index >= 8) {
            image_index = 0;
        }
        fotograma += 0.35;
    }

    // Saltar y rodar
    if ((accion == 1) and (velocidad_vertical > 0) and (collision_line(x, y, x, y + 80, obj_superficie, true, true) or velocidad_vertical > 9)) {
        if (sprite_index != spr_shadow_aterrizar) {
            image_index = 0;
        }
        sprite_index = spr_shadow_aterrizar;

        if (image_index >= 4) {
            image_index = 1;
        }
        fotograma += 0.5;
    } else if ((accion == 1) or (accion == 2) or (accion == 3) or (accion == 34)) {
        fotograma += calcular_fotograma(2, 1);
        sprite_index = spr_shadow_rodando_a;
    }

    // Spindash
    if (accion == -2) {
        sprite_index = spr_shadow_spindash;
        fotograma += 0.5;

        if ((image_index == 3) or (image_index == 7)) {
            image_index = 0;
        }

        if (controles.boton_presionado("boton_salto")) {
            image_index = 4;
        }
    }

    // Homing attack
    if (accion == 4) {
        fotograma += 1;
        sprite_index = spr_shadow_rodando_a;
    }

    if (accion == 4.5) {
        fotograma += 0.5;
        sprite_index = spr_shadow_impulso_aereo;
    }

    // Saltar en un trampolin
    if (accion == 5) {
        if (sprite_index == spr_shadow_saltando) {
            if (image_index >= 3) {
                image_index = 0;
            }
            fotograma += 0.25;

            if (velocidad_vertical >= -4) {
                accion = 0;
            }
        }

        if (sprite_index == spr_shadow_impulsarse_pared) {
            fotograma += 0.25;

            if (velocidad_vertical >= 0) {
                accion = 0;
            }
        }

        if (sprite_index == spr_shadow_cinta_moebius) {
            if (image_index <= 10) {
                fotograma += 0.25;
            } else {
                accion = 0;
            }
        }
    }

    // Walljump
    if (accion == 6) {
        sprite_index = spr_shadow_impulsarse_pared;
        fotograma += 0.25;
    }

    // Dashramp
    if (accion == 7) {
        if (velocidad_vertical < 2) {
            sprite_index = spr_shadow_impulsarse_pared;
            fotograma += 0.25;
        }
        else {
            sprite_index = spr_shadow_saltando;

            if ((velocidad_vertical >= 2) and (velocidad_vertical < 2.25)) {
                image_index = 7;
            }

            if (image_index < 7) {
                image_index = 7;
            }

            if (image_index >= 12) {
                image_index = 10;
            }

            fotograma += 0.25;
        }
    }

    // Dashpad
    if (accion == 8) {
        sprite_index = spr_shadow_spindash;
        fotograma += calcular_fotograma(2, 1);
    }

    // Deslizarse
    if (accion == 9) {
        sprite_index = spr_shadow_deslizarse_piso;
        fotograma += 0.5;
    }

    // Hacer acrobacias en el aire
    if (accion == 10) {
        if (image_index >= 10) {
            accion = 0;
            permitir_air_dash = true;
        }
        fotograma += 0.25;
    }

    // Deslizarse en un riel (Grinding)
    if ((accion == 11) and colision_con_riel() and tocando_suelo) {
        sprite_index = spr_shadow_deslizarse_riel;
        fotograma += 0.25;
    }

    // Usar swingbar
    if (accion == 12) {
        sprite_index = spr_shadow_usando_swingbar;
        fotograma += 0.35;
    }

    if (accion == 13) {
        sprite_index = spr_shadow_rodando_b;
        fotograma += 1;
    }

    // Iniciar evento Quick Time Event
    if (accion == 14) {
        sprite_index = spr_shadow_saltando;

        if (image_index >= 3) {
            image_index = 0;
        }
        fotograma += 0.25;
    }

    // Superar evento Quick Time Event
    if (accion == 15) {
        sprite_index = spr_shadow_superar_qte;
        fotograma += 0.2545;

        if (image_index >= 15) {
            accion = 0;
        }
    }

    // Fallar evento Quick Time Event
    if (accion == 15.5) {
        sprite_index = spr_shadow_fallar_qte;

        if (image_index <= 3) {
            fotograma += 0.15;
        }
        else {
            fotograma += 0.25;
        }

        if (image_index >= 9) {
            image_index = 7;
        }
    }

    // Correr por una cinta de mobius (Corkscrew)
    if (accion == 16) {
        sprite_index = spr_shadow_cinta_moebius;
    }

    if (accion == 16.5) {
        if (direccion_horizontal == 1) {
            sprite_index = spr_shadow_cinta_moebius_riel_a;
        }
        else {
            sprite_index = spr_shadow_cinta_moebius_riel_b;
        }
    }

    if (accion == 17) {
        sprite_index = spr_shadow_rodando_a;
        fotograma += calcular_fotograma(2, 1);
    }

    // Pisoton
    if (accion == 18) {
        sprite_index = spr_shadow_pisoton;
        fotograma += 0.5;
    }

    if (accion == 18.5) {
        sprite_index = spr_shadow_iniciar_pisoton;
        fotograma += 0.5;
    }

    // Walljump
    if (accion == 19) {
        sprite_index = spr_shadow_sostenerse_pared;
    }

    if (accion == 20) {
        sprite_index = spr_shadow_impulsarse_pared;
        fotograma += 0.25;
    }

    // Four Way Canon
    if (accion = 21) {
        sprite_index = spr_shadow_rodando_a;
        fotograma += 0.25;
    }

    // Ser herido
    if (accion == 22) {
        sprite_index = spr_shadow_herido;

        if (not (not tocando_suelo and (image_index == 1))) {
            fotograma += 0.25;
        }
    }

    // Light ring dash
    if (accion == 23) {
        sprite_index = spr_shadow_impulsarse_pared;
        fotograma += 0.5;
    }

    // Usar jump panel
    if (accion == 24) {
        sprite_index = spr_shadow_rodando_a;
        fotograma += 0.5;
    }

    if (accion == 25) {
        sprite_index = spr_shadow_jump_panel;
    }

    // Morir
    if (accion == 26) {
        sprite_index = spr_shadow_muriendo;

        if (not (not tocando_suelo and (image_index == 1))) {
            fotograma += 0.25;
        }

        if (image_index >= 4) then image_index = 4;
    }

    // Agarrarse de polea y de zipline
    if ((accion == 27) or (accion == 32) or (accion == 32.5) or (accion == 33)) {
        sprite_index = spr_shadow_agarrandose;
        fotograma += 0.125;
    }

    // Agarrarse de poste giratorio 
    if (accion == 29) {
        sprite_index = spr_shadow_poste_giratorio;
        fotograma += 0.25;
    }

    // Salto de bungee
    if (accion == 30) {
        sprite_index = spr_shadow_salto_bungee;
        fotograma += 0.25;
    }

    // Rotate Jump Launcher
    if ((accion == 35) or (accion == 35.1)) {
        sprite_index = spr_shadow_rodando_a;
        fotograma += 0.5;
    }

    if (accion == 35.2) {
        sprite_index = spr_shadow_rotate_jump_launcher;
        fotograma += 0.5;

        if (image_index >= 8) {
            image_index = 0;
        }
    }

    // Correr por la pared
    if (accion == 36) {
        sprite_index = spr_shadow_correr_pared;
        fotograma += 0.5;
    }

    // Ventilador gigante
    if (accion == 37) {
        sprite_index = spr_shadow_cinta_moebius;
        fotograma += 0.4;
    }
}
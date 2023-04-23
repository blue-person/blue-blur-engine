function dibujar_sprites_sonic() {
	// Estando de pie
	if ((velocidad_horizontal == 0) and tocando_suelo and (accion == 0)) {
	    sprite_actual = spr_sonic_normal;
	    fotograma += 0.20;
	    ultima_accion_realizada = 0;
	}

	// Agacharse
	if (accion == -1) {
	    sprite_actual = spr_sonic_agachandose;

	    if (obj_controles.boton_abajo.estado_retenido and (indice_sprite == 3)) {
	        fotograma = 0;
		}
	    else {
			fotograma += 0.5;
		}
	}

	// Mirar hacia arriba
	if (accion == -3) {
	    sprite_actual = spr_sonic_mirar_arriba;
    
	    if (obj_controles.boton_arriba.estado_retenido and (indice_sprite == 2)) {
			fotograma = 0;
		}
	    else {
			fotograma += 0.25;
		}       
	}

	// Caminar, trotar y correr
	if (((velocidad_horizontal != 0) and tocando_suelo) and (accion == 0)) {
		if (ultima_accion_realizada == 0) {
	        indice_sprite = 0;
	    }
	    ultima_accion_realizada = 1;
    
	    if (abs(velocidad_horizontal) < 3) {
	        sprite_actual = spr_sonic_caminando;
			fotograma += calcular_fotograma(6, 1);
	    } else if ((abs(velocidad_horizontal) >= 3) and (abs(velocidad_horizontal) < 6)) {
	        sprite_actual = spr_sonic_trotando;
			fotograma += calcular_fotograma(8, 1);
	    } else if ((abs(velocidad_horizontal) >= 6) and (abs(velocidad_horizontal) < 8)) {
	        sprite_actual = spr_sonic_corriendo_a;
			fotograma += calcular_fotograma(10, 1);
	    } else if ((abs(velocidad_horizontal) >= 8) and (abs(velocidad_horizontal) < 11)) {
	        sprite_actual = spr_sonic_corriendo_b;
			fotograma += calcular_fotograma(12, 1);
	    } else if (abs(velocidad_horizontal) >= 11) {
	        sprite_actual = spr_sonic_corriendo_c;
			fotograma += calcular_fotograma(13.5, 1.1);
	    }

	    if (indice_sprite >= 8) {
			indice_sprite = 0;
		}
	} else if (!tocando_suelo and (accion == 0)) {
	    if (velocidad_vertical < -1) {
	        sprite_actual = spr_sonic_saltando;
	        fotograma += 0.25;
	    } else if ((velocidad_vertical < 0) and (velocidad_vertical >= -1)) {
	        if (sprite_actual != spr_sonic_transicion_salto) {
				indice_sprite = 0;
			}
	        sprite_actual = spr_sonic_transicion_salto;
	        fotograma += 0.25;
	    } else if ((velocidad_vertical < 1) and (velocidad_vertical >= 0)) {
	        if (sprite_actual != spr_sonic_terminar_salto) {
	            indice_sprite = 0;
			}
	        sprite_actual = spr_sonic_terminar_salto;
	        fotograma += 0.25;
	    } else {
	        if (sprite_actual != spr_sonic_cayendo) {
	            indice_sprite = 0;
			}
	        sprite_actual = spr_sonic_cayendo;
	        fotograma += 0.25;
	    }
	}

	// Frenar en el suelo
	if (accion == -4) {
	    if ((sprite_actual != spr_sonic_frenando_a) and (sprite_actual != spr_sonic_frenando_b)) {
	        if (abs(velocidad_horizontal) > 7) {
				sprite_actual = spr_sonic_frenando_b;
			} else if (abs(velocidad_horizontal) <= 7) {
				sprite_actual = spr_sonic_frenando_a;
			}
	    }
    
	    if (sprite_actual == spr_sonic_frenando_a) {
	        if (indice_sprite >= 3) {
	            indice_sprite = 1;
			}
		} else if (sprite_actual == spr_sonic_frenando_b) {
	        if (indice_sprite >= 6) {
				indice_sprite = 3;
			}
	    }

	    fotograma += 0.35;
	}
	
	// Saltar y rodar
	if ((accion == 1) and (velocidad_vertical > 0) and (collision_line(x, y, x, y + 80, obj_superficie, true, true) or (velocidad_vertical > 9))) {
	    if (sprite_actual != spr_sonic_aterrizar) {
			indice_sprite = 0;
		}
	    sprite_actual = spr_sonic_aterrizar;
		
	    if (indice_sprite >= 4) {
			indice_sprite = 1;
		}
	    fotograma += 0.25;
	} else if ((accion == 1) or (accion == 2) or (accion == 3) or (accion == 34)) {
	    fotograma += calcular_fotograma(2, 1);
	    sprite_actual = spr_sonic_rodando_a;
	}

	if (sprite_actual == spr_sonic_aterrizar) {
		fotograma += 0.25;
	}

	// Spindash
	if (accion == -2) {
	    sprite_actual = spr_sonic_spindash;
	    fotograma += 0.5;

	    if ((indice_sprite == 3) or (indice_sprite == 7)) {
	        indice_sprite = 0;
		}

	    if (obj_controles.boton_salto.estado_pulsado) {
			indice_sprite = 4;
		}
	}
	
	// Homing attack
	if ((accion == 4) or (accion == 4.5)) {
	    fotograma += 1;
	    sprite_actual = spr_sonic_rodando_a;
	}

	// Saltar en un trampolin
	if (accion == 5) {
	    if (sprite_actual == spr_sonic_saltando) {
	        fotograma += 0.25;

	        if (velocidad_vertical >= -4) {
				accion = 0;
			}   
	    }

	    if (sprite_actual == spr_sonic_impulsarse_pared) {
	        fotograma += 0.25;

	        if (velocidad_vertical >= 0) {
				accion = 0;
			}   
	    }

	    if (sprite_actual == spr_sonic_cinta_moebius) {
	        if (indice_sprite <= 10) {
				fotograma += 0.25;
			} else {
	            accion = 0;
			}     
	    }   
	}

	// Walljump
	if (accion == 6) {
	    sprite_actual = spr_sonic_impulsarse_pared;
	    fotograma += 0.25;
	}

	// Dashramp
	if (accion == 7) {
		if (velocidad_vertical < 2) {
			sprite_actual = spr_sonic_impulsarse_pared;
			fotograma += 0.25;
		} else if ((velocidad_vertical < 4) and (velocidad_vertical >= 2)) {
			if (sprite_actual != spr_sonic_terminar_salto) {
				indice_sprite = 0;
			}
			sprite_actual = spr_sonic_terminar_salto;
			fotograma += 0.25;
	    } else {
			sprite_actual = spr_sonic_cayendo;
			fotograma += 0.25;
		}
	}

	// Dashpad
	if (accion == 8) {
	    sprite_actual = spr_sonic_rodando_a;
	    fotograma += calcular_fotograma(2, 1);
	}

	// Deslizarse
	if ((accion == 9) and ((sprite_actual == spr_sonic_cayendo) or (sprite_actual == spr_sonic_rodando_a) or (sprite_actual == spr_sonic_caminando) or (sprite_actual == spr_sonic_trotando) or (sprite_actual == spr_sonic_corriendo_a) or (sprite_actual == spr_sonic_corriendo_b) or (sprite_actual == spr_sonic_corriendo_c))) {   
	    indice_sprite = 0;
	    sprite_actual = spr_sonic_empezar_deslizarse;
	}

	if ((accion == 9) and (sprite_actual == spr_sonic_empezar_deslizarse)) {
	    fotograma += 0.5;
	}
    
	if ((accion == 9) and (sprite_actual == spr_sonic_empezar_deslizarse) and (indice_sprite >= 3)) {
	    sprite_actual = spr_sonic_deslizandose;
	}
    
	if ((accion == 9) and (sprite_actual == spr_sonic_deslizandose)) {
	    fotograma += calcular_fotograma(7, 1);
	}

	// Hacer acrobacias en el aire
	if (accion == 10) {
	    if (indice_sprite >= 9) {
	        accion = 0;
	        permitir_air_dash = true;
	    }
	    fotograma += 0.25;
	}

	// Deslizarse en un riel (Grinding)
	if ((accion == 11) and colision_con_riel() and tocando_suelo) {
	    if (abs(velocidad_horizontal) < 8.5) {
			sprite_actual = spr_sonic_deslizandose_riel_a;
		} else {
	        sprite_actual = spr_sonic_deslizandose_riel_b;
		}
	    fotograma += 0.5;
	}

	// Usar swingbar
	if (accion == 12) {
	    sprite_actual = spr_sonic_usando_swingbar;
	    fotograma += 0.35;
	}

	if (accion == 13) {
	    sprite_actual = spr_sonic_rodando_b;
	    fotograma += 1;
	}

	// Iniciar evento Quick Time Event
	if (accion == 14) {
	    sprite_actual = spr_sonic_saltando;
	    fotograma += 0.25;
	}

	// Superar evento Quick Time Event
	if (accion == 15) {
	    sprite_actual = spr_sonic_superar_qte;
	    fotograma += 0.35;

	    if (indice_sprite >= 22) {
			accion = 0;
		}
	}

	// Fallar evento Quick Time Event
	if (accion == 15.5) {
	    sprite_actual = spr_sonic_fallar_qte;

	    if (indice_sprite <= 3) {
			fotograma += 0.15;
		} else {
	        fotograma += 0.25;
		}

	    if (indice_sprite >= 7) {
			indice_sprite = 5;
		}
	}

	// Correr por una cinta de mobius (Corkscrew)
	if (accion == 16) {
	    sprite_actual = spr_sonic_cinta_moebius;
	}

	if (accion == 16.5) {
	    if (direccion_horizontal == 1) {
			sprite_actual = spr_sonic_cinta_moebius_riel_a;
		} else {
	        sprite_actual = spr_sonic_cinta_moebius_riel_b;
		}
	}

	if (accion == 17) {
	    sprite_actual = spr_sonic_rodando_a;
	    fotograma += calcular_fotograma(2, 1);
	}

	// Pisoton
	if (accion == 18) {
	    sprite_actual = spr_sonic_pisoton;
	    fotograma += 0.5;
	}

	// Walljump
	if (accion == 19) {
	    sprite_actual = spr_sonic_sostenerse_pared;
	}

	if (accion == 20) {
	    sprite_actual = spr_sonic_impulsarse_pared;
	    fotograma += 0.25;
	}

	// Four Way Canon
	if (accion = 21) {
	    sprite_actual = spr_sonic_rodando_b;
	    fotograma += 0.25;
	}

	// Ser herido
	if (accion == 22) {
	    sprite_actual = spr_sonic_herido;

	    if (!(!tocando_suelo and (indice_sprite == 4))) {
	        fotograma += 0.25;
		}
	}

	// Light ring dash
	if (accion == 23) {
	    sprite_actual = spr_sonic_impulsarse_pared;
	    fotograma += 0.5;
	}

	// Usar jump panel
	if (accion == 24) {
	    sprite_actual = spr_sonic_rodando_a;
	    fotograma += 0.5;
	}

	if (accion == 25) {
	    sprite_actual = spr_sonic_jump_panel;
	}

	// Morir
	if (accion == 26) {
	    sprite_actual = spr_sonic_muriendo;

	    if (!(!tocando_suelo and (indice_sprite == 4))) {
	        fotograma += 0.25;
		}

	    if (indice_sprite >= 11) {
			indice_sprite = 10;
		}
	}

	// Agarrarse de polea y de zipline
	if ((accion == 27) or (accion == 32) or (accion == 32.5) or (accion == 33)) {
	    sprite_actual = spr_sonic_agarrandose;
	    fotograma += 0.125;
	}

	// Agarrarse de poste giratorio 
	if (accion == 29) {
	    sprite_actual = spr_sonic_poste_giratorio;
	    fotograma += 0.25;
	}

	// Salto de bungee
	if (accion == 30) {
	    sprite_actual = spr_sonic_salto_bungee;
	    fotograma += 0.25;
	}

	// Rotate Jump Launcher
	if ((accion == 35) or (accion == 35.1)) {
	    sprite_actual = spr_sonic_rodando_a;
	    fotograma += 0.5;
	}

	if (accion == 35.2) {
	    sprite_actual = spr_sonic_rotate_jump_launcher;
	    fotograma += 0.5;

	    if (indice_sprite >= 8) {
			indice_sprite  = 0;
		}
	}

	// Correr por la pared
	if (accion == 36) {
	    sprite_actual = spr_sonic_correr_pared;
	    fotograma += 0.5;
	}

	// Ventilador gigante
	if (accion == 37) {
	    sprite_actual = spr_sonic_cinta_moebius;
	    fotograma += 0.4;
	}
}
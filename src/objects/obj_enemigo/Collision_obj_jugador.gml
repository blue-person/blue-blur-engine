if (((other.accion == 1) or (other.accion == -2) or (other.accion == 4) or (other.accion == 4.5) or (other.accion == 13)) and (!other.tocando_suelo) and (!instance_exists(obj_efecto_boost))) {
    dibujar_efectos(spr_efecto_destruccion_enemigo, 0, 1, 1, false);
    
    if ((other.accion == 4) and permitir_ser_apuntado) {
        other.indice_sprite = 0;
        other.accion = 10;

        switch (global.personaje_actual) {
            case "Sonic":
                other.sprite_actual = choose(spr_sonic_acrobacia_a, spr_sonic_acrobacia_a, spr_sonic_acrobacia_c);
                audio.reproducir_audio_aleatorio([snd_ataque_sonic_a, snd_ataque_sonic_b, snd_ataque_sonic_c]);
                break;
            case "Shadow":
                other.sprite_actual = spr_shadow_saltando;
                other.indice_sprite = 2;
                audio.reproducir_audio_aleatorio([snd_ataque_shadow_a, snd_ataque_shadow_b, snd_ataque_shadow_c]);
                break;
        }
        
        permitir_ser_apuntado = false;
        recibio_golpe = true;

        hspeed = other.hspeed;
        vspeed = other.vspeed;

        other.velocidad_horizontal = 0;
        other.velocidad_vertical = -6.5;
        alarm[0] = 30;
    } else {
        other.velocidad_vertical = -other.velocidad_vertical;
        recibio_golpe = true;
        instance_destroy();
    }

    if (instance_exists(obj_enfoque_homing)) {
        instance_destroy(obj_enfoque_homing);
    }

    audio.reproducir_audio_aleatorio([snd_explosion_enemigo_a, snd_explosion_enemigo_b, snd_explosion_enemigo_c]);
} else if (instance_exists(obj_efecto_boost) or (other.accion == 9)) {
    if (permitir_ser_apuntado and !recibio_golpe) {
        permitir_ser_apuntado = false;
        recibio_golpe = true;

        dibujar_efectos(spr_efecto_destruccion_enemigo, 0, 1, 1, false);
        audio.reproducir_audio_aleatorio([snd_explosion_enemigo_a, snd_explosion_enemigo_b, snd_explosion_enemigo_c]);
        y -= 10;

        if (abs(other.velocidad_horizontal) >= 4) {
            sacudir_camara(6, 25);
        }

        if (other.tocando_suelo) {
            hspeed = other.velocidad_horizontal;
            vspeed = -2.5;
        } else {
            hspeed = other.velocidad_horizontal;
            vspeed = other.velocidad_vertical;
        }

        alarm[0] = 30;
    }
} else if ((other.accion == -2) or (other.accion == 2) or (other.accion == 18)) {
    recibio_golpe = true;
    dibujar_efectos(spr_efecto_destruccion_enemigo, 0, 1, 1, false);
    instance_destroy();
} else if (permitir_ser_apuntado and other.permitir_ser_apuntado) {
    herir_jugador();
}

efecto_haptico_colision();
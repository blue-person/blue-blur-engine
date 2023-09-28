function gestion_homing_attack(){
    var elemento_apuntable_cercano = instance_nearest(x, y, obj_apuntable);
	
	if ((accion == 1) or ((accion == 0) and !tocando_suelo) or (accion == 10) or (accion == 13)) {
        puede_hacer_homing = true;
    } else {
        puede_hacer_homing = false;
    }

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
                audio.reproducir_audio(snd_homing_attack);
            }

            accion = 4;
            velocidad_horizontal = 0;
            velocidad_vertical = 0;
            move_towards_point(obj_enfoque_homing.x, obj_enfoque_homing.y, 20);
        }
    } else {
        if (control.boton_presionado("boton_salto") and !tocando_suelo and ((accion == 1) or (accion == 0)) and !permitir_homing_attack and permitir_air_dash) {
            if (accion != 4.5) {
                audio.reproducir_audio(audio_homing_dash);
            }

            accion = 4.5;
            alarma_2 = 15;
            permitir_homing_attack = true;
            permitir_air_dash = false;
            image_index = 0;
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
		
		var velocidad_homing_attack = obj_jugador.velocidad_homing_attack;
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
}
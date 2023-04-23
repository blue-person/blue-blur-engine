if (activar_evento and (other.accion != 26)) {
    other.angulo = 0;
	
    if ((image_angle == 0) or (image_angle == 180)) {
        other.gravedad = 0;
        other.alarma_0 = tiempo_alarma;
        other.accion = 6; 
    } else {
        other.accion = 5;
		switch (global.personaje_actual) {
		    case "Sonic":
		        if ((image_angle == 45) or (image_angle == 135)) {
	                other.indice_sprite = 0;
	                other.sprite_actual = spr_sonic_cinta_moebius;
	            } else if (((image_angle > 0) and (image_angle < 45)) or ((image_angle < 180) and (image_angle > 135))) {
	                other.sprite_actual = spr_sonic_impulsarse_pared;
	            } else {
	                other.sprite_actual = spr_sonic_saltando;
	            }
		        break;
			case "Shadow":
	            if ((image_angle == 45) or (image_angle == 135)) {
	                other.indice_sprite = 0;
	                other.sprite_actual = spr_shadow_cinta_moebius;
	            } else if (((image_angle > 0) and (image_angle < 45)) or ((image_angle < 180) and (image_angle > 135))) {
	                other.sprite_actual = spr_shadow_impulsarse_pared;
	            } else {
	                other.sprite_actual = spr_shadow_saltando;
					
	                if ((image_angle <= -45) and (image_angle >= -135)) {
	                    other.indice_sprite = 10;
					}
	            }
				break;
        }
    }
	
    other.tocando_suelo = false;
    other.indice_sprite = 0;
    other.x = x;
    other.y = y;
    other.velocidad_horizontal = dcos(image_angle) * cantidad_fuerza;
    other.velocidad_vertical = -dsin(image_angle) * cantidad_fuerza;
	other.cantidad_boost += 25;
	activar_evento = false;
	
    if ((image_angle < 90) and ((image_angle > 270) or (image_angle > -90))) {
        other.direccion_horizontal = 1;
	} else if ((image_angle > 90) and ((image_angle < 270) or (image_angle < -90))) {
        other.direccion_horizontal = -1;
	}

    efecto = instance_create_depth(x, y, 0, obj_efecto_rainbowring);
    efecto.image_angle = image_angle;
    
	global.puntaje_cool += 1000;
    dibujar_efectos(spr_efecto_rainbowring);
	reproducir_efecto_sonido(snd_rainbowring, 1, false);
}
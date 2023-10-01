function gestion_lightdash() {
	var light_ring_cercano = instance_nearest(x, y, obj_lightdash_ring);
	var distancia_light_ring = distance_to_object(light_ring_cercano);
	
    if ((distancia_light_ring <= 25) and controles.boton_mantenido("boton_especial")) {
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
}
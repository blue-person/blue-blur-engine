function gestion_fisicas_agua_entidad() {
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
if (activar_evento and (other.accion != 26)) {
	obj_jugador.usando_boost = false;
    other.tocando_suelo = false;
    other.accion = 7;
    other.indice_sprite = 0;
    other.x = x;
    other.y = y - 20;
    other.velocidad_horizontal = 12 * image_xscale;
    other.velocidad_vertical = -cantidad_fuerza;
    other.direccion_horizontal = image_xscale;
	
    if (image_xscale == 1) {
        dibujar_efectos(spr_efecto_velocidad, 30, 1, 1, true);
    } else {
        dibujar_efectos(spr_efecto_velocidad, -30, -1, 1, true);
    }
    
	activar_evento = false;
    reproducir_efecto_sonido(snd_dashramp, 1, false);
	
	obj_controles.permitir_uso_controles = false;
}
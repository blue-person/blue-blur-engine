if (activar_evento and (other.accion != 26)) {
	other.permitir_uso_boost = false;
    other.tocando_suelo = false;
    other.accion = 7;
    other.image_index = 0;
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
    audio.reproducir_audio_aislado(snd_dashramp, false);
	
	controles.inhabilitar_lectura(2);
}
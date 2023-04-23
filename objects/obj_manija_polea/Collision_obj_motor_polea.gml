if (activar_evento) {
    obj_jugador.accion = 0;
    obj_jugador.velocidad_vertical = -cantidad_fuerza;
    vspeed = 0;
	
    if (audio_is_playing(snd_usar_polea)) {
        audio_stop_sound(snd_usar_polea);
	  }
}
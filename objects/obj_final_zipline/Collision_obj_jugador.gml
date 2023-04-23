if ((other.accion == 32.5) and (x <= other.x)) {
    other.accion = 0;
    other.velocidad_horizontal = other.velocidad_zipline;
    other.velocidad_vertical = 0;
    other.velocidad_zipline = 0;

    if (audio_is_playing(snd_usar_polea)) {
        audio_stop_sound(snd_usar_polea);
	  }
}
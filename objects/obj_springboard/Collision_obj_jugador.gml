if (other.tocando_suelo and (((other.x >= x) and (image_xscale == 1)) or ((other.x <= x) and (image_xscale == -1)))) {
    other.tocando_suelo = false;
    other.velocidad_vertical = -cantidad_fuerza;
    other.accion = 0;
    other.angulo = 0;
    audio_play_sound(snd_springboard, 1, false);
}

image_index = 1;
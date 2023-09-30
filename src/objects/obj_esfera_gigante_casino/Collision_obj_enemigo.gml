with (other) {
    if (permitir_ser_apuntado) {
        permitir_ser_apuntado = false;
        hspeed = other.velocidad_horizontal;
		vspeed = other.velocidad_vertical;
        alarm[0] = 30;
		audio.reproducir_audio_aleatorio([snd_explosion_enemigo_a, snd_explosion_enemigo_b, snd_explosion_enemigo_c]);
    }
}
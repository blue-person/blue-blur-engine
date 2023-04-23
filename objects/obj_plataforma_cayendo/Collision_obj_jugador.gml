if (other.tocando_suelo and !activar_evento) {
    activar_evento = true;
    alarm[0] = tiempo_alarma;
    audio_play_sound(snd_plataforma_temblando, 1, false);
}

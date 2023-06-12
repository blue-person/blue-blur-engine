if (other.tocando_suelo and !activar_evento) {
    activar_evento = true;
    alarm[0] = tiempo_alarma;
    audio.reproducir_audio(snd_plataforma_temblando);
}

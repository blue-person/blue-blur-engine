if (activar_evento) {
    vspeed = 0;
    jugador.accion = 0;
    jugador.velocidad_vertical = -cantidad_fuerza;
    audio.detener_audio(snd_usar_polea);
}
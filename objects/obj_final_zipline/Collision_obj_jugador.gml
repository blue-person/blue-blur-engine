if ((other.accion == 32.5) and (x <= other.x)) {
    other.accion = 0;
    other.velocidad_horizontal = other.velocidad_zipline;
    other.velocidad_vertical = 0;
    other.velocidad_zipline = 0;

    audio.detener_audio(snd_usar_polea);
}
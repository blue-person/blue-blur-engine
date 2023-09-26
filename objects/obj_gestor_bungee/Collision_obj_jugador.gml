if (activar_evento and (other.tocando_suelo) and (other.velocidad_horizontal >= 4)) {
    activar_evento = false;
    other.angulo = 0;
    other.tocando_suelo = false;
    other.x = x + image_xscale * 2;
    other.y = y + 15;
    other.image_index = 0;
    audio.reproducir_audio(snd_agarrar_objeto);
    other.direccion_horizontal = image_xscale;
    alarm[0] = 15;
    other.accion = 30;
    other.velocidad_horizontal = 0;
    other.velocidad_vertical = 7;
} else if (!activar_evento and permitir_salto and (other.accion == 30) and (other.velocidad_vertical < 0)) {
    permitir_salto = false;
    other.accion = 0;
    other.velocidad_horizontal = 0;
    other.velocidad_vertical = -13;
    activar_evento = true;
    audio.reproducir_audio(snd_trampolin);
}
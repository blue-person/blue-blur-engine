var mitad_ancho = sprite_width / 2;
var colision_jugador = collision_line(x - mitad_ancho, y, x + mitad_ancho, y, obj_jugador, true, true)
if (colision_jugador and !obj_jugador.tocando_suelo and (obj_jugador.velocidad_vertical > 0)) {
    obj_jugador.accion = 1;
    obj_jugador.velocidad_vertical = -7;

    audio.reproducir_audio_aislado(snd_trampolin_volador, false);
    y += 16;
}

if (y > y_inicial) {
    y += velocidad_retroceso;
    velocidad_retroceso -= 0.125;

    if (velocidad_retroceso > 1) {
        velocidad_retroceso = 1;
    }
} else {
    y = y_inicial;
    velocidad_retroceso = 0;
}
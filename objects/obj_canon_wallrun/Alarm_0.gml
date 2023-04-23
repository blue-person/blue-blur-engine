if ((angulo_conducto <= 90) and (angulo_conducto >= -90)) {
    obj_jugador.direccion_horizontal = 1;
} else {
    obj_jugador.direccion_horizontal = -1;
}

obj_jugador.accion = 36;
audio_play_sound(snd_fourwaycannon_disparo, 1, false);
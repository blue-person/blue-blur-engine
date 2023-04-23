if ((angulo_conducto <= 90) and (angulo_conducto >= -90)) {
    obj_jugador.direccion_horizontal = 1;
} else {
    obj_jugador.direccion_horizontal = -1;
}

obj_jugador.hspeed = 0;
obj_jugador.vspeed = 0;
obj_jugador.velocidad_horizontal = dcos(angulo_conducto) * cantidad_fuerza;
obj_jugador.velocidad_vertical = -dsin(angulo_conducto) * cantidad_fuerza;
obj_jugador.accion = 35.2;

audio_play_sound(snd_fourwaycannon_disparo, 1, false);
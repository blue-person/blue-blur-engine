if (activar_evento) {
    obj_jugador.accion = 0;
    obj_jugador.velocidad_vertical = -cantidad_fuerza;
    vspeed = 0;
	
    audio.detener_audio(snd_usar_polea);
}
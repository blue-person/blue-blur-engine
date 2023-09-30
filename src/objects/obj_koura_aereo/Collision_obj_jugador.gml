var colision_a = (collision_line(x - 12, y - 8, x + 7, y - 8, obj_jugador, true, true) and (image_xscale == 1));
var colision_b = (collision_line(x + 12, y - 8, x - 7, y - 8, obj_jugador, true, true) and (image_xscale == -1));

if (permitir_ser_apuntado and !obj_jugador.tocando_suelo and (colision_a or colision_b)) {
    obj_jugador.accion = 0;
    obj_jugador.velocidad_vertical = -cantidad_fuerza;
	
    if (obj_jugador.accion == 4) {
        obj_jugador.velocidad_horizontal = 0;  
    }
	
    if (accion == 0) {
		audio.reproducir_audio(snd_trampolin);
	}
	
    accion = 1;
    image_index = 2;
} else {
    event_inherited();
}

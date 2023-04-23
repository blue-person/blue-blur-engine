var jugador_dentro_radio = collision_circle(x, y, 60, obj_jugador, true, true);
var colision_jugador = place_meeting(x, y, obj_jugador);

if (activar_efecto and colision_jugador and jugador_dentro_radio) {
    if (obj_controles.boton_salto.estado_pulsado and (obj_jugador.tocando_suelo == false) and (obj_jugador.accion != 26)) {
        obj_jugador.direccion_horizontal = image_xscale;
        obj_jugador.accion = 15;
        obj_jugador.velocidad_vertical = -cantidad_fuerza;
        obj_jugador.indice_sprite = 0;
		
        audio_play_sound(snd_acrobacia_aerea, 1, false);
        audio_play_sound(snd_rainbowring, 1, false);
        dibujar_efectos(spr_efecto_acrobacias_aereas);
		
		activar_efecto = false;
    }
} else if (!activar_efecto) {
    image_xscale -= 0.1;
    image_yscale -= 0.1;
    image_alpha -= 0.1;
    
	
    if (image_alpha <= 0) {
		instance_destroy();
	}
}
var jugador_dentro_radio = collision_circle(x, y, 60, obj_jugador, true, true);
var colision_jugador = place_meeting(x, y, obj_jugador);

if (activar_efecto and colision_jugador and jugador_dentro_radio) {
    if (control.boton_presionado("boton_salto") and (obj_jugador.tocando_suelo == false) and (obj_jugador.accion != 26)) {
        obj_jugador.direccion_horizontal = image_xscale;
        obj_jugador.accion = 15;
        obj_jugador.velocidad_vertical = -cantidad_fuerza;
        obj_jugador.indice_sprite = 0;
		
        audio.reproducir_audio(snd_acrobacia_aerea);
        audio.reproducir_audio(snd_rainbowring);
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
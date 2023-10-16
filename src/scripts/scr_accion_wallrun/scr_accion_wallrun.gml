function gestion_accion_wallrun() {
	var colision_con_pared = place_meeting(x, y, obj_pared);
	if (accion == 36 and colision_con_pared) {
        velocidad_horizontal = 10;
        velocidad_vertical = 0;
        tocando_suelo = false;

        var distancia = 56
        if (!collision_point(x, y - distancia, obj_superficie, true, true) and controles.boton_presionado("boton_arriba")) {
            y -= distancia;
            audio.reproducir_audio(snd_quickstep, 1, false)
        } else if (!collision_point(x, y + distancia, obj_superficie, true, true) and controles.boton_presionado("boton_abajo")) {
            y += distancia;
            audio.reproducir_audio(snd_quickstep);
        }
    } else if (not colision_con_pared and accion == 36) {
		accion = 0;
	}
}
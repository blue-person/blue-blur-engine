function gestion_accion_wallrun() {
	if (accion == 36) {
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
    }
}
function gestion_uso_swingbar(){
	// Usar la swingbar
	if (accion == 12) {
        var swingbar_cercana = instance_nearest(x, y, obj_swingbar);
        x = swingbar_cercana.x;
        y = swingbar_cercana.y;

        velocidad_horizontal = 0;
        velocidad_vertical = 0;

        if (control.boton_presionado("boton_salto") and (((image_index % 15) >= 0) and ((image_index % 15) < 5))) {
            audio.reproducir_audio(snd_vuelta_aerea);
            accion = 13;
            velocidad_vertical = -8;
            velocidad_horizontal = direccion_horizontal * 10;
        } else if (control.boton_presionado("boton_salto")) {
            accion = 0;
            y += 10;
        }
    }

    // Terminar de usar la swingbar
    if (accion == 13) {
        if ((velocidad_vertical >= 2) or tocando_suelo) {
            accion = 0;
        }
    }
}
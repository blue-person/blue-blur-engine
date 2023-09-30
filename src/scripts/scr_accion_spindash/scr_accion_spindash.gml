function gestion_spindash() {
	if (velocidad_spindash > 0) {
        velocidad_spindash = velocidad_spindash - ((velocidad_spindash div 1) / 265);
    }

    if (velocidad_spindash > 192) {
        velocidad_spindash = 192;
    }

    if ((accion == -2) and control.boton_presionado("boton_salto")) {
        velocidad_spindash += 8;
        audio.reproducir_audio(snd_cargar_spindash);
    }

    if ((accion == -2) and !control.boton_mantenido("boton_abajo")) {
        velocidad_horizontal = direccion_horizontal * 9 + (direccion_horizontal * floor(velocidad_spindash) / 8);
        accion = 2;
        velocidad_spindash = 0;
        audio.reproducir_audio(snd_soltar_spindash);
    }

    if ((accion == -1) and control.boton_presionado("boton_salto")) {
        velocidad_spindash = 0;
        accion = -2;
        image_index = 0;
        instance_create_depth(x, y, 0, obj_humo_spindash);
        audio.reproducir_audio(snd_cargar_spindash);
    }
}
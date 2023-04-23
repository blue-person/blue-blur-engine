if ((other.accion == 24) and activar_evento) {
    activar_evento = false;
    other.angulo_imagen = image_angle;
    other.accion = 25;

	instance_create_depth(x, y, -100, obj_qte_jumppanel);
    audio_play_sound(snd_tocar_jumppanel, 1, false);
}
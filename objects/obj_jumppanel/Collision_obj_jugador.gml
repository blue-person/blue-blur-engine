if ((other.accion == 24) and activar_evento) {
    activar_evento = false;
    other.angulo_imagen = image_angle;
    other.accion = 25;

	instance_create_depth(x, y, -100, obj_qte_jumppanel);
    audio.reproducir_audio(snd_tocar_jumppanel);
}
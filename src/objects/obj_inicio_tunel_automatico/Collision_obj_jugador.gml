if (other.accion != 34) {
    other.direccion_horizontal = 1;
    other.angulo = image_angle;
    other.tocando_suelo = true;
    other.accion = 34;
    
    if (instance_exists(obj_efecto_boost)) {
        obj_efecto_boost.activar_efecto = false;
    }
    
    audio.reproducir_audio(snd_rodar);
}
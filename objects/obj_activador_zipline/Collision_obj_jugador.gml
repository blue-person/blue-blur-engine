var accion_permitida = (other.accion == 0) or (other.accion == 1) or (other.accion == 7)

if (activar_evento and accion_permitida and !other.tocando_suelo) {
    audio.reproducir_audio(snd_agarrar_objeto);
	audio.reproducir_audio(snd_usar_polea);

    activar_evento = false;
	
    other.accion = 32;
    other.velocidad_zipline = other.velocidad_horizontal;
    other.y = y + 6;
    
    if (instance_exists(obj_efecto_boost)) {
        obj_efecto_boost.activar_efecto = false;
    }
}
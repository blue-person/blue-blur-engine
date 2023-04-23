if (activar_evento and (other.accion == 11) and (other.accion != 26)) {
    other.velocidad_horizontal = image_xscale * other.limite_velocidad_horizontal;
    other.direccion_horizontal = image_xscale;
    other.tocando_suelo = true;
    activar_evento = false;
	
    reproducir_efecto_sonido(snd_dashpad, 1, false);
    
    dibujar_efectos(spr_efecto_velocidad, image_angle, image_xscale, 1, false);
}
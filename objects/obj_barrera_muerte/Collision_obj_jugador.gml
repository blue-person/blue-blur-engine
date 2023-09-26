if (other.accion != 26) {
    other.image_index = 0;
    other.accion = 26;
    other.permitir_ser_apuntado = false;
    other.alarma_3 = 120;
    obj_camara.desactivar_enfoque();
    obj_cronometro.detener_cronometro();
    
    if (instance_exists(obj_hud_normal)) {
      obj_hud_normal.mostrar_en_pantalla = false;
	}
	
	reproducir_sonido_muerte();
}
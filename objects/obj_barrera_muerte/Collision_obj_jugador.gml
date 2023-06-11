if (other.accion != 26) {
    other.indice_sprite = 0;
    other.accion = 26;
    other.permitir_ser_apuntado = false;
    other.alarma_3 = 120;
    obj_camara.objeto_enfocado = noone;
    obj_cronometro.permitir_medir_tiempo = false;
    
    if (instance_exists(obj_hud_normal)) {
      obj_hud_normal.mostrar_en_pantalla = false;
	}
	
	reproducir_sonido_muerte();
}
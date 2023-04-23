if (activar_evento and !evento_finalizado) {
    vspeed = -velocidad_movimiento_abrir;
	
    if (y <= ubicacion_vertical_final) {
		evento_finalizado = true;
	}
}

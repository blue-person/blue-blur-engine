event_inherited()

if (accion == 0) {
    if (image_index >= 2) {
		image_index = 0;
	}
	
    image_speed = 0.25;
} else {
    image_speed = 0.5;
    hspeed = 0;
	
    if (image_index >= 7) {
        accion = 0;
        hspeed = image_xscale * velocidad_movimiento;
    }   
}

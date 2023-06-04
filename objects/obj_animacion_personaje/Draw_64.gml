var mitad_ancho_resolucion = pantalla.obtener_ancho() / 2;
var mitad_altura_resolucion = pantalla.obtener_altura()  / 2;

switch (animacion_actual) {
    case 1:
        x = 410;
		y = 35;
		draw_self();
		
		if ((obj_presentacion_nivel.animacion_actual == 2) and (obj_presentacion_nivel.transparencia_barra < 0.7)) {
		    animacion_actual = 2;
		}
		
        break;
    case 2:
        move_towards_point(mitad_ancho_resolucion, mitad_altura_resolucion, 5);
		draw_self();
		
	    if (x <= mitad_ancho_resolucion) {
	        animacion_actual = 3;
		
			if (!alarm[0]) {
				alarm[0] = room_speed;
			}
	    }
	
        break;
	case 3:
		x = mitad_ancho_resolucion;
		y = mitad_altura_resolucion;
		draw_self();
		
		break;
}
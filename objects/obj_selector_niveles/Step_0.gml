if (place_meeting(x, y, obj_jugador)) {
    obj_jugador.angulo = 0;
    
    if (control.boton_mantenido("boton_arriba") and (abs(obj_jugador.velocidad_horizontal) < 3)) {
        if ((nombre_nivel != -1) and !seleccionar_nivel) {
            obj_jugador.x = x;
            obj_jugador.y = y - sprite_height;
            obj_jugador.permitir_movimiento = false;
            obj_jugador.velocidad_horizontal = 0;
            obj_jugador.accion = 0;
			
			if (room_exists(nombre_nivel)) {
				seleccionar_nivel = true;
				nivel.establecer_aparicion_hubworld(nombre_nivel, obj_jugador.x, obj_jugador.y);
			}
        }
    }
	
    if (transparencia_titulo < 1) then transparencia_titulo += 0.2;
} else {
    if (transparencia_titulo > 0) then transparencia_titulo -= 0.2;
}

if (seleccionar_nivel) {
	seleccionar_nivel = false;
	audio.detener_todo();
	
	iniciar_transicion_niveles(nombre_nivel, "negro", 0.05);
	alarm[0] = 40;
}
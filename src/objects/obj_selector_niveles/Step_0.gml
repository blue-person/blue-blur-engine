if (place_meeting(x, y, obj_jugador)) {
    if (controles.boton_mantenido("boton_arriba") and (abs(obj_jugador.velocidad_horizontal) < 3)) {
        if ((nombre_nivel != -1) and !seleccionar_nivel) {
            obj_jugador.permitir_movimiento = false;
            obj_jugador.velocidad_horizontal = 0;
            obj_jugador.accion = 0;
			
			if (room_exists(nombre_nivel)) {
				seleccionar_nivel = true;
				nivel.establecer_aparicion_hubworld(x, y - obj_jugador.mascara_colision, nombre_nivel);
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
	transiciones.iniciar_efecto_intraniveles("morado", 0.05, nombre_nivel);
}
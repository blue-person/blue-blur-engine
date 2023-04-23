var accion_permitida = ((obj_jugador.accion == 11) and obj_jugador.tocando_suelo) or (obj_jugador.accion == 16.5);
if (place_meeting(x, y, obj_jugador) and accion_permitida and (abs(obj_jugador.velocidad_horizontal) >= 4)) {
    if (obj_jugador.accion != 16.5) {
		obj_jugador.indice_sprite = 0;
	}
    obj_jugador.accion = 16.5;
    obj_jugador.tocando_suelo = false;
	
	var pos_jugador = obj_jugador.x - x;
	var angulo_grados = (pos_jugador / 340) * 360;
	var angulo_radianes = degtorad(angulo_grados);
    
    obj_jugador.y = y + 8 + (1 + cos(angulo_radianes)) * (85 * 0.5);
    obj_jugador.indice_sprite = abs((angulo_grados / 360 * 11) % 12);
}
// Variables
cantidad_tablones = 16;
ancho_puente = power(cantidad_tablones, 2);           
ancho_medio_puente = ancho_puente / 2;
maxima_tension_puente = cantidad_tablones;

// Ajustar pesos
for (var i = 0; i < cantidad_tablones; i++) {
	var pos_x = x + i * 16;
	tablones[i] = instance_create_depth(pos_x, y, PROFUNDIDAD_OBJETOS, obj_tablon_puente);
	pesos_tablones[i] = 0;
}
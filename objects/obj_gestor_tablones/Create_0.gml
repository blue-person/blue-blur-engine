cantidad_tablones = 16;
ancho_puente = cantidad_tablones * 16;           
ancho_medio_puente = ancho_puente / 2;
maxima_tension_puente = 16;
    
for (var n = 0; n < cantidad_tablones; n++) {
	pesos_tablones[n] = 0;
	tablones[n] = instance_create_depth(x + n * 16, y, 0, obj_tablon_puente);
}

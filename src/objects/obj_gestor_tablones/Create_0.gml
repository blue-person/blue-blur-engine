cantidad_tablones = 16;
ancho_puente = cantidad_tablones * 16;           
ancho_medio_puente = ancho_puente / 2;
maxima_tension_puente = 16;
    
for (var i = 0; i < cantidad_tablones; i++) {
	pesos_tablones[i] = 0;
	tablones[i] = instance_create_depth(x + i * 16, y, 0, obj_tablon_puente);
}

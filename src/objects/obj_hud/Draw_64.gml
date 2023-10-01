// Tiempo
if (parametros_tiempo.mostrar_en_pantalla) {
    var cantidad_tiempo = cronometro.obtener_tiempo("textos");
	self.dibujar_icono(parametros_tiempo);
	self.dibujar_informacion(parametros_tiempo, cantidad_tiempo);
}

// Rings
if (parametros_rings.mostrar_en_pantalla) {
    var cantidad_rings = numero_a_texto(jugador.rings, 3);
	self.dibujar_icono(parametros_rings);
	self.dibujar_informacion(parametros_rings, cantidad_rings);
}

// Vidas
if (parametros_vidas.mostrar_en_pantalla) {
    var cantidad_vidas = numero_a_texto(global.vidas_restantes, 2);
	self.dibujar_icono(parametros_vidas);
	self.dibujar_informacion(parametros_vidas, cantidad_vidas);
}

// Boost
if (parametros_boost.mostrar_en_pantalla) {
    var cantidad_boost = jugador.cantidad_boost * 1.4;
	self.dibujar_icono(parametros_boost);
	self.dibujar_barra(parametros_boost.barras.superior, cantidad_boost, parametros_boost.barras.colores);
	self.dibujar_barra(parametros_boost.barras.inferior, cantidad_boost, parametros_boost.barras.colores);
}
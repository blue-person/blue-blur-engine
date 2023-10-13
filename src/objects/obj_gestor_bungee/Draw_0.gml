if (activar_evento) {
	// Variables
    var pos_x_inicial = jugador.x + jugador.direccion_horizontal * 5;
    var pos_y_inicial = jugador.y;
	var distancia = point_distance(x, y, pos_x_inicial, pos_y_inicial) - 16;
	var direccion = point_direction(x, y, pos_x_inicial, pos_y_inicial);
    
	// Dibujar el resorte normal
    draw_sprite(spr_resorte_bungee, 0, x, y);
	
	// Dibujar el resorte estirado
	for (var n = 0; n < (distancia / 16); ++n) {
		var valor_auxiliar = n * 16;
		var pos_x_final = x + lengthdir_x(valor_auxiliar, direccion);
		var pos_y_final = y + lengthdir_y(valor_auxiliar, direccion);
		draw_sprite(spr_resorte_bungee, 0, x, y);
		draw_sprite(spr_resorte_bungee, 0, pos_x_inicial, pos_y_inicial)
		draw_sprite(spr_resorte_bungee, 0, pos_x_final, pos_y_final);
	}
} else {
	// Dibujar el resorte normal
	draw_sprite(spr_resorte_bungee, 0, x, y);
}
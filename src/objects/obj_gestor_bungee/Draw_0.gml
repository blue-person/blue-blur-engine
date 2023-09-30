if (activar_evento) {
	draw_sprite(spr_resorte_bungee, 0, x, y);
} else {
    var x_inicial = obj_jugador.x + obj_jugador.direccion_horizontal * 5;
    var y_inicial = obj_jugador.y;
	var distancia = point_distance(x, y, x_inicial, y_inicial) - 16;
	var direccion = point_direction(x, y, x_inicial, y_inicial);
    
    draw_sprite(spr_resorte_bungee, 0, x, y);

	for (var n = 0; n < (distancia / 16); n++) {
		draw_sprite(spr_resorte_bungee, 0, x + lengthdir_x(n * 16, direccion), y + lengthdir_y(n * 16, direccion));
		draw_sprite(spr_resorte_bungee, 0, self.x, self.y);
		draw_sprite(spr_resorte_bungee, 0, x_inicial, y_inicial)
	}
}
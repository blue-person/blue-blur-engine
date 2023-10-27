// Heredar datos del objeto padre
event_inherited();

// Ajustar angulo en base al primer Jump Panel
if (permitir_uso and not angulo_ajustado) {
	for (var i = 0; i < instance_number(obj_jump_panel); ++i) {
		var jump_panel = instance_find(obj_jump_panel, i);
		 if (jump_panel.indice == 0) {
			 image_angle = point_direction(x, y, jump_panel.x, jump_panel.y);
			 angulo_ajustado = true;
			 break;
		 }
	}
}
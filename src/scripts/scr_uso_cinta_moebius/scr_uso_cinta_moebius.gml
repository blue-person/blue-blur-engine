function gestion_uso_cinta_moebius() {
	// Variables
	var velocidad_insuficiente = abs(velocidad_horizontal) <= 4;

	// Gestionar los parametros al pasar por una cinta de Moebius
	if ((accion == 16) or (accion == 17)) {
		// Ajustar variables
        velocidad_vertical = 0;
        angulo = 0;
		
		// Ajustar accion en base a condiciones
		var sin_colisionar = not place_meeting(x, y, obj_cinta_moebius);
        if (tocando_suelo or velocidad_insuficiente or sin_colisionar) {
            accion = (accion == 16) ? 0 : 2;
            image_index = 0;
        }
		
		// Salir del evento
		exit;
	} else if (accion == 16.5) {
		// Ajustar variables
        velocidad_vertical = 0;
        angulo = 0;
		
		// Ajustar variables en base a condiciones
		var sin_colisionar = not place_meeting(x, y, obj_riel_cinta_moebius);
        if (tocando_suelo or velocidad_insuficiente or sin_colisionar) {
            accion = 11;
            image_index = 0;
        }
		
		// Salir del evento
		exit;
	}
}
function gestion_uso_cinta_moebius() {
	// Manejar el movimiento al pasar por una cinta de Moebius. Sin embargo, el manejo principal del movimiento se hace en obj_cinta_moebius.
    if (accion == 16) {
		var velocidad_insuficiente = (abs(obj_jugador.velocidad_horizontal) <= 4);
		var sin_colisionar = !place_meeting(x, y, obj_cinta_moebius);
		
        velocidad_vertical = 0;
        angulo = 0;

        if (tocando_suelo or velocidad_insuficiente or sin_colisionar) {
            accion = 0;
            image_index = 0;
        }
    }

    if (accion == 16.5) {
		var velocidad_insuficiente = (abs(obj_jugador.velocidad_horizontal) <= 4);
		var sin_colisionar = !place_meeting(x, y, obj_riel_cinta_moebius);
		
        velocidad_vertical = 0;
        angulo = 0;

        if (tocando_suelo or velocidad_insuficiente or sin_colisionar) {
            accion = 11;
            image_index = 0;
        }
    }

    // Pasar por el corkscrew mientras se esta rodando
    if (accion == 17) {
		var velocidad_insuficiente = (abs(obj_jugador.velocidad_horizontal) <= 4);
		var sin_colisionar = !place_meeting(x, y, obj_cinta_moebius);
		
        velocidad_vertical = 0;
        angulo = 0;

        if (tocando_suelo or velocidad_insuficiente or sin_colisionar) {
            accion = 2;
            image_index = 0;
        }
    }
}
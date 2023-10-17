function gestion_uso_cinta_moebius() {
	// Variables
	var velocidad_insuficiente = abs(velocidad_horizontal) <= 4;
	var sin_colisionar = not place_meeting(x, y, obj_cinta_moebius);
	
	// Gestionar los parametros al pasar por una cinta de Moebius
    if (accion == 16) {
		// Ajustar parametros
        velocidad_vertical = 0;
        angulo = 0;
		
		// Ajustar parametros en base a condiciones
        if (tocando_suelo or velocidad_insuficiente or sin_colisionar) {
            accion = 0;
            image_index = 0;
        }
		
		// Salir del evento
		exit;
    } else if (accion == 16.5) {
		// Ajustar parametros
        velocidad_vertical = 0;
        angulo = 0;
		
		// Ajustar parametros en base a condiciones
		sin_colisionar = not place_meeting(x, y, obj_riel_cinta_moebius);
        if (tocando_suelo or velocidad_insuficiente or sin_colisionar) {
            accion = 11;
            image_index = 0;
        }
		
		// Salir del evento
		exit;
    } else if (accion == 17) {
		// Ajustar parametros
        velocidad_vertical = 0;
        angulo = 0;
		
		// Ajustar parametros en base a condiciones
        if (tocando_suelo or velocidad_insuficiente or sin_colisionar) {
            accion = 2;
            image_index = 0;
        }
		
		// Salir del evento
		exit;
    }
}
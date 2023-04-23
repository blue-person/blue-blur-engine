// Verificar colision
var x_inicial = x - sprite_width / 2 - mascara_colision;
var y_inicial = y - sprite_height / 2;
var x_secundaria = x + sprite_width / 2 + mascara_colision;
var y_secundaria = y + sprite_height / 2;
var verificar_colision = collision_rectangle(x_inicial, y_inicial, x_secundaria, y_secundaria, obj_jugador, true, true);

// Verificar velocidad
var velocidad_suficiente = abs(obj_jugador.velocidad_horizontal) > velocidad_requerida;

// Destruir objeto
if (verificar_colision and (velocidad_suficiente or (obj_jugador.accion == 2))) {
	instance_destroy();
}
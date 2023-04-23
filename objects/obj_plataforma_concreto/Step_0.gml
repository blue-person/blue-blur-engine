// Verificar colision
var x_inicial = x - sprite_width / 4;
var y_inicial = y - sprite_height / 2 - mascara_colision;
var x_secundaria = x + sprite_width / 4;
var y_secundaria = y + sprite_height / 4;
var verificar_colision = collision_rectangle(x_inicial, y_inicial, x_secundaria, y_secundaria, obj_jugador, true, true);

// Destruir objeto
if (verificar_colision and (obj_jugador.accion == 18)) {
	instance_destroy();
}
x = obj_jugador.x;
y = obj_jugador.y - 10;
sprite_index = obj_jugador.sprite_efecto_pisoton;

if (obj_jugador.accion != 18) {
	instance_destroy();
}

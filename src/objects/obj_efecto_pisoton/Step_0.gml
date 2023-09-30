x = obj_jugador.x;
y = obj_jugador.y - 10;

switch (global.personaje_actual) {
    case "Sonic":
        sprite_index = obj_efecto_pisoton_sonic;
        break;
    case "Shadow":
        sprite_index = obj_efecto_pisoton_shadow;
        break;
}

if (obj_jugador.accion != 18) {
	instance_destroy();
}

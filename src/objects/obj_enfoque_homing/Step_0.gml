if (radio > 15) {
	radio -= 6;
} else {
    activar_efecto = true;
}

if ((obj_jugador.accion == 21) or (obj_jugador.accion == 24) or (obj_jugador.accion == 25)) {
    instance_destroy();
}

var objeto_cercano = instance_nearest(x, y, obj_apuntable);
x = objeto_cercano.x;
y = objeto_cercano.y;

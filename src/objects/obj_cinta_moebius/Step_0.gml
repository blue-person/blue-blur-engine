var jugador_colision = place_meeting(x, y, obj_jugador);
var requisitos_corriendo = ((obj_jugador.accion == 0) and obj_jugador.tocando_suelo) or (obj_jugador.accion == 16);
var requisitos_rodando = ((obj_jugador.accion == 2) and obj_jugador.tocando_suelo) or (obj_jugador.accion == 17);
var velocidad_requerida = (abs(obj_jugador.velocidad_horizontal) >= 4);

if (jugador_colision and requisitos_corriendo and velocidad_requerida) {
    if (obj_jugador.accion != 16) {
        obj_jugador.image_index = 0;
	    obj_jugador.accion = 16;
    }
    obj_jugador.accion = 16;
    obj_jugador.tocando_suelo = false;

    var pos_x_relativa = obj_jugador.x - self.x;
    var angulo_grados = (pos_x_relativa / 288) * 360;
    var angulo_radianes = degtorad(angulo_grados);

    var pos_y_jugador = self.y + 8 + (1 + cos(angulo_radianes)) * (65 * 0.5);
    var indice_img_jugador = abs((angulo_grados / 360 * 11) % 12);

    obj_jugador.y = floor(pos_y_jugador);
    obj_jugador.image_index = round(indice_img_jugador);
} else if (jugador_colision and requisitos_rodando and velocidad_requerida) {
    obj_jugador.accion = 17;
    obj_jugador.tocando_suelo = false;

    var pos_x_relativa = obj_jugador.x - self.x;
    var angulo_grados = (pos_x_relativa / 288) * 360;
    var angulo_radianes = degtorad(angulo_grados);

    var pos_y_jugador = self.y + 8 + (1 + cos(angulo_radianes)) * (65 * 0.5);

    obj_jugador.y = floor(pos_y_jugador);
}
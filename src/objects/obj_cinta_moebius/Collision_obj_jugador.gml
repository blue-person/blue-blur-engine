// Variables
var requisitos_corriendo = ((other.accion == 0) and other.tocando_suelo) or (other.accion == 16);
var requisitos_rodando = ((other.accion == 2) and other.tocando_suelo) or (other.accion == 17);
var velocidad_requerida = abs(other.velocidad_horizontal) >= 4;

// Gestionar cuando el other esta corriendo
if (requisitos_corriendo and velocidad_requerida) {
    // Variables
    var pos_x = other.x - x;
    var angulo = (pos_x / 288) * 360;
    var indice_img_jugador = abs((angulo / 360 * 11) % 12);
    var pos_y = y + 8 + (1 + dcos(angulo)) * (65 * 0.5);

    // Ajustar variables del jugador
    with (other) {
        accion = 16;
        tocando_suelo = false;
        y = floor(pos_y);
        image_index = round(indice_img_jugador);
    }
} else if (requisitos_rodando and velocidad_requerida) {
    // Variables
    var pos_x = other.x - x;
    var angulo = (pos_x / 288) * 360;
    var pos_y = y + 8 + (1 + dcos(angulo)) * (65 * 0.5);

    // Ajustar variables del jugador
    with (other) {
        accion = 17;
        tocando_suelo = false;
        y = floor(pos_y);
    }
}
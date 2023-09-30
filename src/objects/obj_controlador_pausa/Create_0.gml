// Declarar variables
pausar_juego = false;
nivel_pausado = noone;
opcion_seleccionada = 0;
boton_necesario_presionado = false;

imagen_fondo = noone;
archivo_pantallazo = "escenario_actual.png";

pos_x = pantalla.obtener_ancho() / 2;
pos_y = pantalla.obtener_altura() / 2;

// Establecer estados de los botones
opciones_menu = [{
    sprite: spr_menu_pausa_continuar,
    estado: 0
}, {
    sprite: spr_menu_pausa_reiniciar,
    estado: 0
}, {
    sprite: spr_menu_pausa_salir,
    estado: 0
}];

// Establecer la cantidad de opciones
cantidad_opciones = array_length(opciones_menu);
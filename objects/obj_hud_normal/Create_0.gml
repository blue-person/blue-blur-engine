// Variables
mostrar_en_pantalla = false;
transparencia = 1;
alarm[0] = room_speed;

// Determinar posiciones
pos_x_tiempo = 25;
pos_y_tiempo = 20;

pos_x_rings = 25;
pos_y_rings = 45;

pos_x_vidas = pantalla.obtener_ancho() * 0.80;
pos_y_vidas = 20;

pos_x_boost = 25;
pos_y_boost = pantalla.obtener_altura()  * 0.85;

// Determinar sprites
switch (global.personaje_actual) {
    case "Sonic":
	    hud_vidas = spr_contador_vidas_sonic;
	    font_numerica = fonts.obtener_numeros_azules();
		color_boost_a = COLOR_AZUL_NORMAL;
		color_boost_b = COLOR_AZUL_CLARO;
        break;
    case "Shadow":
	    hud_vidas = spr_contador_vidas_shadow;
	    font_numerica = fonts.obtener_numeros_grises();
		color_boost_a = COLOR_NARANJA_NORMAL;
		color_boost_b = COLOR_NARANJA_CLARO;
        break;
}
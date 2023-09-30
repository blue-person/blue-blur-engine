// Variables
mostrar_en_pantalla = false;
transparencia = 1;
alarm[0] = room_speed / 2;

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
hud_vidas = obj_jugador.sprites_hud.icono_vidas;
font_numerica = obj_jugador.sprites_hud.font_numeros;
color_boost_a = obj_jugador.sprites_hud.colores_barra_boost.superior;
color_boost_b = obj_jugador.sprites_hud.colores_barra_boost.inferior;
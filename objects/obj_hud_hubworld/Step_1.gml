

switch (global.personaje_actual) {
    case "Sonic":
        hud_vidas = spr_contador_vidas_sonic;
		font_numerica = global.font_numerica_azul;
        break;
    case "Shadow":
        hud_vidas = spr_contador_vidas_shadow;
		font_numerica = global.font_numerica_gris;
        break;
}
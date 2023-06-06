

switch (global.personaje_actual) {
    case "Sonic":
        hud_vidas = spr_contador_vidas_sonic;
		font_numerica = fonts.obtener_numeros_azules();
        break;
    case "Shadow":
        hud_vidas = spr_contador_vidas_shadow;
		font_numerica = fonts.obtener_numeros_grises();
        break;
}
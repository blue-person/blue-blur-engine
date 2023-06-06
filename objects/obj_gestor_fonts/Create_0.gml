// Constantes
#macro MAPEO_CARACTERES "abcdefghijklmnopqrstuvwxyz1234567890:."
#macro MAPEO_NUMEROS "1234567890:."

// Variables
texto_azul = font_add_sprite_ext(spr_font_general_azul, MAPEO_CARACTERES, true, 0);
texto_gris = font_add_sprite_ext(spr_font_general_gris, MAPEO_CARACTERES, true, 0);
texto_negro = font_add_sprite_ext(spr_font_general_negro, MAPEO_CARACTERES, true, 0);
texto_dorado = font_add_sprite_ext(spr_font_general_dorado, MAPEO_CARACTERES, true, 0);
numeros_azules = font_add_sprite_ext(spr_font_numerica_azul, MAPEO_NUMEROS, true, 0);
numeros_grises = font_add_sprite_ext(spr_font_numerica_gris, MAPEO_NUMEROS, true, 0);

// Metodos
obtener_texto_azul = function() {
	return texto_azul;
}

obtener_texto_gris = function() {
	return texto_gris;
}

obtener_texto_negro = function() {
	return texto_negro;
}

obtener_texto_dorado = function() {
	return texto_dorado;
}

obtener_numeros_azules = function() {
	return numeros_azules;
}

obtener_numeros_grises = function() {
	return numeros_grises;
}
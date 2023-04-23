function cargar_fonts() {
	var mapeo_caracteres = "abcdefghijklmnopqrstuvwxyz1234567890:.";
	var mapeo_numeros = "1234567890:.";
	
	global.font_texto_azul = font_add_sprite_ext(spr_texto_font_azul, mapeo_caracteres, true, 0);
	global.font_numeros_azul = font_add_sprite_ext(spr_numeros_font_azul, mapeo_numeros, true, 0);
	global.font_texto_gris = font_add_sprite_ext(spr_texto_font_gris, mapeo_caracteres, true, 0);
	global.font_numeros_gris = font_add_sprite_ext(spr_numeros_font_gris, mapeo_numeros, true, 0);
	
	global.font_texto_negro = font_add_sprite_ext(spr_texto_font_negro, mapeo_caracteres, true, 0);
	global.font_texto_dorado = font_add_sprite_ext(spr_texto_font_dorado, mapeo_caracteres, true, 0);
}
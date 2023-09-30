function aumentar_vidas() {
	audio.reproducir_audio_aislado(snd_vida_extra, false);
	global.vidas_restantes++;
}

function herir_jugador() {
	other.image_index = 0;
	other.tocando_suelo = false;
	other.velocidad_vertical = -4;
	other.velocidad_horizontal = -5 * other.direccion_horizontal;
	other.permitir_ser_apuntado = false;
	
	if (other.rings > 0) {
		// Herir al jugador
	    other.accion = 22;
	    other.tiempo_invencibilidad = 240;
		
	    disperar_rings();
		audio.reproducir_audio(other.audio_quejido);
	} else {
		// Matar al jugador
	    other.accion = 26;
	    other.alarma_3 = 120;
		
	    if (instance_exists(obj_hud_normal)) then obj_hud_normal.mostrar_en_pantalla = false;
	    if (instance_exists(obj_controlador_pausa)) then instance_destroy(obj_controlador_pausa);
		
		audio.reproducir_audio(other.audio_muerte);
	}
}

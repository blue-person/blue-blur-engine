// Variables
var aun_esta_subiendo = not place_meeting(x, y, motor_polea);
var jugador_esta_vivo = other.accion != 26;

// Gestionar comportamiento
if (aun_esta_subiendo and jugador_esta_vivo) {
	// Reproducir audios
    if (not activar_evento) {
		activar_evento = true;
        audio.reproducir_audio(snd_agarrar_objeto);
        audio.reproducir_audio(snd_usar_polea);
    }
	
	// Ajustar variables
    other.accion = 27;
	other.permitir_uso_boost = false;
    other.direccion_horizontal = sign(image_xscale);
	
	// Eliminar el enfoque del homing attack
    if (instance_exists(obj_enfoque_homing)) {
        instance_destroy(obj_enfoque_homing);
    }
}
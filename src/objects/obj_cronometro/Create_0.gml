// Variables
permitir_medir_tiempo = false;
tiempo_en_numeros = [0, 0, 0];
tiempo_en_texto = ["", "", ""];
valores_cronometro = "";

// Determinar el tiempo inicial en caso de checkpoint
if (reaparicion.obtener_permiso_reaparicion()) {
	var tiempo_registrado = reaparicion.obtener_tiempo_registrado();
	copiar_lista(tiempo_registrado, tiempo_en_numeros);
}
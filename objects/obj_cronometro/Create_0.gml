// Variables
permitir_medir_tiempo = false;
tiempo_en_numeros = [0, 0, 0];
tiempo_en_texto = ["", "", ""];
valores_cronometro = "";

// Determinar el tiempo inicial en caso de checkpoint
if (nivel.obtener_permiso_reaparicion()) {
	var tiempo_registrado = nivel.obtener_tiempo_checkpoint();
	tiempo_en_numeros = copiar_lista(tiempo_registrado);
}
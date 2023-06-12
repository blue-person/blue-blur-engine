// Aumentar valores de cada variable segun la cantidad de ticks
if (permitir_medir_tiempo) {
	tiempo_en_numeros[2]++;
	
	// Decisegundos
    if (tiempo_en_numeros[2] >= 99) { 
        tiempo_en_numeros[2] = 0;
        tiempo_en_numeros[1]++;
        
        // Segundos
        if (tiempo_en_numeros[1] >= 60) {
            tiempo_en_numeros[1] = 0;
            tiempo_en_numeros[0]++;
            
            // Minutos
            if (tiempo_en_numeros[0] >= 99) {
                tiempo_en_numeros[0] = 0;
            }
        }
    }

	// Pasar los datos a string
	for (var i = 0; i < 3; i++) {
		var valor_actual = tiempo_en_numeros[i];
		if (valor_actual < 10) {
			tiempo_en_texto[i] = "0" + string(valor_actual);
		} else {
			tiempo_en_texto[i] = string(valor_actual);
		}
	}

	// Concatenar los datos
	valores_cronometro = tiempo_en_texto[0] + ":" + tiempo_en_texto[1] + "." + tiempo_en_texto[2];
}
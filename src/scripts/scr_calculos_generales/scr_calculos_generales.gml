function redondear_valor(valor) {
	if (sign(valor) < 0) {
		if (frac(valor) == 0) then return ceil(valor);
	} else {
		if (frac(valor) == 1) then return ceil(valor);
	}
	return floor(valor);
}

function rodear_angulo(angulo) {
	while (angulo < 0) {
		angulo += 360;
	}
	while (angulo > 359) {
		angulo -= 360;
	}
	return angulo;
}

function division_segura(valor_a, valor_b) {
	if (valor_b == 0.0) {
		return 0.0
	} else {
		return (valor_a / valor_b);
	}
}

function calcular_fotograma(valor_calculo, valor_comparacion) {
	var valor_maximo = max(valor_calculo - abs(self.velocidad_horizontal), valor_comparacion);
	return (1 / valor_maximo);
}

function calcular_interpolacion_lineal(punto_a, punto_b, incremento) {
	return punto_a + (punto_b - punto_a) * incremento;
}
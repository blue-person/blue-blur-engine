if (limite_tiempo > 0) then --limite_tiempo;
if (!evento_finalizado and (transparencia_boton < 1)) then transparencia_boton += 0.125;

if ((limite_tiempo <= limite_inicial_circulo_a) and (limite_tiempo >= limite_final_circulo_a) and (limite_tiempo != 0)) {
	if (boton_aleatorio.estado_pulsado) then evento_finalizado = true;

    if (evento_finalizado) {
        tiempo_restante = limite_tiempo;
        limite_tiempo = 0;
    }
} else if (((limite_tiempo > 40) or (limite_tiempo < 30)) and (limite_tiempo != 0)) {
	if (boton_aleatorio.estado_pulsado) then limite_tiempo = 1;
} else {
    instance_destroy();
}
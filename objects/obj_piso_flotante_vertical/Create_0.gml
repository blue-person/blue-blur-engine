// Establecer las alarmas para determinar cuando realizar el cambio de movimiento
alarma_movimiento = 100;
valor_alarma_actual = alarma_movimiento;

// Establecer las alarmas para el movimiento
mover_hacia_abajo = true;
velocidad_movimiento = 3;

// Establecer las capas para permitir que el jugador
// no colisione con la plataforma mientras salta hacia ella
capa_frontal = instance_create_depth(x, y + 20, 0, obj_capa_frontal);
capa_posterior = instance_create_depth(x, y - 20, 0, obj_capa_posterior);

with (capa_frontal) {
    image_xscale = 1 + self.image_xscale * 0.75;
    image_yscale = 0.5;
}

with (capa_posterior) {
    image_xscale = 1 + self.image_xscale * 0.5;
    image_yscale = 0.125;
}
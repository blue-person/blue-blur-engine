valor_a += 0.15;
valor_b += 0.125;
valor_c += 0.1;
valor_d += 0.25;
valor_e += 0.2;
valor_f += 0.25;
valor_g += 0.5;
valor_h += 0.55;

// Monte A
layer_x(imagenes_fondo[0], (pos_x + valor_a) * 0.99);
layer_y(imagenes_fondo[0], pos_y - 15);

// Monte B
layer_x(imagenes_fondo[1], (pos_x + valor_b) * 0.95);
layer_y(imagenes_fondo[1], pos_y + 260);

// Nubes A
layer_x(imagenes_fondo[2], (pos_x + valor_c) * 0.94);
layer_y(imagenes_fondo[2], pos_y + 292);

// Monte C
layer_x(imagenes_fondo[3], (pos_x + valor_d) * 0.92);
layer_y(imagenes_fondo[3], pos_y + 187);

// Nubes B
layer_x(imagenes_fondo[4], (pos_x + valor_e) * 0.9);
layer_y(imagenes_fondo[4], pos_y + 308);

// Nubes C
layer_x(imagenes_fondo[5], (pos_x + valor_f) * 0.88);
layer_y(imagenes_fondo[5], pos_y + 332);

// Nubes D
layer_x(imagenes_fondo[6], (pos_x + valor_g) * 0.86);
layer_y(imagenes_fondo[6], pos_y + 348);

// Nubes E
layer_x(imagenes_fondo[7], (pos_x + valor_h) * 0.85);
layer_y(imagenes_fondo[7], pos_y + 364);
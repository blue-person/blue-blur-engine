var camara_x = obj_camara.obtener_pos_x();
var camara_y = obj_camara.obtener_pos_y();

switch (nivel_actual) {
	case rm_emerald_valley:
		// Oceano
		estructura_fondos[1].velocidad_desplazamiento += 0.44;
		estructura_fondos[2].velocidad_desplazamiento += 0.53;
		estructura_fondos[3].velocidad_desplazamiento += 0.57;
		estructura_fondos[4].velocidad_desplazamiento += 0.59;
		
		// Decoracion
		estructura_fondos[9].velocidad_desplazamiento += 0.35;
		estructura_fondos[10].velocidad_desplazamiento += 0.5;
		
		// Nubes
		estructura_fondos[5].velocidad_desplazamiento += 0.35;
		estructura_fondos[6].velocidad_desplazamiento += 0.5;
		estructura_fondos[7].velocidad_desplazamiento += 0.5;
		estructura_fondos[8].velocidad_desplazamiento += 0.5;
		
		// Cielo
		layer_x(estructura_fondos[0].capa, camara_x);
		layer_y(estructura_fondos[0].capa, camara_y - 152);
		
		// Oceano A
		layer_x(estructura_fondos[1].capa, (camara_x / 1.5 + estructura_fondos[1].velocidad_desplazamiento) * 0.85);
		layer_y(estructura_fondos[1].capa, camara_y);
		
		// Oceano B
		layer_x(estructura_fondos[2].capa, (camara_x / 1.5 + estructura_fondos[2].velocidad_desplazamiento) * 0.85);
		layer_y(estructura_fondos[2].capa, camara_y);
		
		// Oceano C
		layer_x(estructura_fondos[3].capa, (camara_x / 1.5 + estructura_fondos[3].velocidad_desplazamiento) * 0.85);
		layer_y(estructura_fondos[3].capa, camara_y);
		
		// Oceano D
		layer_x(estructura_fondos[4].capa, (camara_x / 1.5 + estructura_fondos[4].velocidad_desplazamiento) * 0.85);
		layer_y(estructura_fondos[4].capa, camara_y + 13);
		
		// Nubes A
		layer_x(estructura_fondos[5].capa, (camara_x / 1.5 + estructura_fondos[5].velocidad_desplazamiento) * 0.85);
		layer_y(estructura_fondos[5].capa, camara_y - 22);
		
		// Nubes B
		layer_x(estructura_fondos[6].capa, (camara_x / 1.25 + estructura_fondos[6].velocidad_desplazamiento) * 0.85);
		layer_y(estructura_fondos[6].capa, camara_y - 100);	
		
		// Nubes C
		layer_x(estructura_fondos[7].capa, (camara_x / 1.5 + estructura_fondos[7].velocidad_desplazamiento) * 0.85);
		layer_y(estructura_fondos[7].capa, camara_y - 85);
		
		// Nubes D
		layer_x(estructura_fondos[8].capa, (camara_x / 1.5 + estructura_fondos[8].velocidad_desplazamiento) * 0.85);
		layer_y(estructura_fondos[8].capa, camara_y - 60);
		
		// Montes
		layer_x(estructura_fondos[9].capa, (camara_x / 1.5 + estructura_fondos[9].velocidad_desplazamiento) * 0.85);
		layer_y(estructura_fondos[9].capa, camara_y - 38);
		
		// Piedras
		layer_x(estructura_fondos[10].capa, (camara_x / 1.5 + estructura_fondos[10].velocidad_desplazamiento) * 0.85);
		layer_y(estructura_fondos[10].capa, camara_y + 10);	
		break;
	case rm_groovy_badlands:
		var pos_x = camara_x / 2;
		var pos_y = camara_y - 304;
		
		estructura_fondos[2].velocidad_desplazamiento += 0.1;
		estructura_fondos[4].velocidad_desplazamiento += 0.2;
		estructura_fondos[5].velocidad_desplazamiento += 0.25;
		estructura_fondos[6].velocidad_desplazamiento += 0.5;
		estructura_fondos[7].velocidad_desplazamiento += 0.55;
		estructura_fondos[8].velocidad_desplazamiento += 0.65;
		
		// Monte A
		layer_x(estructura_fondos[0].capa, pos_x * 0.99);
		layer_y(estructura_fondos[0].capa, pos_y - 15);
		
		// Monte B
		layer_x(estructura_fondos[1].capa, pos_x * 0.95);
		layer_y(estructura_fondos[1].capa, pos_y + 260);
		
		// Nubes A
		layer_x(estructura_fondos[2].capa, (pos_x + estructura_fondos[2].velocidad_desplazamiento) * 0.94);
		layer_y(estructura_fondos[2].capa, pos_y + 292);
		
		// Monte C
		layer_x(estructura_fondos[3].capa, pos_x * 0.92);
		layer_y(estructura_fondos[3].capa, pos_y + 187);
		
		// Nubes B
		layer_x(estructura_fondos[4].capa, (pos_x + estructura_fondos[4].velocidad_desplazamiento) * 0.9);
		layer_y(estructura_fondos[4].capa, pos_y + 308);
		
		// Nubes C
		layer_x(estructura_fondos[5].capa, (pos_x + estructura_fondos[5].velocidad_desplazamiento) * 0.88);
		layer_y(estructura_fondos[5].capa, pos_y + 332);
		
		// Nubes D
		layer_x(estructura_fondos[6].capa, (pos_x + estructura_fondos[6].velocidad_desplazamiento) * 0.86);
		layer_y(estructura_fondos[6].capa, pos_y + 348);
		
		// Nubes E
		layer_x(estructura_fondos[7].capa, (pos_x + estructura_fondos[7].velocidad_desplazamiento) * 0.85);
		layer_y(estructura_fondos[7].capa, pos_y + 364);
		
		// Nubes F
		layer_x(estructura_fondos[8].capa, (pos_x + estructura_fondos[8].velocidad_desplazamiento) * 0.85);
		layer_y(estructura_fondos[8].capa, pos_y + 385);
        break;
		
	case rm_mining_mayhem:
		estructura_fondos[0].velocidad_desplazamiento += 0.5;
		
		// Nubes
		layer_x(estructura_fondos[0].capa, (camara_x / 1.5 + estructura_fondos[0].velocidad_desplazamiento) * 0.85);
		layer_y(estructura_fondos[0].capa, camara_y - 250);	
		
		// Arboles
		layer_x(estructura_fondos[1].capa, camara_x / 2);
		layer_y(estructura_fondos[1].capa, camara_y - 10);	
		
		// Montes
		layer_x(estructura_fondos[2].capa, camara_x / 1.25);
		layer_y(estructura_fondos[2].capa, camara_y - 80);
		
		// Escenario
		layer_x(estructura_fondos[3].capa, camara_x / 1.0225);
		layer_y(estructura_fondos[3].capa, camara_y - 181);
		break;
}
function verificar_colision_aterrizaje(superficie_normal, superficie_posterior, superficie_frontal) {
	// Determinar colision con superficie
	var colision_normal = colision_lineal_simple(superficie_normal);
	if (colision_normal) then return true;

	// Determinar colisiones con superficies, ya sea capa frontal o capa posterior
	if (self.capa_actual == "frontal") {
        var colision_capa_frontal = colision_lineal_simple(superficie_frontal);
		if (colision_capa_frontal) then return true;
    } else {
        var colision_capa_posterior = colision_lineal_simple(superficie_posterior);
		if (colision_capa_posterior) then return true;
    }
	
	// Retornar comprobacion
	return false;
}

function verificar_colision_tipo_suelo(superficie_normal, superficie_posterior, superficie_frontal, entidad = self) {
	// Determinar colisiones
	var colision_normal = colision_lineal_simple(superficie_normal);
	var colision_capa_posterior = colision_lineal_simple(superficie_posterior) and (entidad.capa_actual == "posterior");
	var colision_capa_frontal = colision_lineal_simple(superficie_frontal) and (entidad.capa_actual == "frontal");
	var colisionando_suelo = (colision_normal or colision_capa_posterior or colision_capa_frontal);
	
	// Determinar si la entidad puede caminar sobre obj_superficie_agua
	if (colisionando_suelo) then entidad.caminar_sobre_agua = false;
	
	// Retornar comprobacion
	return colisionando_suelo;
}
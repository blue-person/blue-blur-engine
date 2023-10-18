function determinar_botones_qte() {
	if (controles.obtener_tipo_controles() == "teclado") {
		return ["boton_izquierda", "boton_abajo", "boton_arriba", "boton_derecha"];
	} else {
		return ["boton_salto", "boton_boost", "boton_ataque", "boton_especial"];
	}
}

function iniciar_qte_dashramp(tiempo_reaccion = 60) {

}
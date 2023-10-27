if (permitir_uso) {
	// Tener el funcionamiento normal
	self.ajustar_comportamiento_jugador(other);
} else {
	// Tener el funcionamineto de un trampolin
	event_inherited();
}
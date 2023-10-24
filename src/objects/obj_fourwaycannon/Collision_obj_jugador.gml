// Variables
var usando_botones = controles.boton_mantenido("boton_arriba") or controles.boton_mantenido("boton_abajo") or controles.boton_mantenido("boton_derecha") or controles.boton_mantenido("boton_izquierda");

// Gestionar la direccion de apuntado
if (usando_botones and (other.accion == 21)) {
	// Limitar el indice de la imagen
    indice_imagen = clamp(indice_imagen + 1, 0, 6);
} else {
	// Limitar el indice de la imagen
    indice_imagen = clamp(indice_imagen - 1, 0, 6);
	
	// Anular el angulo
    if (indice_imagen == 0) then angulo_imagen = 0;
}
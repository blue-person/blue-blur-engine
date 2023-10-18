// Ajustar parametros
image_alpha -= 0.1;
image_xscale += 0.15;
image_yscale += 0.15;

// Eliminar el efecto si no es visible
if (image_alpha <= 0) {
	instance_destroy();
}
// Ajustar valores
image_alpha -= 0.025;
image_xscale += 0.25;
image_yscale += 0.25;

// Destruir el objeto una vez no sea visible
if (image_alpha <= 0) {
	instance_destroy();
}
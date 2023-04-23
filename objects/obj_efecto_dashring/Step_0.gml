image_alpha -= 0.1;
image_xscale += 0.15;
image_yscale += 0.15;

if (image_alpha <= 0) {
	instance_destroy();
}
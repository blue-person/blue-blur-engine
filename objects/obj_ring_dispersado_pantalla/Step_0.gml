image_alpha -= 0.025;
image_xscale += 0.25;
image_yscale += 0.25;

if (image_alpha <= 0) {
	instance_destroy();
}
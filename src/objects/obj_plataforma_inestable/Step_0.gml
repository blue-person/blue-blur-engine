var posicion = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) * 2;
vspeed += 0.4;

if (y > posicion) {
    instance_destroy();
}

// Crear el menu de pausa en caso de no existir
if (not instance_exists(obj_menu_pausa)) {
	instance_create_depth(0, 0, 0, obj_menu_pausa);
}
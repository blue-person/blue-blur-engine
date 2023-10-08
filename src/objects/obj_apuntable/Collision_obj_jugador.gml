// Ajustar la velocidad del objeto
vspeed = 0;
hspeed = 0;

// Eliminar el efecto una vez se colisione
if (instance_exists(obj_enfoque_homing)) {
	instance_destroy(obj_enfoque_homing);
}
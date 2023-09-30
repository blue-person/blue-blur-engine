desvanecimiento = false;
alarm[0] = 40;
alarm[1] = 30;
alarm[2] = 90;
vspeed = -2;
depth = -50;

if (instance_exists(obj_itembox_queue)) {
	ds_queue_enqueue(global.queue, self.sprite_index);
}

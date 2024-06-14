if speed > 2 speed = 2;
if y > yview+320+sprite_yoffset
	{
	if instance_number(object_index) == 1 global.medalvalue = 1;
	instance_destroy();
	}
if !hook
	{
	if global.jleft
		{
		if choice > 0 choice -= 1;
		hook = true;
		}
	if global.jright
		{
		if choice < arrlen-1 choice += 1;
		hook = true;
		}
	if global.button1
		{
		var ship = scr_shipobj(obj_shipselect.selection);
		object_set_sprite(ship,ship_img[choice]);
		instance_destroy();
		}
	if global.button2 instance_destroy();
	}

if !global.jleft
&& !global.jright
&& !global.button1
&& !global.button2
then hook = false;
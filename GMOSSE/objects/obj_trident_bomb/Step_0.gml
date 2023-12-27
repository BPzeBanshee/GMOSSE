if instance_exists(parent)
    {
    x = parent.x;
    y = parent.y - 8;
	
	tip_img += 0.5;
	if tip_img >= 5 then tip_img = 0;
	
    timer += 1;
    if timer == 5
		{
		laser = instance_create_layer(x,y-8,layer,obj_trident_laser);
		parent.slow_speed();
		}
	if instance_exists(laser)
		{
		laser.x = x - 1;
		laser.y = y - 8;
		
		if timer == 120 then laser.mode = 1;
	    if timer > 120 && laser.image_xscale == 0 
		then instance_destroy();
		}
    } 
else instance_destroy();
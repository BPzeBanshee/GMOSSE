if instance_exists(parent_id)
    {
    x = parent_id.x;
    y = parent_id.y - 8;
	
	tip_img += 0.5;
	if tip_img >= 5 tip_img = 0;
	
    timer += 1;
    if timer == 5
		{
		laser = scr_player_shot(x,y-8,obj_trident_laser,0,0);
		parent_id.slow_speed();
		}
	if instance_exists(laser)
		{
		laser.x = x - 1;
		laser.y = y - 8;
		
		if timer == 120 laser.mode = 1;
	    if timer > 120 && laser.image_xscale == 0 
		instance_destroy();
		}
    } 
else instance_destroy();
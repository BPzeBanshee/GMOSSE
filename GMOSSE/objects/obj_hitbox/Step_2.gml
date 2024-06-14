if instance_exists(myplayer)
    {
	// This just makes the object follow a specific spot on the player ship
	// object. It will be exactly on the direct center of the
	// object (adding to y makes it futher down in the room, etc).
    visible = global.hitbox_visible;
    x = myplayer.x;
    y = myplayer.y;
    
	// handles invincibility time and sprite flashing effects while invincible
	if invincible == 0 
	    {
	    myplayer.image_alpha = 1;
	    }
	if invincible != 0 
	    {
	    if invincible > 0 invincible -= 1;
	    if instance_exists(myplayer)
	        {
	        if (myplayer.image_alpha < 0.1 && !clear)
	        or (myplayer.image_alpha > 0.9 && clear) 
				{
				clear = !clear;
				}
		
	        if clear 
			myplayer.image_alpha += 0.1
			else myplayer.image_alpha -= 0.1;
	        }
	    }
	}
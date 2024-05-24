// This just makes the object follow a specific spot on the player ship
// object. It will be exactly on the direct center of the
// object (adding to y makes it futher down in the room, etc).

if instance_exists(myplayer)
    {
    visible = global.hitbox_visible;
    x = myplayer.x;
    y = myplayer.y;
    }
else
    {
    visible = false;
    x = myctrl.x;
    y = myctrl.y;
    }

// handles invincibility time and sprite flashing effects while invincible
if invincible == 0 
    {
    myplayer.image_alpha = 1;
    }
if invincible != 0 
    {
    if invincible > 0 then invincible -= 1;
    if instance_exists(myplayer)
        {
        if (myplayer.image_alpha < 0.1 && !clear)
        or (myplayer.image_alpha > 0.9 && clear) 
		then clear = !clear;
		
        if clear 
		then myplayer.image_alpha += 0.1
		else myplayer.image_alpha -= 0.1;
        }
    }
     
if myctrl.mylives == 0 then invincible = -999;
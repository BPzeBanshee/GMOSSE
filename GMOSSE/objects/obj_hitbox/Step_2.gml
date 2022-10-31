// This just makes the object follow a specific spot on the player ship
// object. It will be exactly on the direct center of the
// object (adding to y makes it futher down in the room, etc).

if instance_exists(obj_player)
    {
    visible = global.hitbox_visible;
    x = obj_player.x;
    y = obj_player.y;
    }
else
    {
    visible = false;
    x = obj_ctrl_game.x;
    y = obj_ctrl_game.y;
    }

// handles invincibility time and sprite flashing effects while invincible
if invincible == 0 
    {
    obj_player.image_alpha = 1;
    }
if invincible != 0 
    {
    if invincible > 0 then invincible -= 1;
    if instance_exists(obj_player)
        {
        if (obj_player.image_alpha < 0.1 && !clear)
        or (obj_player.image_alpha > 0.9 && clear) 
		then clear = !clear;
		
        if clear 
		then obj_player.image_alpha += 0.1
		else obj_player.image_alpha -= 0.1;
        }
    }
     
if lives == 0 then invincible = -999;
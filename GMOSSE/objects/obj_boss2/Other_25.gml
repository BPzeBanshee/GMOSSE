// only happens if all 4 orbs are destroyed
if pods_killed == 4
    {
	// ternary operator: use obj_ctrl_game.chain if object exists, otherwise zero
	var c = instance_exists(obj_ctrl_game) ? obj_ctrl_game.chain : 0;
    if c >= 4 && yview < 2 
    then global.omake_enabled = true;
    var dead = instance_create_layer(x,y,layer,obj_boss2_dead);
    dead.image_angle = image_angle;
    instance_destroy();
    }
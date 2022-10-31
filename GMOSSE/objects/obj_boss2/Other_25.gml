// only happens if all 4 orbs are destroyed
if pods_killed == 4
    {
    if global.chain >= 4 && yview < 2 
    then global.omake_enabled = true;
    var dead = instance_create_layer(x,y,layer,obj_boss2_dead);
    dead.image_angle = image_angle;
    instance_destroy();
    }
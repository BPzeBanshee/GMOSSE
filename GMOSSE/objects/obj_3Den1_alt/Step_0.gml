scr_3D();
image_angle += z_speed;

// after z=400, fall again  
if rising then z += z_speed else z -= z_speed;
if z >= 400 then rising = false;

// on land, go back to enemy and die
if z < 129 && !rising 
    {
    z = 128;
    var child = instance_create_layer(x,y,layer,obj_3Den1);
    child.enemyHP = enemyHP;
    child.enemyHP_max = enemyHP_max;
    child.jump_count = jump_count;
    instance_destroy();
    }
    
if y > yview+320+(sprite_height*image_yscale) then instance_destroy();
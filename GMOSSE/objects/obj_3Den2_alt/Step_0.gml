scr_3D();
image_angle += 8;
if y >= yview + 320+(sprite_height*image_yscale) instance_destroy();
switch mode
    {
    case 1: // dropping below player field
        {
        z -= z_speed;
        if z < 33 
            {
            if x < 160 {hspeed = 0.8;} // hspeed was 0.6
            if x > 160 {hspeed = -0.8;}
            if x == 160 {hspeed = 0;}
            vspeed = 0.25;
            mode = 2;
            }
        break;
        }
    case 2: // moving below player field, then begin rise
        {
        timer += 1;
        if timer == 120
            {
            if distance_to_object(obj_3Den2_alt) < 35
                {
                if x < 160 hspeed = -0.8;
                if x > 160 hspeed = 0.8;
                }
            mode = 3;
            }
        break;
        }
    case 3: // rising up till on player level then change
        {
        z += z_speed;
        if z >= 128 
            {
            hspeed = 0;
            vspeed = 0;
            phase += 1;
            var child = instance_create_layer(x,y,layer,obj_3Den2);
            child.image_angle = image_angle;
            child.enemyHP = enemyHP;
            child.enemyHP_max = enemyHP_max;
            child.z_speed = z_speed;
            child.phase = phase;
            instance_destroy();
            }
        break;
        }
    }
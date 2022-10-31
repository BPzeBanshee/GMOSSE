if instance_exists(obj_player)
    {
    switch position
        {
        case 1:
            {
            x = obj_player.x - 25;
            y = obj_player.y;
            
            if instance_exists(obj_en_parent)
                {
				var target;
                if program == 1
                    {
                    if instance_exists(obj_bh_lockon)
                    then target = instance_nearest(x,y,obj_bh_lockon)
                    else
                        {
                        target = instance_create_layer(x,y,layer,obj_bh_lockon);
                        target.parent = (self).id;
                        }
                    angle = point_direction(x,y,target.x,target.y);
                    scr_turntoimageangle(angle,11.25);
                    }
                else
                    {
                    target = instance_nearest(x,y,obj_en_parent);
                    angle = point_direction(x,y,target.x,target.y);
                    scr_turntoimageangle(angle,11.25);
                    }
                }
            else scr_turntoimageangle(90,11.25);
            
            if program == 0
                {
                if instance_exists(obj_bh_lockon) 
                then with obj_bh_lockon instance_destroy();
                }
            
            // behaviour change (aim with/separate from first orb)
            if global.button2 && !hook
                {
                program = !program; // bitwise invert
                hook = 1;
                }
            if !global.button2 then hook = 0;
            break;
            }
        case 2:
            {
            x = obj_player.x + 25;
            y = obj_player.y;
            
            if instance_exists(obj_en_parent)
                {
				var target;
                if instance_exists(obj_bh_lockon)
                then target = instance_nearest(x,y,obj_bh_lockon)
                else target = instance_nearest(x,y,obj_en_parent);
                angle = point_direction(x,y,target.x,target.y);
                scr_turntoimageangle(angle,11.25);
                }
            else scr_turntoimageangle(90,11.25);
            break;
            }
        }
    }


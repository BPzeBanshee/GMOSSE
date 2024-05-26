if instance_exists(parent_id)
    {
    switch position
        {
        case 1:
            {
            x = parent_id.x - 25;
            y = parent_id.y;
            
			var angle = 90;
            if instance_exists(obj_en_parent)
                {
				var target = instance_nearest(x,y,obj_en_parent);
                if program == 1
                    {
                    if !instance_exists(mytarget)
                        {
                        mytarget = instance_create_layer(x,y,layer,obj_bh_lockon);
                        mytarget.parent_id = id;
                        }
					target = mytarget;
                    }
                angle = point_direction(x,y,target.x,target.y);
                }
            scr_turntoimageangle(angle,11.25);
            
            if program == 0 && mytarget != noone
                {
                instance_destroy(mytarget);
				mytarget = noone;
                }
            break;
            }
        case 2:
            {
            x = parent_id.x + 25;
            y = parent_id.y;
            
			var angle = 90;
            if instance_exists(obj_en_parent)
                {
				var target = instance_nearest(x,y,obj_en_parent);
                if instance_exists(obj_bh_lockon) then target = instance_nearest(x,y,obj_bh_lockon);
                angle = point_direction(x,y,target.x,target.y);
                }
            scr_turntoimageangle(angle,11.25);
            break;
            }
        }
    }


// aesthetics
image_angle += 0.5;

if x < (320-33)-(sprite_width/2) && neg == 0 x += spd else neg = 1;
if x > 33+(sprite_width/2) && neg == 1 x -= spd else neg = 0;

// phase control
switch phase
    {
    case 0:
        {
        if y > yview-(sprite_height/2) && !made
            {
            // creates attack pods
            pod[0] = instance_create_depth(x+24,y+24,depth-1,obj_boss2_pod);
            pod[1] = instance_create_depth(x-24,y+24,depth-1,obj_boss2_pod);
            pod[2] = instance_create_depth(x+24,y-24,depth-1,obj_boss2_pod);
            pod[3] = instance_create_depth(x-24,y-24,depth-1,obj_boss2_pod);
			for (var i=0;i<4;i++) pod[i].parent_id = id;
            scr_create_healthbar();
            made = true;
            }
        timer += 1;
        if vspeed > 0.0375 vspeed -= 0.0375;
        if timer == 200
            {
            timer = 0;
            phase = 1;
            }
        break;
        }
    case 1:
        {
        vspeed = 0;
        spd += 0.02;
        if spd >= 1
            {
            spd = 1;
            phase = 2;
            }
        break;
        }
    case 2:
        {
        timer += 1;
        var count = real(instance_number(obj_boss2_pod));
		
		for (var i=0;i<4;i++)
			{
			if timer == count * (12 * (i+1))
				{
				if instance_exists(pod[i])
				with pod[i] event_user(mode)
				else timer += (count * 12);
				}
			}
        /*if timer == (count * 12)
             {
             if instance_exists(pod[0]) then 
             with pod[0] event_user(mode) else
             timer += (count * 12);
             }
        if timer == (count * 24)
             {
             if instance_exists(pod[1]) then 
             with pod[1] event_user(mode) else
             timer += (count * 12);
             }
        if timer == (count * 36)
             {
             if instance_exists(pod[2]) then 
             with pod[2] event_user(mode) else
             timer += (count * 12);
             }
        if timer == (count * 48)
             {
             if instance_exists(pod[3]) then 
             with pod[3] event_user(mode) else
             timer += (count * 12);
             }*/
        if timer > (count * 48) timer = 0;
             
        timeout -= 1;
        if timeout <= 0 phase = 3;                  
        break;
        }
    case 3:
        {
        image_blend = c_white;
        if spd > 0 spd -= 0.02 else spd += 0.02;
        vspeed += 0.02;
        image_alpha -= 0.005;
        image_xscale += 0.0005;
        image_yscale += 0.0005;
        if y > yview+320+(sprite_height/2) instance_destroy();
        break;
        }
    }
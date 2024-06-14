if y > yview-(sprite_height/2) && !made
    {
    pod1 = instance_create_layer(x,y,layer,obj_en6b);
    pod1.direction = 180;
    pod1.parent_id = id;
    pod2 = instance_create_layer(x,y,layer,obj_en6b);
    pod2.direction = 0;
    pod2.parent_id = id;
    made = true;
    }

// Aesthetics
thr_timer += 1;
if thr_timer == 5
    {
    var thr = scr_basicshot(x,y,layer,obj_en5_thr,3,270+irandom_range(-25,25));
    thr.image_xscale = 2;
    thr.image_yscale = 2;
    thr.image_angle = irandom(360);
    thr_timer = 0;
    }
    
// "Physics"
if num_of_bounce == 0 vspeed += 0.05;
if num_of_bounce < 2 if vspeed < 1 vspeed += 0.1;
if num_of_bounce >= 2 vspeed += 0.125; 
if hspeed > 2 hspeed -= 0.1;
if hspeed < -2 hspeed += 0.1;

// Attack phases + entry and exit
switch phase
    {
    case 0: 
        {
        if hspeed > 0 hspeed += 0.1;
        if hspeed < 0 hspeed -= 0.1;
        timer += 1;
        if timer == 60 
            {
            timer = 0; 
            phase = 1;
            }
        break;
        }
    case 1:
        {
		var aim;
        if instance_exists(obj_hitbox)
            {
            var tar = instance_nearest(x,y,obj_hitbox);
            aim = point_direction(x,y,tar.x,tar.y);
            }
        else aim = 270;
        
        shot_timer += 1;
        if shot_timer == 5
            {
            scr_basicshot(x,y,global.lay_bullets,obj_bullet4,4,aim); 
            scr_snd_play(snd_en_shot3,true);
            shot_timer = 0;
            num_of_shots += 1;
            }
        if num_of_shots == 5 phase = 2;
        break;
        }
    case 2:
        {
        timer += 1;
        if timer == 80
            {
            shot_timer = 0;
            timer = 0;
            num_of_shots = 0;
            phase = 1;
            }
        break;
        }
    }
    
if y > yview+320+(sprite_height/2) instance_destroy();
// Aesthetics/Thrusters
image_angle = direction;
var thr_aim = direction+180+irandom_range(-25,25);
var thr = scr_basicshot(x+lengthdir_x(18,direction+180),y,layer,obj_en5_thr,5,thr_aim);
thr.image_xscale = 2;
thr.image_yscale = 2;
thr.image_angle = irandom(360);

// Pod control
if y >= yview-(sprite_width/2) && !made
    {
    for (var i=0;i<4;i++)
        {
        tur[i] = instance_create_depth(p[i,0],p[i,1],depth-1,obj_en7_tur);
        tur[i].parent = id;
        }
    made = true;
    }

// Attack/Move pattern
if phase > 0 then timer += 1;
if timer == 120 && phase < 3
    {
    if phase == 1 then phase = 2 else phase = 1; 
	atk_timer = 0;
    timer = 0;
    }
    
switch phase
    {
    case 0: 
        {
        if y > yview-(sprite_width/2) speed -= 0.1;
        if speed <= 0.3 then phase = 1;
        break;
        }
    case 1: 
        {
        if y > yview+240 then phase = 3;
        
        atk_timer += 1;
        if atk_timer == 30 && made
            {
            for (var i=0;i<4;i++) {with tur[i] event_user(1)};
            scr_playsnd(snd_en_shot4,1);
            atk_timer = 0;
            }
        break;
        }
    case 2: 
        {
        if y > yview+240 then phase = 3;
        
        atk_timer += 1;
        if atk_timer == 4 && made
            {
            for (var i=0;i<4;i++) {with tur[i] event_user(2)};
            scr_playsnd(snd_en_shot1,1);
            atk_timer = 0;
            }
        break;
        }
    case 3: 
        {
        speed += 0.1;
        break;
        }
    }
    
// Death handling
if (x < -sprite_width) 
|| (x > 320 + sprite_width) 
|| (y > yview + 320 + sprite_height/2) 
then instance_destroy();
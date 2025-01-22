/* AESTHETICS */
var thr=scr_basicshot(x,y,layer,obj_en_thr,random_range(3,5),random_range(direction+100,direction+260));
thr.image_xscale = 4;
thr.image_yscale = 4;
thr.image_angle = random(360);

/* CREATION OF TURRETS */
if y > yview-(sprite_height/2) && !made
    {
    // Creation of turrets
    tur[0] = instance_create_depth(x-18,y-18,depth-1,obj_en_platTUR); // Top-left
    tur[1] = instance_create_depth(x+18,y-18,depth-1,obj_en_platTUR); // Top-right
    tur[2] = instance_create_depth(x-18,y+18,depth-1,obj_en_platTUR); // Bottom-left
    tur[3] = instance_create_depth(x+18,y+18,depth-1,obj_en_platTUR); // Bottom-right
	for (var i=0;i<4;i++) tur[i].parent_id = id;
    tur_count = 4;
    made = true;
    }

/* ATTACK PATTERNS */
if tur_count > 0 
    {
    // Pattern Duration/Reset of timers
    timer += 1;
    atk_timer += 1;
    if timer == 120
        {
        timer = 0;
        atk_timer = 0;
        if atk_phase == 1 atk_phase = 2 else atk_phase = 1;
        }
    
    // First Pattern
    if atk_phase == 1
        {
        if atk_timer == 30 
            {
			for (var i=0;i<4;i++) with tur[i] fire_weapon(1);
            scr_snd_play(snd_en_shot2,true);
            atk_timer = -30; // 90 steps after first call
            }
        }
    
    // Second Pattern
    if atk_phase == 2
        {
        if atk_timer == 4
            {
			for (var i=0;i<4;i++) with tur[i] fire_weapon(2);
            scr_snd_play(snd_en_shot1,true);
            atk_timer = 0;
            }
        }
    }
    
// Final pattern - Only occurs if all turrets are destroyed
if tur_count == 0 && y > yview-(sprite_height/2) && y < yview+160
    {
	z = 128;
	can_damage = true;
    timer += 1;
    if timer >= 4
        {
        scr_snd_play(snd_en_shot3,true);
        scr_basicshot(x,y,global.lay_bullets,obj_bullet4,4,aim); 
        aim += 45;
        if aim >= 360 aim = 0;
        timer = 0;
        }
    }    

/* MOVEMENT BEHAVIOUR */
switch phase
    {
    case 1: // Moving down
        {
        if y > yview+160
            {
            // if x == 160 do nothing
            if x > 160 direction = 180;
            if x < 160 direction = 0;
            speed = 1;
            phase = 2;
            }
        break;
        }
    case 2: // Moving left/right
        {
        if x < 40 || x > 280
            {
            direction = 90;
            speed = 0.5;
            phase = 3;
            }
        break;
        }
    case 3: // Moving up, then left/right
        {
        if y < yview+40
            {
            if x > 160 direction = 0;
            if x < 160 direction = 180;
            speed = 0.35;
            }
        break;
        }
    }
    
/* DEATH HANDLING */
if x < -(sprite_width/2) 
|| x > 320+(sprite_width/2)
|| y > yview+320+(sprite_height/2)
instance_destroy();
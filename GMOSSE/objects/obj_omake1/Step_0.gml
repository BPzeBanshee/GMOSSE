/* AESTHETICS */
// Sprite movement/transparency
image_angle += 1;
if image_alpha < 1 image_alpha += 0.025;

// Thrust
thr_timer += 1;
if thr_timer == 4
    {
    var thr1 = scr_basicshot(x,y,layer,obj_explosion,random(6),direction+180-45+random_range(-20,20));
    var thr2 = scr_basicshot(x,y,layer,obj_explosion,random(6),direction+180+45+random_range(-20,20));
    thr1.depth = depth + 1;
    thr2.depth = depth + 1;
    thr1.image_xscale = 0.75;
    thr1.image_yscale = 0.75;
    thr2.image_xscale = 0.75;
    thr2.image_yscale = 0.75;
    thr1.image_alpha = image_alpha;
    thr2.image_alpha = image_alpha;
    thr_timer = 0;
    }

// Background speed
var l = layer_get_id("lay_bkg");
if layer_get_vspeed(l) > -1
	{
	var spd = layer_get_vspeed(l);
	layer_vspeed(l,spd-0.05);
	}

/* BEHAVIOUR */
enemyHP = timeout;

var aim = 270;
if instance_exists(obj_hitbox)
    {
    var tar = instance_nearest(x,y,obj_hitbox);
    aim = point_direction(x,y,tar.x,tar.y);
    }

atk_timer += 1;
switch phase
    {
    case 0: // Intro
        {
        if atk_timer == 90 vspeed = -1;
        if y <= yview+sprite_height
            {
            vspeed = 0;
            hspeed = -1;
            phase = 1;
            }
        break;
        }
    case 1: // Main Phase
        {
        // Score
        if instance_exists(obj_player) scr_addscore(1000,0,0); // no logging
        
        // Movement
        if x <= 40+sprite_width && hspeed < 0
            {
            hspeed = 0;
            vspeed = 1;
            }
        if y >= yview+320-sprite_height && vspeed > 0
            {
            vspeed = 0;
            hspeed = 1;
            }
        if x >= 280-sprite_width && hspeed > 0
            {
            hspeed = 0;
            vspeed = -1;
            }
        if y <= yview+sprite_width && vspeed < 0
            {
            vspeed = 0;
            hspeed = -1;
            }
        
        
        if atk_timer >= 263//262.74 //32.34
            {
            // Attack 2
            count += 1;
            if count >= 17 count = 9;
            if count == 9 || count >= 15
                {
                for (var i=2;i<=6;i++) 
                    {
                    scr_basicshot(x,y,global.lay_bullets,obj_bullet2,i,image_angle);
                    scr_basicshot(x,y,global.lay_bullets,obj_bullet2,i,image_angle+45);
                    scr_basicshot(x,y,global.lay_bullets,obj_bullet2,i,image_angle+90);
                    scr_basicshot(x,y,global.lay_bullets,obj_bullet2,i,image_angle+135);
                    scr_basicshot(x,y,global.lay_bullets,obj_bullet2,i,image_angle+180);
                    scr_basicshot(x,y,global.lay_bullets,obj_bullet2,i,image_angle+225);
                    scr_basicshot(x,y,global.lay_bullets,obj_bullet2,i,image_angle+270);
                    scr_basicshot(x,y,global.lay_bullets,obj_bullet2,i,image_angle+315);
                    }
                scr_snd_play(snd_en_shot2,true);
                }
            else
                {
                 // Attack 1
                scr_snd_play(snd_en_shot1,true);
                for (var i=2;i<=7;i++) scr_basicshot(x,y,global.lay_bullets,obj_bullet1,i,aim);
                }
                
            atk_timer = 230;//.4;
            }  

        timeout -= 1;
        //enemyHP = timeout;
        if timeout <= 0 phase = 2;
        break;
        }
    case 2: // Time Out
        {
        hspeed = 0;
        vspeed -= 0.1;
        if y < yview-(sprite_width/2) instance_destroy();
        break;
        }
    }
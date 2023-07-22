// Compulsory
event_inherited();

// Timers
if shot_timer > 0 then shot_timer -= 1;
if shot2_timer > 0 then shot2_timer -= 1;
if bomb_timer > 0 then bomb_timer -= 1;
if time_passed < 180 then time_passed += 1;

// Main Shot
if global.button1 && shot_timer == 0
    {
    scr_snd_play(snd_war_shot1,true);
    scr_basicshot(x-4,y,layer,obj_warbird_shot,20,90);
    scr_basicshot(x+4,y,layer,obj_warbird_shot,20,90);
    scr_basicshot(x-10,y,layer,obj_warbird_shot,20,96);
    scr_basicshot(x+10,y,layer,obj_warbird_shot,20,84);
    shot_timer = 5;
    }
    
// Secondary Shot (lasers)
if global.button1 && shot2_timer == 0    
    {
    if instance_number(obj_warbird_laser) < limit
        {
        scr_snd_play(snd_war_shot2,true);
        scr_basicshot(x-10,y+4,layer,obj_warbird_laser,9,91);
        scr_basicshot(x+10,y+4,layer,obj_warbird_laser,9,89);
        shot2_timer = 8;
        }
    }
    
// Bomb Deployment
if global.button2 && bomb_timer == 0 && global.bombs > 0
    {
    global.bombs -= 1;
    bomb_timer = 320;
    instance_create_layer(x,y,layer,obj_warbird_bomb);
    scr_snd_play(snd_war_bomb);
    }
    
var a = instance_create_layer(x,y+8,layer,obj_en5_thr);
a.speed = 4;
a.direction = 270;
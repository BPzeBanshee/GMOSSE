// Aesthetics
if !dead
    {
    var thrust = scr_basicshot(x,y-12,layer,obj_en_thr,2,90);
    thrust.image_xscale = 4;
    thrust.image_yscale = 4;
    thrust.image_angle = irandom(360);
    thrust.z = 128;
    }

// Attack-related
timer -= 1;
if timer == 0
    {
    scr_spreadshot(x,y+16,obj_bullet2,-1,30,3,4,false); // bullet script
    scr_playsnd(snd_en_shot2,1);
    timer = 120;
    }
    
// Movement/Death-related
if y > yview+70 and y < yview+150 then vspeed = 0.2;
if y > yview+150 then vspeed += 0.1;
if y > yview+360 then instance_destroy();
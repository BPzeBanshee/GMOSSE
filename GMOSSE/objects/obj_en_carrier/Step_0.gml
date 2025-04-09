// Aesthetics
if !dead
    {
	var thr = scr_thrust(x,y,4,true);
	thr.speed = 2; 
	thr.direction = 90;
    }

// Attack-related
timer -= 1;
if timer == 0
    {
    scr_spreadshot(x,y+16,obj_bullet2,-1,30,3,4,false); // bullet script
    scr_snd_play(snd_en_shot2,true);
    timer = 120;
    }
    
// Movement/Death-related
if y > yview+70 and y < yview+150 vspeed = 0.2;
if y > yview+150 vspeed += 0.1;
if y > yview+360 instance_destroy();
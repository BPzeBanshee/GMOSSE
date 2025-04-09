// Aesthetics
image_angle += 1;
thr_timer += 1;
if thr_timer == 4 
    {
	var thr = scr_thrust(x,y,3.75,true);
	thr.image_speed = 0.3;
    thr_timer = 0;
    }
    
// Attack behaviour
timer += 1;
if count < 4
    {
    if timer > 0 && timer <= 30 speed = 2.5 else speed = 0;
    if timer == 120
        {
        count += 1;
        set_aim();
        timer = 0;
        }
    }
else speed = 2.5;
if y > yview+336 instance_destroy();


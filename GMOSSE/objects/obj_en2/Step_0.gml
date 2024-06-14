// Again, the image_variable thing is aesthetic, makes the object rotate.
image_angle -= 5;

// Now we see the manipulation of the timer variable. It counts up
// by 1 every step till it reaches 30, and then calls the script
// scr_spreadshot. The exact variables for usage can be seen
// in the script itself.
timer += 1;
if timer > 60 && y < yview+200
    {
    hspeed = 0;
    vspeed = 0.5;
    scr_spreadshot(x,y,obj_bullet4,-1,25,3,5,false);
    scr_snd_play(snd_en_shot3,true);
    timer = 0;
    }

// The script is called with the arguments passed on to it, and then
// the timer is set back to 0, and this entire process starts again.
if y > yview + 340 instance_destroy();


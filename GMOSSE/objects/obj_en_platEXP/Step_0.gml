image_xscale -= 0.005;
image_yscale -= 0.005;
image_alpha -= 0.01;
timer += 1;
if timer == 2
    {
    var r = random_range(-10,10);
    scr_basicshot(x+r,y+r,layer,obj_explosion,2,random(360));
    timer = 0;
    count += 1;
    }
if count == 20 instance_destroy();
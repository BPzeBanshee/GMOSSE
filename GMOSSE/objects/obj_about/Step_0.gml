//input check
draw_y -= 0.5;
obj_title.y -= 0.5;
if (!global.button1 && !ready) ready = true;
if (global.button1 && ready) || draw_y <= e
    {
    ready = false;
    scr_playsnd(snd_click,0);
    obj_title.y = 75;
    instance_destroy();
    }
//input check
draw_y -= 0.5;
obj_title.y -= 0.5;
var b1 = global.button1[0];
if (!b1 && !ready) ready = true;
if (b1 && ready) || draw_y <= e
    {
    ready = false;
    scr_snd_play(snd_click,true);
    obj_title.y = 75;
    instance_destroy();
    }
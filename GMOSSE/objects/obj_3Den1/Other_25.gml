if !dead
    {
    scr_playsnd(snd_exp2,0);
    jump_timer += 666;
    scr_addscore(300,180,1);
    dead = true;
    }

scr_basicshot(x,y,layer,obj_explosion,5,random(360));

image_alpha -= 0.1;
image_xscale -= 0.1;
image_yscale -= 0.1;
if image_alpha <= 0 then instance_destroy();
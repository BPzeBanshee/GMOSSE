if dead == false
    {
    scr_clearbullets();
    scr_addscore(5000,180,1);
    dead = true;
    }
    
if dead_timer == 0
    {
    repeat 3 scr_create_exp(obj_explosion,360,18); 
    scr_playsnd(snd_exp3,1);
    }
dead_timer += 1;
if dead_timer == 6
    {
    dead_timer = 1;
    scr_playsnd(snd_exp1,1);
    scr_create_exp(obj_explosion,360,18); 
    }

image_alpha -= 0.05;
image_xscale += 0.05;
image_yscale += 0.05;
if image_alpha < 0.05
    {
    scr_playsnd(snd_exp2,1);
    scr_create_exp(obj_explosion,360,18); 
    instance_destroy();
    }


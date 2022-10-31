scr_clearbullets();
timer += 1;
if timer == 3
    {
    scr_playsnd(snd_exp1,0);
    timer = 0;
    }
var explosion = instance_create_depth(x,y,depth+irandom_range(-2,2),obj_explosion);
explosion.x = x +irandom_range(-24,24);
explosion.y = y +irandom_range(-24,24);
if global.omake_enabled
    {
    explosion.sprite_index = choose(spr_explosion,spr_explosion_blue,spr_explosion_green,spr_explosion_purple);
    image_angle = random(360);
    }
else
    {
    image_angle += vspeed;
    vspeed += 0.03;
    
    if y > yview+320 
        {
        scr_playsnd(snd_exp3,0);
        instance_destroy();
        }
    }


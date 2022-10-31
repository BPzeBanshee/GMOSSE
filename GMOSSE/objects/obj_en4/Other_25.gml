var e = instance_create_layer(x,y,layer,obj_explosion);
e.direction = irandom(360);
e.speed = 2.5;

if image_alpha == 1
    {
    scr_playsnd(snd_exp3,1);
    scr_addscore(500,180,1);
    }

image_alpha -= 0.1;
image_xscale -= 0.1;
image_yscale -= 0.1;
if image_alpha < 0.1
    {
    // Contra Yagawa Corps Eksploshunz by Michael Bay!
    scr_create_exp(obj_explosion,360,18);
    instance_destroy();
    }
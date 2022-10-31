scr_clearbullets();
vspeed += 0.05;

image_angle += vspeed * 25;
image_alpha -= 0.01;
image_xscale -= 0.0025;
image_yscale -= 0.0025;

timer += 1;
if timer == 15
    {
    scr_create_exp(obj_explosion,360,18); 
    scr_playsnd(snd_exp1,0);
    timer = 0;
    }
if image_alpha <= 0
    {
    scr_playsnd(snd_exp3,0);
    if global.omake_enabled then instance_create_layer(160,yview-16,layer,obj_omake2);
    instance_destroy();
    }
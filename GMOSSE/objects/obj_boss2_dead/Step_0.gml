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
    scr_snd_play(snd_exp1);
    timer = 0;
    }
if image_alpha <= 0
    {
    scr_snd_play(snd_exp3);
    if global.omake_enabled instance_create_layer(160,yview-16,global.lay_en_air,obj_omake2);
    instance_destroy();
    }
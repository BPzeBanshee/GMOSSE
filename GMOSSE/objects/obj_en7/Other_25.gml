if made
    {
    for (var i=0;i<4;i++)
        {
        with tur[i] visible = false;
        }
    }
if image_alpha == 1
    {
    scr_playsnd(snd_exp2,0);
    scr_addscore(800,180,1);
    }
var e = instance_create_depth(x,y,depth-1,obj_explosion);
e.direction = random(360);
e.speed = 2.5;

image_alpha -= 0.1;
image_xscale -= 0.1;
image_yscale -= 0.1;
if image_alpha < 0.1
    {
    scr_create_exp(obj_explosion,360,18);
    instance_destroy();
    }


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
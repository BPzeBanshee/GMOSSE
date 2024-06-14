image_angle += 10;
image_xscale -= 0.05;
image_yscale -= 0.05;
image_alpha -= 0.01;
timer += 1;
if timer == 2
    {
    var variable = irandom_range(-5,5);
    var exp1 = instance_create_layer(x+variable,y+variable,layer,obj_explosion);
	if global.omake_enabled
        {
        exp1.sprite_index = choose(spr_explosion,spr_explosion_blue,spr_explosion_green,spr_explosion_purple);
        exp1.direction = irandom(360);
        exp1.speed = 2;
        }
    timer = 0;
    count += 1;
    }
if count == 10 instance_destroy();
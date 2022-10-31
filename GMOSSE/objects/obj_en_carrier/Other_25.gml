if dead == false
    {
    scr_playsnd(snd_exp2,0);
    scr_addscore(100,180,1);
    if stocktype == 1
        {
        var bomb = scr_basicshot(x,y,global.lay_player,obj_stock_bomb,3.5,90);
        bomb.gravity = 0.1;
        bomb.image_angle = 0;
        }
    dead = true;
    }

scr_basicshot(x,y,layer,obj_explosion,2.5,random(360));

image_alpha -= 0.1;
image_xscale -= 0.1;
image_yscale -= 0.1;
if image_alpha < 0.1
    {
    scr_create_exp(obj_explosion,360,18); 
    instance_destroy();
    }


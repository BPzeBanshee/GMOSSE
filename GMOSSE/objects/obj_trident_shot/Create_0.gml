damage = 2.5;
image_angle = 90;
speed = 10;
direction = 90;

do_hit = function(){
scr_snd_play(snd_sf_shothit,true);
scr_basicshot(x,y,layer,obj_trident_shothit,speed,direction);
instance_destroy();
}
damage = 3;

direction = 90;
image_angle = direction;
image_speed = 0;
timer = 0;

max_speed = 15;
min_speed = 1;
turnrate = 1;
max_turnrate = 10;
min_turnrate = 1;
acceleration = 0.5;

hit_event = function(){
var e = scr_basicshot(x,y,layer,obj_xono_shothit,2,direction);
e.image_xscale = 0.75;
e.image_yscale = 0.75;
instance_destroy();
}
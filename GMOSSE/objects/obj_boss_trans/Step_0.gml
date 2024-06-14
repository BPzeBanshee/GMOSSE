var thr = instance_create_layer(x,y,layer,obj_en_thr);
thr.speed = random_range(5,7);
thr.image_angle = random(360);
thr.direction = random_range(260,280);
thr.image_xscale = random(2.5);
thr.image_yscale = thr.image_xscale;
//thr.depth = depth + 1;

vspeed = -1;
if y < yview-32 instance_destroy();
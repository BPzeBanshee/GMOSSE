///@desc Creates a transformed instance of obj_en_thr underneath the calling object. Use for thrusters, etc.
function scr_thrust(_x,_y,scale=3,rand_angle=true){
var thr = instance_create_depth(_x,_y,depth+1,obj_en_thr);
    thr.image_xscale = scale;
    thr.image_yscale = scale;
    //thr.image_speed = 0.3;
    if rand_angle thr.image_angle = irandom(360);
	return thr;
}
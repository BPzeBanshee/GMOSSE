// AESTHETICS
image_angle = direction;

// Thrusters
var tx = x + lengthdir_x(16,direction-180);
var ty = y + lengthdir_y(16,direction-180);
var thr = scr_basicshot(tx,ty,layer,obj_explosion,5,direction-180+random_range(-10,10));
thr.image_xscale = 0.5;
thr.image_yscale = 0.5;
thr.depth = depth + 1;

// HAND POSITION
xx = x+lengthdir_x(54,direction);
yy = y+lengthdir_y(54,direction);
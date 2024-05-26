damage = 2.5;
blend = c_white;

create_hitspark = function(){
var d = direction + irandom_range(-15,15);
var s = scr_basicshot(x,y,layer,obj_bh_shothit,6,d);
s.image_blend = blend;
}
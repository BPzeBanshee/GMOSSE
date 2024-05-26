damage = 2.5;
bounce = 0;
blend = c_white;

create_hitspark = function(){
var s = scr_basicshot(x,y,layer,obj_bh_shothit,5,direction);
s.image_blend = blend;
}
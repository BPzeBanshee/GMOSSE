damage = 5;
blend = c_white;
create_hitspark = function(){
// was speed 3
var s = scr_basicshot(x,y,layer,obj_bh_shothit,speed/2,direction);
s.image_blend = blend;
}
damage = 0.5;
blend = c_white;

create_hitspark = function(){
// was spd 0.5
var hit = scr_basicshot(x,y,layer,obj_bh_shothit,1,direction);
hit.image_xscale = 0.5;
hit.image_yscale = 0.5;
hit.image_blend = blend;
}
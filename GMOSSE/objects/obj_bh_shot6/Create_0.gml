damage = 1.2;
image_blend = c_yellow;
image_speed = 0.22;
image_xscale = 0.6;
image_yscale = 0.6;
death_timer = 0;

create_hitspark = function(){
// was speed 3
var d = 90 + irandom_range(-15,15);
var hit = scr_basicshot(x,y,layer,obj_bh_shothit,speed,d);
hit.sprite_index = spr_explosion;
hit.image_index = image_index;
hit.image_xscale = image_xscale;
hit.image_yscale = image_yscale;
hit.image_blend = 5204479;
}
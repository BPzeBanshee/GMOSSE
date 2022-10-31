image_angle += 0.02;
var l = layer_get_id("lay_bkg");
vspeed = layer_get_vspeed(l);
if y > yview+320+(sprite_height/2) then instance_destroy();
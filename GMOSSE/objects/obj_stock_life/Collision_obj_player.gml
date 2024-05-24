(other.myctrl).mylives += 1;
scr_snd_play(snd_1up);
var a = instance_create_layer(x,y,layer,obj_popup);
a.msg = "EXTEND";
instance_destroy();
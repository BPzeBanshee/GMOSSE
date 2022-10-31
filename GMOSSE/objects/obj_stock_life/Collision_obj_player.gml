lives += 1;
scr_playsnd(snd_1up,1);
var a = instance_create_layer(x,y,layer,obj_popup);
a.msg = "EXTEND";
instance_destroy();
if other.z != 128 exit;
scr_snd_play(snd_exp1,true);
repeat 5 scr_basicshot(x,y,layer,obj_bh_shothit,1,irandom(360));
instance_destroy();
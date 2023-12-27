if other.z != 128 exit;
scr_snd_play(snd_sf_shothit,true);
scr_basicshot(x,y,layer,obj_trident_shothit,speed,direction);
instance_destroy();
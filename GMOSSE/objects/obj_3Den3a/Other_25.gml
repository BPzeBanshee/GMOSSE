scr_addscore(50,180,1);
instance_create_layer(x,y,layer,obj_explosion);
scr_snd_play(snd_exp1);
if instance_exists(obj_ctrl_stage) 
with obj_ctrl_stage pop_count += 1;
instance_destroy();
scr_addscore(50,180,1);
instance_create_layer(x,y,layer,obj_explosion);
scr_playsnd(snd_exp1,0);
if instance_exists(obj_ctrl_st1) 
then with obj_ctrl_st1 pop_count += 1;
instance_destroy();
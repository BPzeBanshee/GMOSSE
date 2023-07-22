scr_snd_play(snd_exp3);
scr_create_exp(obj_explosion,360,18); 
scr_addscore(5000,180,1);
with parent pods_killed += 1; 
instance_destroy(); 
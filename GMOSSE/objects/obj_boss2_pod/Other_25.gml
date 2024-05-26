scr_snd_play(snd_exp3);
scr_create_exp(obj_explosion,360,18); 
scr_addscore(5000,180,1);
with parent_id pods_killed += 1; 
instance_destroy(); 
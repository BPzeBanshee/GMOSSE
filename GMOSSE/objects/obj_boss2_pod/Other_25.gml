scr_playsnd(snd_exp3,0);
scr_create_exp(obj_explosion,360,18); 
scr_addscore(5000,180,1);
with parent pods_killed += 1; 
instance_destroy(); 
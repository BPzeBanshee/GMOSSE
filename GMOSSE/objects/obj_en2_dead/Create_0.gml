// stop the dying enemy from moving and set image_speed to be slower.
speed = 0;

// add explosion effect multiple times by using a variable timer
explosiontimer = 0;

// fake z-depth handling.
z = 128;
z_speed = 1;

// Contra Yagawa Corps Eksploshunz by Michael Bay!
scr_create_exp(obj_explosion,360,18);
scr_playsnd(snd_exp2,0);
// Event timing/fade in-out vars
timer = 0;
fade = 0;
fade2 = 0;

// Text display vars
chr1 = 0;
text = "";
msg = @"A HUGE ENEMY 
STANDS IN YOUR WAY";
image_alpha = 0; // red scanlines
alpha2 = 0; // WARNING
alpha3 = 1; // text

// Misc.
rnd = 15;

if !instance_exists(obj_ctrl_gameover) then scr_snd_play(snd_voice3);
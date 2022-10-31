// Event timing/fade in-out vars
timer = 0;
fade = 0;
fade2 = 0;

// Text display vars
chr1 = 0;
text = "";
msg = "";
//msg = "/\X3|<I|_|_J<>y |\/||< ||#APPROACHING";
image_alpha = 0; // red scanlines
alpha2 = 1; // WARNING
alpha3 = 1; // text

// Misc.
rnd = 15;

if !instance_exists(obj_ctrl_gameover) 
    {
    scr_playsnd(snd_pain,1);
    //scr_playsnd(snd_voice5,1);
    }


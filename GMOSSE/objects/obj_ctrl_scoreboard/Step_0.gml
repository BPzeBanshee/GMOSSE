if !global.button1 then ready = true;
if (global.button1 && ready && !instance_exists(obj_trans))
    {
    ready = false;
    scr_trans(rm_menu,2,c_white,0.025,0.05,0);
	with obj_ctrl_music
        {
        if music == snd_gameover then fade_out(0.05);
        }
    }
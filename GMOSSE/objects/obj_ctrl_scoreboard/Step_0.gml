var b1 = global.button1;
if !b1 ready = true;
if (b1 && ready && !instance_exists(obj_trans))
    {
    ready = false;
    scr_trans(rm_menu,2,c_white,0.025,0.05,0);
	with obj_ctrl_music
        {
        if music == snd_gameover fade_out(0.05);
        }
    }
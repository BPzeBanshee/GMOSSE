/// @description  CONTINUE MUSIC 
// Call once to play, call again to stop
if instance_exists(obj_ctrl_continue)
    {
    scr_stopmusic(music2);
    exit;
    }
else
    {
    timer = 0;
    alpha = 0;
    info = scr_loadmusicinfo("Continue");
    music2 = scr_playmusic(snd_continue,0);
    scr_setvolmusic(music2);
    }


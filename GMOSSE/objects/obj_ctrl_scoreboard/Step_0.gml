if !global.button1 then ready = true;
if (global.button1 && ready && !instance_exists(obj_trans))
    {
    ready = 0;
    scr_trans(rm_menu,2,c_white,0.025,0.05,0);
    if instance_exists(obj_ctrl_music) then with obj_ctrl_music
        {
        if gameover then scr_fademusic(0.05);
        }
    }


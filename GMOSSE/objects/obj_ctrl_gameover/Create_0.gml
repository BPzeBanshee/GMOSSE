global.pausable = false;
timer = 0;
// Initialise highscore entry vars
letter1 = "A";
letter2 = "_";
letter3 = "_";
lt1num = 65;
lt2num = 65;
lt3num = 65;

// Initialise menu-related vars
pos = 1;
ready = 0;
scroll = 0;
flash = 0;
name = "";
hassaved = 0;

newscore = 0;
if global.myscore >= global.hiscore[9,3] 
&& (!instance_exists(obj_ctrl_input2) || (instance_exists(obj_ctrl_input2) && obj_ctrl_input2.replaying=0)) 
then newscore = 1;


str = "Game Complete!";
if !instance_exists(obj_ctrl_clear)
    {
    str = "Game Over";
    with obj_ctrl_music event_user(6);
    }

scr_pause();
visible = true;
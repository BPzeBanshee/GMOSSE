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
ready = false;
scroll = 0;
flash = 0;
name = "";
hassaved = false;

newscore = false;
var replay_mode = instance_exists(obj_ctrl_input2) ? (obj_ctrl_input2.replaying ? true : false) : false;
if global.player_data.myscore >= global.hiscore[9,3] 
&& (!replay_mode) 
newscore = true;

str = "Game Complete!";
if !instance_exists(obj_ctrl_clear)
    {
    str = "Game Over";
    with obj_ctrl_music event_user(6);
    }

if !global.paused scr_pause();
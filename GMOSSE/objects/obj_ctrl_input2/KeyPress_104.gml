/// @description  LOAD REPLAY
var old_startstage = global.startstage;
global.startstage = -1;
event_user(1);
if global.startstage != -1
    {
    scr_trans(global.startstage,3,c_black,0.025,0.05,210);
    with obj_ctrl_music fade_out(3000);
    replaying = 1;
    }
else global.startstage = old_startstage;
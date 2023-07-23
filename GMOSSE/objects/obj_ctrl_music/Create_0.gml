/*
obj_ctrl_music_v2, by BPzeBanshee

EXPERIMENTAL CONTROLLER THAT LOADS ALL MUSIC HANDLES AT ONCE.
USE AT YOUR OWN RISK.
*/

// Currently playing streams
channel = -1;
channel2 = -1;

// Array containers of music info
music = -1;
music2 = -1;

// Fade states
fading_in = false;
fading_out = false;

// 'Load all sounds' or 'load only needed'
LOAD_EVERYTHING = true;
CONTINUE_TOGGLE = false;

// Create methods
event_user(0);

show_info(false);
if LOAD_EVERYTHING
then load_all()
else load();
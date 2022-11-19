/*
obj_ctrl_music, by BPzeBanshee

Other objects (ie stage controllers) make this one call the User-Defined events 
to play the music that they want. Most music engine-specific calls are encapsulated in
scripts to make the code easier to read here. 
Switching of music along with music information is loaded here, while a script
with a separate object (obj_fade) handles music fadeouts.
*/
music = -1;
music2 = -1;
fade_in = false;
fade_out = false;
fade_amount = 0;
fade_value = -1;
fade_song = -1; //clutch to stop music switching getting faded out

var e = AInit();
if e != 0
    {
    show_debug_message("Error loading GMALP.DLL");
    instance_destroy();
    }
//show_message("AVersion(): "+AVersion());
//show_message("AGetSupportedDevices(): "+AGetSupportedAudioDevices());
timer = 360;
alpha = 0;
info = -1; // init variable for music loading scripts
mainmenu = 0;
gameover = 0;
debug = false;

scr_setvolsnd();

snd_intro = -1;
snd_shipselect = -1;
snd_stageclear = -1;
snd_continue = -1;
snd_gameover = -1;
snd_st1 = -1;
snd_st2 = -1;
snd_st3 = -1;
snd_st3b = -1;
snd_boss = -1;
snd_omake1 = -1;
snd_omake2 = -1;
snd_omake3 = -1;
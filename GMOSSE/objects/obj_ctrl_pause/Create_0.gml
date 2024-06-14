// Menu variable initialisation
selection = 1;
hook = true;
enabled = true;
restart_locked = false;

if global.nextroom == room 
&& room != global.startstage 
&& room != rm_tutorial
restart_locked = true;

scr_pause();
with obj_ctrl_music pause();
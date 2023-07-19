// Menu variable initialisation
selection = 1;
hook = 1;
enabled = false;

restart_locked = false;
if global.nextroom == room 
&& room != global.startstage 
&& room != rm_tutorial
then restart_locked = true;

scr_pause();
enabled = true;
with obj_ctrl_music pause();
// Menu variable initialisation
selection = 1;
hook = 1;
enabled = false;
if global.nextroom == room && room != global.startstage && room != rm_tutorial
then restart_locked = 1 else restart_locked = 0;

scr_pause();
enabled = true;
scr_pausemusic(true);
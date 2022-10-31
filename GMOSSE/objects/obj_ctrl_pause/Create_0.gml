// Menu variable initialisation
selection = 1;
hook = 1;
enabled = 0;
s2 = 0;
if global.nextroom = room && room != global.startstage && room != rm_tutorial
then restart_locked = 1 else restart_locked = 0;

scr_pause();
enabled = 1;

// Pause music/GMFMODSimple sfx
scr_pausemusic(1);


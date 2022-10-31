enabled = 0; // Start of init

// Pause game/music
scr_pause();
scr_pausemusic(1);
global.pausable = false;

// Menu control vars
selection = 1;
hook = 1;
alpha = 0;
has_chosen = 0;

// Star aesthetics
limiter = 0;
behaviour_stored = global.behaviour;
global.behaviour = 3;

enabled = 1; // End of init


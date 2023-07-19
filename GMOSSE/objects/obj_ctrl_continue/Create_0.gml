enabled = false; // Start of init

// Pause game/music
scr_pause();
with obj_ctrl_music pause();
global.pausable = false;

// Menu control vars
selection = 1;
hook = 1;
alpha = 0;
has_chosen = false;

// Star aesthetics
limiter = 0;
behaviour_stored = global.behaviour;
global.behaviour = 3;

enabled = true; // End of init
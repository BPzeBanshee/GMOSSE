/*
obj_ctrl_game, a merge of obj_ctrl_life and obj_ctrl_score

- WIP preliminary core change
- required for 2P support
- not in-game yet
*/

// Score
global.myscore = global.score_stored; // loads score from score_stored variable
global.chain = 0;
global.countdown = 0;

// Display vars (required for scr_hud_p1)
a = 0.5;

// Life handling
lives = global.lives_stored;
myhitbox = noone;
myplayer = noone;
respawntimer = -1;

scr_layer_vars();

event_user(0);
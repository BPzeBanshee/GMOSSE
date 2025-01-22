// Establish layer and position variables
scr_layer_vars();
x = obj_ctrl_stage.x+160;
y = yview+240;

// Display vars (required for HUD)
a = 0.5;

// Life handling
myhitbox = noone;
myplayer = noone;
respawntimer = -1;
gameover = false;

// Score
chain = 0;
countdown = 0;

// Pull game data from player struct
shipselect = global.player_data.shipselect;
mylives = global.player_data.mylives;
mybombs = global.player_data.mybombs;
myscore = global.player_data.myscore; // loads score from score_stored variable
weapontype = global.player_data.weapontype;
optiontype = global.player_data.optiontype;
side = global.player_data.hud_side; // Determine "side" of screen to use (1P or 2P)

// Finally, create player
event_user(0);
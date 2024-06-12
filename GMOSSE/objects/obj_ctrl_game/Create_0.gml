// Determine "side" of screen to use (1P or 2P)
// TODO: this could be more robust
var o = instance_number(object_index);
side = global.player_data[o-1].hud_side;
global.player_data[side].myctrl = id;

if o > 1
then x = obj_ctrl_stage.x+160+(side ? 80 : -80)
else x = obj_ctrl_stage.x+160;
y = yview+240;

// Score
myscore = global.player_data[side].myscore; // loads score from score_stored variable
chain = 0;
countdown = 0;

// Display vars (required for scr_hud_p1)
a = 0.5;

// Life handling
mylives = global.player_data[side].mylives;
myhitbox = noone;
myplayer = noone;
respawntimer = -1;
gameover = false;

scr_layer_vars();

event_user(0);
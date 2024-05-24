// Determine "side" of screen to use (1P or 2P)
var o = instance_number(object_index);
if o > 1 then side = o-1 else side = global.myside;

// Score
myscore = global.score_stored[side]; // loads score from score_stored variable
chain = 0;
countdown = 0;

// Display vars (required for scr_hud_p1)
a = 0.5;

// Life handling
mylives = global.lives_stored[side];
myhitbox = noone;
myplayer = noone;
respawntimer = -1;

scr_layer_vars();

event_user(0);
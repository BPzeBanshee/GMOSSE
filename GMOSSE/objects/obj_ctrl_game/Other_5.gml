/// @description  Store bombs/lives/score
if global.nextroom == room || room == rm_tutorial then exit;
global.lives_stored[side] = mylives;
global.score_stored[side] = myscore;
/// @description  Store bombs/lives/score
if global.nextroom == room || room == rm_tutorial then exit;
global.bombs_stored = global.bombs;
global.lives_stored = lives;
global.score_stored = global.myscore;


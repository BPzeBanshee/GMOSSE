/// @description  Globalvar initialisation for ingame
// TODO: CONSOLIDATE THESE INTO ONE PLACE - COPIED FROM OBJ_DEBUG AND OBJ_SHIPSELECT
// TODO: replace RNG with map data, replace map data with GMOSSE recording
global.shipselect = irandom_range(1,5);

global.score_stored = 0;
global.extend_number = 1;
global.lives_stored = 3;
global.bombs_stored = -1;
global.continues = 0;

// Also having to load all the ship-specific shit as globalvars isn't ideal either
global.optiontype = irandom_range(1,7);
global.weapontype = irandom_range(1,7);
/// @descn Globalvar initialisation for ingame
// TODO: CONSOLIDATE THESE INTO ONE PLACE - COPIED FROM OBJ_DEBUG AND OBJ_SHIPSELECT
// TODO: replace RNG with map data, replace map data with GMOSSE recording
scr_playerdata_reset();
global.player_data.shipselect = irandom_range(1,5);
global.player_data.optiontype = irandom_range(1,7);
global.player_data.weapontype = irandom_range(1,7);
/// @description  Globalvar initialisation for ingame
// TODO: CONSOLIDATE THESE INTO ONE PLACE - COPIED FROM OBJ_DEBUG AND OBJ_SHIPSELECT
// TODO: replace RNG with map data, replace map data with GMOSSE recording
global.shipselect = irandom_range(1,5);

// I'm not so sure custom bomb values are a good idea anymore...
switch global.shipselect
    {
    default: global.init_bombs = 3; global.max_bombs = 5; break;
    case 2: global.init_bombs = 2; global.max_bombs = 4; break;
    case 3: global.init_bombs = 0; global.max_bombs = 0; break;
    case 4: global.init_bombs = 2; global.max_bombs = 4; break;
    case 5: global.init_bombs = 3; global.max_bombs = 3; break; 
    }

global.score_stored = 0;
global.extend_number = 1;
global.lives_stored = 3;
global.bombs_stored = global.init_bombs;
global.continues = 0;

// Also having to load all the ship-specific shit as globalvars isn't ideal either
global.xonospr = irandom_range(1,3);
global.arxynespr = choose(1,2);
global.optiontype = irandom_range(1,7);
global.weapontype = irandom_range(1,7);


/// @description  Bypassing ship selection screen
global.shipselect = 1;

// I'm not so sure custom bomb values are a good idea anymore...
switch global.shipselect
    {
    default: global.init_bombs = 3; global.max_bombs = 5; break;
    case 2: global.init_bombs = 2; global.max_bombs = 4; break;
    case 3: global.init_bombs = 0; global.max_bombs = 0; break;
    case 4: global.init_bombs = 2; global.max_bombs = 4; break;
    case 5: global.init_bombs = 3; global.max_bombs = 3; break; 
    }
    
// Also having to load all the shipselect aesthetics or pluck out vars isn't ideal either
global.score_stored = 0;
global.extend_number = 1;
global.lives_stored = 3;
global.bombs_stored = global.init_bombs;
global.continues = 0;

// TODO: globalvars for specific ship stats aren't ideal
global.xonospr = 1; 
global.arxynespr = 1;
global.optiontype = 6;
global.weapontype = 1;
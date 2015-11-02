globalvar ship_info,max_ships; // declare global variables
for (i=0; i<8; i+=1) ship_info[i] = 0; // reset ship_info array
switch argument0
    {
    case 1:
        {
        global.init_bombs = 3; // default bomb count
        global.max_bombs = 5; // maximum bombs it can carry
        if global.xonospr = 1 then ship_info[0] = spr_xono; // sprite
        if global.xonospr = 2 then ship_info[0] = spr_xono_v2;
        if global.xonospr = 3 then ship_info[0] = spr_xono_v3;
        ship_info[1] = 0; // image index
        ship_info[2] = "Xonochrome"; // name
        ship_info[3] = "Attack = **";
        ship_info[4] = "Speed = *****";
        ship_info[5] = "Coverage = *";
        ship_info[6] = string_spacefix("The original Number 1 mascot 
of G.M.O.S.S.E. The game is balanced with
this ship at the forefront of testing. 

It is fast in every sense of the word
but relies heavily on homing missiles 
and its haste for coverage of the game 
screen as the main shot lacks spread.");
        break;
        }
    case 2:
        {
        global.init_bombs = 1;
        global.max_bombs = 2;
        ship_info[0] = spr_warbird;
        ship_info[1] = 0;
        ship_info[2] = "Warbird R2";
        ship_info[3] = "Attack = *****";
        ship_info[4] = "Speed = ***";
        ship_info[5] = "Coverage = ***";
        ship_info[6] = string_spacefix("The new variant of the ship from 
Warbird:A13-02 is quite the wild card.

With a void bomb giving invincability
against collisions it can be quite 
powerful against enemies up close, 
but at a distance it'll be weak.");
        break;
        }
    case 3:
        {
        global.init_bombs = 0;
        global.max_bombs = 0;
        ship_info[0] = spr_bh;
        ship_info[1] = 0;
        ship_info[2] = "Busterhawk";
        ship_info[3] = "Attack = VARIED";
        ship_info[4] = "Speed = VARIED";
        ship_info[5] = "Coverage = VARIED";
        ship_info[6] = string_spacefix("Based on the ship featured in
''Advanced Busterhawk Gleylancer'',
this ship features customisable
options that do all the hard work.

With a large and varied weapon roster, 
this ship can deal extremely massive or 
extremely pathetic damage to enemies.");
        break;
        }
    case 4:
        {
        global.init_bombs = 2;
        global.max_bombs = 4;
        ship_info[0] = spr_sf;
        ship_info[1] = 2;
        ship_info[2] = "Swordfish";
        ship_info[3] = "Attack = ***";
        ship_info[4] = "Speed = ****";
        ship_info[5] = "Coverage = ****";
        ship_info[6] = string_spacefix("Based on a ship in Cowboy Bebop, 
this old Xeno Fighters R proposal 
has been given life in G.M.O.S.S.E 
with conventional ship behaviour.

The bomb, while powerful, will slow 
you down a lot. Beware!");
        break;
        }
    case 5:
        {
        global.init_bombs = 3;
        global.max_bombs = 3;
        if global.arxynespr = 2 then ship_info[0] = spr_arxyneV2
        else ship_info[0] = spr_arxyne;
        ship_info[1] = 0;
        ship_info[2] = "Arxyne";
        ship_info[3] = "Attack = ***";
        ship_info[4] = "Speed = ***";
        ship_info[5] = "Coverage = *****";
        ship_info[6] = string_spacefix("For the simpler 'power is power'
approach, Arxyne fits the bill.

This ship does not get a slowdown button
due to its slow speed. Instead it has an 
awesome lightning gun and homing lasers 
that can penetrate walls.");
        break;
        }
    default:
        {
        ship_info[0] = -1;
        ship_info[1] = 0;
        ship_info[2] = "NOT AVAILABLE";
        ship_info[3] = "Attack = ----";
        ship_info[4] = "Speed = ----";
        ship_info[5] = "Coverage = ----";
        ship_info[6] = string_spacefix("This ship slot is not in use,
or is otherwise not available.");
        break;
        }
    }
max_ships = 5;

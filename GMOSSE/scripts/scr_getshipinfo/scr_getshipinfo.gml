function scr_getshipinfo(ship_id) {
	//globalvar ship_info,max_ships; // declare global variables
	for (var i=0; i<6; i+=1) ship_info[i] = 0; // reset ship_info array
	switch ship_id
	    {
	    case 1:
	        {
	        global.init_bombs = 3; // default bomb count
	        global.max_bombs = 5; // maximum bombs it can carry
	        if global.xonospr == 1 then ship_info[0] = spr_xono; // sprite
	        if global.xonospr == 2 then ship_info[0] = spr_xono_v2;
	        if global.xonospr == 3 then ship_info[0] = spr_xono_v3;
	        ship_info[1] = 0; // image index
	        ship_info[2] = "Xonochrome"; // name
	        ship_info[3] = "Attack = **";
	        ship_info[4] = "Speed = *****";
	        ship_info[5] = "Coverage = *";
	        ship_info[6] = string_spacefix(@"Fast in every sense of the word
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
	        ship_info[6] = string_spacefix(@"With a void bomb giving invincibility
	against collisions it can be quite 
	powerful against enemies up close, 
	which is where its weapons shine.");
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
	        ship_info[6] = string_spacefix(@"Inspired by the 1992 title
	''Advanced Busterhawk Gleylancer'',
	this ship features customisable
	options and a large weapon roster.

	Whether its configurability serves as
	a bane or boon depends on its pilot.");
	        break;
	        }
	    case 4:
	        {
	        global.init_bombs = 2;
	        global.max_bombs = 4;
	        ship_info[0] = spr_trident;
	        ship_info[1] = 2;
	        ship_info[2] = "Trident";
	        ship_info[3] = "Attack = ***";
	        ship_info[4] = "Speed = ****";
	        ship_info[5] = "Coverage = ****";
	        ship_info[6] = string_spacefix(@"A human/crystal technology hybrid 
	designed to provide reasonable 
	coverage with the main shot, while 
	allowing to hone in the shot 
	trajectory for maximum damage.

	The bomb, while powerful, will slow 
	your movement speed. Beware!");
	        break;
	        }
	    case 5:
	        {
	        global.init_bombs = 3;
	        global.max_bombs = 3;
	        if global.arxynespr == 2 then ship_info[0] = spr_arxyneV2
	        else ship_info[0] = spr_arxyne;
	        ship_info[1] = 0;
	        ship_info[2] = "Arxyne";
	        ship_info[3] = "Attack = ***";
	        ship_info[4] = "Speed = ***";
	        ship_info[5] = "Coverage = *****";
	        ship_info[6] = string_spacefix(@"This ship trades speed and focus
	for raw power - it has an 
	powerful lightning gun and homing 
	lasers that can penetrate walls.");
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
	        ship_info[6] = string_spacefix(@"This ship slot is not in use,
	or is otherwise not available.");
	        break;
	        }
	    }
	max_ships = 5;
}
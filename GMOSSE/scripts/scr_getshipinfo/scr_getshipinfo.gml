function scr_getshipinfo(ship_id) {
	max_ships = 5;
	switch ship_id
	    {
	    case 1:
	        {
	        init_bombs = 3; // default bomb count
	        max_bombs = 5; // maximum bombs it can carry
	        ship_info[0] = "Xonochrome"; // name
	        ship_info[1] = "**";
	        ship_info[2] = "*****";
	        ship_info[3] = "*";
	        ship_info[4] = string_spacefix(@"Fast in every sense of the word
	but relies heavily on homing missiles 
	and its haste for coverage of the game 
	screen as the main shot lacks spread.");
	        break;
	        }
	    case 2:
	        {
	        init_bombs = 1;
	        max_bombs = 2;
	        ship_info[0] = "Warbird R2";
	        ship_info[1] = "*****";
	        ship_info[2] = "***";
	        ship_info[3] = "***";
	        ship_info[4] = string_spacefix(@"With a void bomb giving invincibility
	against collisions it can be quite 
	powerful against enemies up close, 
	which is where its weapons shine.");
	        break;
	        }
	    case 3:
	        {
	        init_bombs = 0;
	        max_bombs = 0;
	        ship_info[0] = "Busterhawk";
	        ship_info[1] = "VARIED";
	        ship_info[2] = "VARIED";
	        ship_info[3] = "VARIED";
	        ship_info[4] = string_spacefix(@"Inspired by the 1992 title
	''Advanced Busterhawk Gleylancer'',
	this ship features customisable
	options and a large weapon roster.

	Whether its configurability serves as
	a bane or boon depends on its pilot.");
	        break;
	        }
	    case 4:
	        {
	        init_bombs = 2;
	        max_bombs = 4;
	        ship_info[0] = "Trident";
	        ship_info[1] = "***";
	        ship_info[2] = "****";
	        ship_info[3] = "****";
	        ship_info[4] = string_spacefix(@"A human/crystal technology hybrid 
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
	        init_bombs = 3;
	        max_bombs = 3;
	        ship_info[0] = "Arxyne";
	        ship_info[1] = "***";
	        ship_info[2] = "***";
	        ship_info[3] = "*****";
	        ship_info[4] = "This ship trades speed and focus\nfor raw power - it has an \npowerful lightning gun and homing \nlasers that can penetrate walls.";
	        break;
	        }
	    default:
	        {
			init_bombs = 0;
	        max_bombs = 0;
	        ship_info[0] = "NOT AVAILABLE";
	        ship_info[1] = "----";
	        ship_info[2] = "----";
	        ship_info[3] = "----";
	        ship_info[4] = "This ship slot is not in use,\nor is otherwise not available.";
	        break;
	        }
	    }
	
	ship_spr = scr_shipspr(ship_id);
	ship_index = floor(sprite_get_number(ship_spr)/2);
}
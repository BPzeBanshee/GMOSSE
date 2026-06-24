///@desc Play room track

// Choose song to play based on current room
var choice = -1;
var loop = true;

// if all tracks are loaded, override defaults and pick the array
if LOAD_EVERYTHING
	{
	// will not work in GMRT, bug: https://github.com/YoYoGames/GameMaker-Bugs/issues/14770
	// workaround: string(room) = "ref room x"
	switch room
		{
		// MAIN MENU
		case rm_menu: 
			{
			// Remove the info check and the room check in Room End
			// if you want this track to always play on menu entry
			if global.intro
				{
				choice = snd_intro; 
				loop = false;
				} 
			break;
			}
		
		// SHIP SELECT
		case rm_shipselect: choice = snd_shipselect; break;
	
		// IN-GAME STAGES
		case rm_stage1:
		case rm_boss1: choice = snd_st1; break;
		case rm_stage2:
		case rm_boss2: choice = snd_st2; break;
		case rm_stage3: choice = snd_st3; break;
		}
	if is_array(choice) music = choice;
	//show_debug_message("room: {0}, choice: {1}",string(room),choice);
	}
	
// ...else, kludge loop check for menu...
else 
	{
	choice = music;
	if global.intro loop = false;
	}
	
// ...then play the decided track, or not
if is_array(choice)
	{
	channel = play(music[0],loop);
	show_info(true);
	}
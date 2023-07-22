///@desc Play room track

// Choose song to play based on current room
var choice,loop;
choice = -1;
loop = true;

// if all tracks are loaded, override defaults and pick the array
if LOAD_EVERYTHING
	{
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
	if is_array(choice) then music = choice;
	}
	
// ...else, kludge loop check for menu...
else if room == rm_menu && global.intro then loop = false;
	
// ...then play the decided track, or not
if is_array(choice)
	{
	channel = play(music[0],loop);
	show_info(true);
	}
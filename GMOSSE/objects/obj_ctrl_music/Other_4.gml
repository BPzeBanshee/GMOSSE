///@desc Play room track
// Reset timers
timer = 0;
alpha = 0;

// Choose song to play based on current room
var choice,loop;
choice = -1;
loop = true;
switch room
	{
	// MAIN MENU
	case rm_menu: 
		{
		// Remove the info check and the room check in Room End
		// if you want this track to always play on menu entry
		if info != -1 
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
	
// Play the decided track, or show nothing
if choice != -1 
	{
	music = scr_playmusic(choice,loop);
	scr_setvolmusic(music);
	}
else timer = 360;
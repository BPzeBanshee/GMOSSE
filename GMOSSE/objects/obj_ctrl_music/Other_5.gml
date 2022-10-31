///@desc Stop current tracks, load metadata for next one

// Stop the currently playing track
if room != rm_scores && global.nextroom != rm_scores
    {
    scr_stopallmusic();
    music = -1;
    }
	
// Load metadata for next track (not strictly needed for playing
// but nice to show artist info etc from the INI file)
var music_str = "";
switch global.nextroom
	{
	case rm_menu: if room == rm_init then music_str = "Intro"; break;
	case rm_shipselect: music_str = "Selection"; break;
	case rm_stage1:
	case rm_boss1: music_str = "Stage1"; break;
	case rm_stage2:
	case rm_boss2: music_str = "Stage2"; break;
	case rm_stage3: music_str = "Stage3"; break;
	/*case rm_boss3:*/ 
	case rm_omake1: music_str = "Omake1"; break;
	case rm_omake2: music_str = "Omake2"; break;
	case rm_omake3: music_str = "Omake3"; break;
	}
	
info = -1;
if music_str != "" then info = scr_loadmusicinfo(music_str);
scr_setvolsnd();
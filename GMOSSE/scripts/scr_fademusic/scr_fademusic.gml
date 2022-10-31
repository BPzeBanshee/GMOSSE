/// @description scr_fademusic(fadespeed)
/// @param fadespeed
function scr_fademusic(fadespeed) {
	if instance_exists(obj_ctrl_music)
	then with obj_ctrl_music
		{
		fade_out = true;
		fade_amount = fadespeed;
		}
}
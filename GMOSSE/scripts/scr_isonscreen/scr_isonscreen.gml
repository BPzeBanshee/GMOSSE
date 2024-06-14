function scr_isonscreen() {
	/*
	scr_isonscreen, by BPzeBanshee
	idea nicked from Alluro/JudgeSpear

	What it does:
	Returns true if the x and y position of the object
	calling this script is within the view.

	Usage (example):
	if scr_isonscreen() == false then x += 5;
	*/

	if x > xview-(sprite_width/2) && x < xview+240+(sprite_width/2)
	&& y > yview-(sprite_height/2) && y < yview+320+(sprite_height/2)
		{
		return true;
		} 
	return false;
}

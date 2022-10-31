/// @description scr_max_aa()
function scr_max_aa() {
	/*
	scr_max_aa(), by some dude on GMC forums

	Returns int value based on the antialiasing
	levels supported by the graphics card.
	*/

	if ((display_aa & 8) == 8) then return 3
	else if ((display_aa & 4) == 4) then return 2
	else if ((display_aa & 2) == 2) then return 1
	else return 0;



}

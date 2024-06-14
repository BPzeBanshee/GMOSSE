/// @func scr_max_aa()
/// @desc Returns int value based on the antialiasing levels supported by the graphics card.
function scr_max_aa() {
	// Credit to GMC forums, I'm sorry I lost the URL/user handle
	if ((display_aa & 8) == 8) return 3
	else if ((display_aa & 4) == 4) return 2
	else if ((display_aa & 2) == 2) return 1
	else return 0;
}
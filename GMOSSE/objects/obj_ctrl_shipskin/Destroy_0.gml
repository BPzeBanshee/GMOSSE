///@desc Re-enable Ship select menu
with obj_shipselect 
	{
	disabled = false;
	hook = true;
	scr_getshipinfo(selection);
	}
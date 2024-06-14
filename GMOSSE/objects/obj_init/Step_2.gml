///@desc Transition when ready
if !instance_exists(obj_trans) && instance_exists(obj_ctrl_render)
	{
	if obj_ctrl_render.l_delay == 0 scr_trans(rm_menu,2,c_black,1,1,0);
	}
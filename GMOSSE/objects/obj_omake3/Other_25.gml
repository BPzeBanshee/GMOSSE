///@desc Fade out music upon death
with obj_ctrl_music 
	{
	if !fading_out then fade_out(3000);
	}
instance_destroy();
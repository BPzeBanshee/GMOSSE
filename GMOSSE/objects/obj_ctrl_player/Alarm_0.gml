///@desc Update device count
if gp_count != gamepad_get_device_count()
	{
	gp_count = gamepad_get_device_count();
	trace("updated gp_count to device count of "+string(gp_count));
	}
alarm[0] = 60;
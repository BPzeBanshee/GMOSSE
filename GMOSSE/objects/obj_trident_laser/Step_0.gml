if mode == 0
	{
	if image_xscale < 1 then image_xscale += 0.1;
	}
else
	{
	if image_xscale > 0 then image_xscale -= min(0.1,image_xscale);
	}
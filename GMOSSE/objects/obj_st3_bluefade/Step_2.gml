if on 
	{
	if image_alpha < 1 then image_alpha += 0.0025;
	}
else
	{
	if image_alpha > 0 then image_alpha -= 0.0025 else instance_destroy();
	}
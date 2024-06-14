if on 
	{
	if image_alpha < 1 image_alpha += 0.0025;
	}
else
	{
	if image_alpha > 0 image_alpha -= 0.0025 else instance_destroy();
	}
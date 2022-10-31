if fade_in && !fade_out
	{
	if c > 0
		{
		c -= 2.5;
		fx_set_parameter(fx_tint, "g_TintCol", [1, c/255, c/255, 1]);
		//with obj_wall image_blend = make_color_rgb(255,other.c,other.c);
		with obj_rock image_blend = make_color_rgb(255,other.c,other.c);
		}
	else fade_in = false;
	}
if fade_out && !fade_in
	{
	if c < 255
		{
		c += 2.5;
		fx_set_parameter(fx_tint, "g_TintCol", [1, c/255, c/255, 1]);
		//with obj_wall image_blend = make_color_rgb(255,other.c,other.c);
		with obj_rock image_blend = make_color_rgb(255,other.c,other.c);
		}
	else 
		{
		fade_out = false;
		instance_destroy();
		}
	}
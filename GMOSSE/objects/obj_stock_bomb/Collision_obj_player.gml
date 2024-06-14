with other
	{
	if bombs < max_bombs bombs += 1 else
		{
		myctrl.myscore += 5000;
		var a = instance_create_layer(x,y,layer,obj_popup);
		a.msg = "BONUS\n+5000";
		}
	}
scr_snd_play(snd_click,true);
instance_destroy();
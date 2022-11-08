///@desc GIF recording
if recording_gif
	{
	gif_add_surface(mygif,application_surface,6/100);
	gif_timer += 1;
	if gif_timer == 120
		{
		gif_save(mygif,"recording.gif");
		recording_gif = false;
		gif_timer = 0;
		}
	}
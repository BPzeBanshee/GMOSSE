/// @description  CONTINUE MUSIC 
// Call once to play, call again to stop
if is_array(music)
	{
	if CONTINUE_TOGGLE
	    {
		audio_stop_sound(channel2);
		channel2 = -1;
		music = music2;
		show_info(false);
	    }
	else
	    {
		music2 = music;
		music = snd_continue;
	    channel2 = play(music[0],false);
		show_info(true);
	    }
	}
CONTINUE_TOGGLE = !CONTINUE_TOGGLE;
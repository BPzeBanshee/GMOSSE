/// @description  CONTINUE MUSIC 
// Call once to play, call again to stop
if instance_exists(obj_ctrl_continue)
    {
    stop(channel2);
	channel2 = -1;
	
	music = music2;
	music2 = -1;
	
	show_info(false);
    exit;
    }
else
    {
	music2 = music;
	music = snd_continue;
	if !is_array(music) exit;
    channel2 = play(music[0],false);
	show_info(true);
    }
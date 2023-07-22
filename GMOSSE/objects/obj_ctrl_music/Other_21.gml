///@desc OMAKE 1 THEME
stop();
music = snd_omake1;
if !is_array(music) exit;
channel = play(music[0],true);
show_info(true);
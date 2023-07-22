///@desc OMAKE 3 THEME
stop();
music = snd_omake3;
if !is_array(music) exit;
channel = play(music[0],true);
show_info(true);
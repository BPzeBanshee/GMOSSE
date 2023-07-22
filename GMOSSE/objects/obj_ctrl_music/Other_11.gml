/// @desc BOSS THEME
stop();
music = snd_boss;
if !is_array(music) exit;
channel = play(music[0],true);
show_info(true);
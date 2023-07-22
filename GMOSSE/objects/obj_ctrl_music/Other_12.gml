///@desc STAGE 3B THEME
stop();
music = snd_st3b;
if !is_array(music) exit;
channel = play(music[0],true);
show_info(true);
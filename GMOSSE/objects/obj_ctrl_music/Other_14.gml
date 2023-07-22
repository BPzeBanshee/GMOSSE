/// @desc STAGE CLEAR MUSIC
stop();
music = snd_stageclear;
if !is_array(music) exit;
channel = play(music[0],true);
show_info(true);
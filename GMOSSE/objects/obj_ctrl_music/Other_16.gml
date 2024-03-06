/// @desc GAME OVER MUSIC
stop();
music = snd_gameover;
if !is_array(music) exit;
channel = play(music[0],false);
show_info(true);
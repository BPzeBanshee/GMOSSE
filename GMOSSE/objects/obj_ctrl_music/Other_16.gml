/// @desc GAME OVER MUSIC
stop();
music = snd_gameover;
channel = play(music[0],false);
show_info(true);
gameover = true;
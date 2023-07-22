///@desc OMAKE 2 THEME
// Fun fact: this one actually came first, I just named it omake2 to fit with stage order
stop();
music = snd_omake2;
if !is_array(music) exit;
channel = play(music[0],true);
show_info(true);
if instance_exists(obj_ctrl_gameover)
|| instance_exists(obj_ctrl_clear)
|| !instance_exists(obj_ctrl_music)
|| fade <= 0
then instance_destroy();

fade -= (vol * fade_amount); 
AStreamSetVolume(obj_ctrl_music.music,max(0,fade));
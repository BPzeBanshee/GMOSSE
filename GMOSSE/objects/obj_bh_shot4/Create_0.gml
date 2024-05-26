damage = 12.5;

create_hitspark = function(){
scr_snd_play(snd_exp1,true);
var s;
repeat 5 
	{
	s = scr_basicshot(x,y,layer,obj_bh_shothit,4,irandom(360));
	s.sprite_index = spr_en_thr;
	s.image_speed = 0.6;
	}
}
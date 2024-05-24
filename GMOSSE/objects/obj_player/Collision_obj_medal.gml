if !other.visible then exit;
scr_addscore(other.value,30,0);
var p = instance_create_layer(x,y,global.lay_ctrl,obj_popup);
p.msg = "+"+string(other.value);
p.timeout = 60;
if instance_number(obj_medal) == 1 && global.medalvalue < 29 then global.medalvalue += 1;
scr_snd_play(snd_click,true,false);
instance_destroy(other);
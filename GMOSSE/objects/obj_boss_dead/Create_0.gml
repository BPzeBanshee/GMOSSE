speed = 0;
image_speed = 0.25;

if instance_exists(obj_orb2) then with obj_orb2 instance_destroy();
if instance_exists(obj_orb) then with obj_orb instance_destroy();

// Contra Yagawa Corps Eksploshunz by Michael Bay!
scr_create_exp(obj_explosion,360,18);
scr_snd_play(snd_exp2);
alarm[0] = 20;
if global.omake_enabled
    {
    with obj_ctrl_music stop_all();
    alarm[1] = 90;
    var w = instance_create_layer(x,y,layer,obj_danger);
    w.msg = "|<||_|_3R <|_0\\/\\/|\\| ||\nAPPROACHING";
	
	instance_create_layer(0,0,global.lay_en_ground,obj_bkg_redfade);
    }
timer = 0;
timer = 0; 
scr_create_exp(obj_explosion,360,18); 
scr_playsnd(snd_exp3,1);
if global.omake_enabled
    {
    scr_stopallmusic();
    var w = instance_create_layer(xview,yview,global.lay_ctrl,obj_danger);
    w.msg = "4|\\|71(|-|R1$7 ||\nAPPROACHING";
	instance_create_layer(0,0,global.lay_en_ground,obj_bkg_redfade);
    }
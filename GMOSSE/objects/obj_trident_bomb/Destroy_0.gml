scr_snd_stop(snd_sf_laser);
if instance_exists(laser) then instance_destroy(laser);
parent.reset_speed();
scr_snd_stop(snd_sf_laser);
if instance_exists(laser) instance_destroy(laser);
if instance_exists(parent_id) parent_id.reset_speed();
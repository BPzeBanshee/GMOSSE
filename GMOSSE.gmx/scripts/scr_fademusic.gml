if instance_exists(obj_fade) then exit;
o = instance_create(0,0,obj_fade);
o.fade = argument0;
o.fade_amount = argument1;

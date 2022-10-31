sprite_index = spr_bh_shothit;
if instance_exists(obj_player) 
    {
    if obj_player.weapon = 1
        {
        speed = 6;
        direction += irandom_range(-15,15);
        image_blend = obj_bh_orb.image_blend;
        }
    if obj_player.weapon = 2
        {
        speed = 1;
        image_blend = obj_bh_orb.image_blend;
        }
    if obj_player.weapon = 3
        {
        speed = 5;
        image_blend = obj_bh_orb.image_blend;
        }
    if obj_player.weapon = 4
        {
        speed = 4;
        direction = irandom(360);
        sprite_index = spr_en_thr;
        image_speed = 0.6;
        }
    if obj_player.weapon = 5
        {
        speed = 4;
        direction = irandom(360);
        image_blend = obj_bh_orb.image_blend;
        }
    if obj_player.weapon = 6
        {
        speed = 3;
        direction += irandom_range(-15,15);
        sprite_index = spr_explosion;
        image_xscale = 0.6;
        image_yscale = 0.6;
        image_blend = 5204479;
        }
    if obj_player.weapon = 7
        {
        speed = 3;
        image_blend = obj_bh_orb.image_blend;
        }
    }


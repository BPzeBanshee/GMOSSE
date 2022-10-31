if !can_collide exit;
if other.invincible != 0 exit;
if !instance_exists(obj_player) exit;
if !can_damage exit;
enemyHP -= 100;
/* 4|\|71(|-|R1$7 */
// Compulsory (health, z-handling, etc)
enemyHP = 1250; 
event_inherited();
timeout = enemyHP;
can_damage = 0;

// Enemy behaviour
mode = 0;
timer = 0;
d = 270;

direction = 270;
speed = 6;

with obj_ctrl_music event_user(12);
scr_create_healthbar();

increment_score = function(){
var p = instance_find(obj_player,0);
if instance_exists(p)
	{
	myctrl = p.myctrl;
	scr_addscore(1000,0,0);
	}
}
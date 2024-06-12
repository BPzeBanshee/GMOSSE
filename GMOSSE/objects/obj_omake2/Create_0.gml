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
if instance_number(obj_ctrl_game) > 1
	{
	for (var i=0;i<instance_number(obj_ctrl_game);i++)
		{
		var p = global.player_data[i].myplayer;
		if instance_exists(p)
			{
			myctrl = global.player_data[i].myctrl;
			scr_addscore(1000,0,0);
			}
		}
	}
else
	{
	var p = global.player_data[0].myplayer;
	if instance_exists(p)
		{
		myctrl = global.player_data[0].myctrl;
		scr_addscore(1000,0,0);
		}
	}
}
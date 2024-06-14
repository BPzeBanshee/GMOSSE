enemyHP = 42;
parent_id = noone;
event_inherited();

direction = 270;

fire_weapon = function(mode) {
	var o;
	if mode == 1 o = obj_bullet3 else o = obj_bullet1;
	scr_basicshot(x,y,global.lay_bullets,o,5,direction);
}
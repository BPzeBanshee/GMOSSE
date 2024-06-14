// Calls parent event of same event type
event_inherited();

// Pod positioning (happens regardless of mode)
if !made exit;

var hp = 0;
for (var i=0; i<4; i++)
	{
	if instance_exists(pod[i])
		{
		hp += pod[i].enemyHP;
		pod[i].x = x + lengthdir_x(37,image_angle+45+(90*i));
		pod[i].y = y + lengthdir_y(37,image_angle+45+(90*i));
		pod[i].image_alpha = image_alpha;
		}
	}

enemyHP = hp;
enemyHP_last = enemyHP;
// ^^ sets health ^^
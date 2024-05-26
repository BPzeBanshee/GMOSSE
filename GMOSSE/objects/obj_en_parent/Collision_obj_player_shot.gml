///@desc Weapon Damage
if can_damage
	{
	enemyHP -= other.damage; // subtract health by their damage points
	myctrl = other.myctrl; // identify which player hit them last
	}
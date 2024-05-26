// Menu Vars
selection = global.player_data[global.myside].optiontype;
menu = 1;
hook = true;

// Description Text
chr1 = 0;
text = "";
msg = "";
blend = c_white;
weapon_str = "N/A";
event_user(0);

// Drawing of Sprites
update_weapon = function(choice){
	switch choice
		{
		default: blend = c_white;	weapon_str = "N/A";			break;
		case 1: blend = 16744576;	weapon_str = "Twin Shot";	break;
		case 2: blend = 15724527;	weapon_str = "Laser";		break;
		case 3: blend = 11140992;	weapon_str = "Bound Shot";	break;
		case 4: blend = 1776572;	weapon_str = "Spread Bomb"; break;
		case 5: blend = 4227327;	weapon_str = "Saber";		break;
		case 6: blend = 16776960;	weapon_str = "Burner";		break;
		case 7: blend = 16744703;	weapon_str = "Five-Wave";	break;
		}
	}
update_weapon(global.player_data[global.myside].weapontype);
///@desc Create Orbs

// Decide which pods to make based on option type
optiontype = global.player_data[myctrl.side].optiontype;
switch optiontype
    {
    default: pod_type = obj_bh_type1; break;
    case 2: pod_type = obj_bh_type2; break;
    case 3: pod_type = obj_bh_type3; break;
    case 4: pod_type = obj_bh_type4; break;
    case 5: pod_type = obj_bh_type5; break;
    case 6: pod_type = obj_bh_type6; break;
    case 7: pod_type = obj_bh_type7; break;
    }
	
// Assign blend colour based on weapon type
weapontype = global.player_data[myctrl.side].weapontype;
switch weapontype
    {
    case 1: blend = 16744576; break; // light blue
    case 2: blend = 15724527; break; // light grey
    case 3: blend = 11140992; break; // green
    case 4: blend = 1776572; break; // maroon
    case 5: blend = 4227327; break;// orange
    case 6: blend = 16776960; break; // very light blue 
    case 7: blend = 16744703; break; // pink
    }

// Finally, create the pods
for (var i=0; i<num_options; i++)
	{
	option[i] = instance_create_layer(x,y,layer,pod_type);
	option[i].parent_id = id;
	option[i].myctrl = myctrl;
	option[i].image_blend = blend;
	option[i].direction = 90;
	option[i].position = i+1;
	}
	
made = true;
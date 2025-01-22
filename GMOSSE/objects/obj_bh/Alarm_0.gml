///@desc Create Orbs

// Decide which pods to make based on option type
//optiontype = parent_id.optiontype;
switch optiontype
    {
    default: pod_type = obj_bh_orb_normal; break;
    case 2: pod_type = obj_bh_orb_reverse; break;
    case 3: pod_type = obj_bh_orb_search; break;
    case 4: pod_type = obj_bh_orb_multi; break;
    case 5: pod_type = obj_bh_orb_multi_r; break;
    case 6: pod_type = obj_bh_orb_shadow; break;
    case 7: pod_type = obj_bh_orb_roll; break;
    }
	
// Assign blend colour based on weapon type
//weapontype = parent_id.weapontype;
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
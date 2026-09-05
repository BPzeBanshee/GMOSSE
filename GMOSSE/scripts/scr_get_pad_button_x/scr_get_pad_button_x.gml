// ============================================================
// scr_get_pad_button_name(btn)
// by EddyMRA
// ============================================================
///@desc Display name for a gamepad button index.
///@param {String} btn
///@returns {String}
function scr_get_pad_button_name(btn)
    {
    switch btn
        {
        case gp_face1:      return "A/CROSS";
        case gp_face2:      return "B/CIRCLE";
        case gp_face3:      return "X/SQUARE";
        case gp_face4:      return "Y/TRIANGLE";
        case gp_shoulderl:  return "LB";
        case gp_shoulderr:  return "RB";
        case gp_shoulderlb: return "LT";
        case gp_shoulderrb: return "RT";
        case gp_select:     return "SELECT";
        case gp_start:      return "START";
        case gp_stickl:     return "L3";
        case gp_stickr:     return "R3";
        case gp_padu:       return "D-UP";
        case gp_padd:       return "D-DOWN";
        case gp_padl:       return "D-LEFT";
        case gp_padr:       return "D-RIGHT";
		case gp_paddlel:	return "L4";
		case gp_paddler:	return "R4";
		case gp_paddlelb:	return "L5";
		case gp_paddlerb:	return "R5";
        default:
            if btn < 0 then return "---";
            return "BTN" + string(btn);
        }
    }
	
function scr_get_pad_button_spr(btn)
	{
	// TODO: console
	
	// 
	switch btn
		{
		case gp_face1:      return 0;
	    case gp_face2:      return 1;
	    case gp_face3:      return 2;
	    case gp_face4:      return 3;
	    case gp_shoulderl:  return 4;
	    case gp_shoulderr:  return 5;
	    case gp_shoulderlb: return 6;
	    case gp_shoulderrb: return 7;
	    case gp_select:     return 8;
	    case gp_start:      return 9;
	    case gp_stickl:     return 10;
	    case gp_stickr:     return 11;
	    case gp_padu:       return 12;
	    case gp_padd:       return 13;
	    case gp_padl:       return 14;
	    case gp_padr:       return 15;
		case gp_paddlel:	return 16;
		case gp_paddler:	return 17;
		case gp_paddlelb:	return 18;
		case gp_paddlerb:	return 19;
        default:
            //if btn < 0 then return "---";
            return -1;
        }
	}
// ============================================================
// scr_get_key_name(kc)
// Display name for a keyboard keycode, distinguishing L/R
// Shift/Control/Alt and numpad keys per side.
// ============================================================
///@desc Display name for a keyboard keycode, distinguishing L/R
///@desc Shift/Control/Alt and numpad keys per side.
///@param {Real}
function scr_get_key_name(kc)
    {
    switch kc
        {
        case vk_lshift:    return "LSHIFT";
        case vk_rshift:    return "RSHIFT";
        case vk_lcontrol:  return "LCTRL";
        case vk_rcontrol:  return "RCTRL";
        case vk_lalt:      return "LALT";
        case vk_ralt:      return "RALT";
        case vk_shift:     return "SHIFT";   // fallback, shouldn't normally be captured
        case vk_control:   return "CTRL";    // fallback, shouldn't normally be captured
        case vk_alt:       return "ALT";     // fallback, shouldn't normally be captured

        case vk_numpad0:   return "NUM0";
        case vk_numpad1:   return "NUM1";
        case vk_numpad2:   return "NUM2";
        case vk_numpad3:   return "NUM3";
        case vk_numpad4:   return "NUM4";
        case vk_numpad5:   return "NUM5";
        case vk_numpad6:   return "NUM6";
        case vk_numpad7:   return "NUM7";
        case vk_numpad8:   return "NUM8";
        case vk_numpad9:   return "NUM9";
        case vk_add:       return "NUM+";
        case vk_subtract:  return "NUM-";
        case vk_multiply:  return "NUM*";
        case vk_divide:    return "NUM/";
        case vk_decimal:   return "NUM.";

        case vk_enter:     return "ENTER";
        case vk_space:     return "SPACE";
        case vk_escape:    return "ESC";
        case vk_tab:       return "TAB";
        case vk_backspace: return "BKSP";
        case vk_up:        return "U-ARROW";
        case vk_down:      return "D-ARROW";
        case vk_left:      return "L-ARROW";
        case vk_right:     return "R-ARROW";
        case vk_pageup:    return "PGUP";
        case vk_pagedown:  return "PGDN";
        case vk_home:      return "HOME";
        case vk_end:       return "END";
        case vk_insert:    return "INS";
        case vk_delete:    return "DEL";

        default:
            if kc >= vk_f1 && kc <= vk_f12 then return "F" + string(kc - vk_f1 + 1);
            if kc >= ord("0") && kc <= ord("9") then return chr(kc);
            if kc >= ord("A") && kc <= ord("Z") then return chr(kc);
            if kc == 0 then return "---";
            return "KEY" + string(kc);
        }
    }
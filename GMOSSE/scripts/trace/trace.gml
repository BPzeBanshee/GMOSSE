/// @description trace(str)
/// @param str {String}
function trace(str) {
	var s = string(str); // string itself

	if os_browser == browser_not_a_browser
	    {
		var ss = string(object_get_name(object_index))+": "+string(s);
	    debug_event(ss);
		show_debug_message(ss);
	    return 0;
	    }
	else
	    {
	    global.debug_text += string(s) + "\n";
	    with obj_debug event_user(1);
	    return 0;
	    }
	}
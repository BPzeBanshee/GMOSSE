///trace(str)
var s;
s = string(argument0); // string itself

if os_browser = browser_not_a_browser
    {
    debug_event(string(object_get_name(object_index))+": "+string(s));
    return 0;
    }
else
    {
    global.debug_text += string(s) + "#";
    with obj_debug event_user(1);
    return 0;
    }

///string_spacefix(str)
/*
string_spacefix, by BPzeBanshee

Purpose: uses string_replace_all to allow
strings formatted with ENTER presses
to use # instead, fixing the doublespacing
issue/behaviour in GM:Studio.

Usage: mystr = string_spacefix(str);
*/

return string_replace_all(argument0,"
","#");

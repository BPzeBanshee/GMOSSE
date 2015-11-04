/*
scr_setdisplay(aa,vsync)
by BPzeBanshee

Safely measures antialiasing values to use and applies them
as well as the vsync function.
*/
var set_aa;
if argument0 = 0 then set_aa = 0;
if argument0 = 1
    {
    if ((display_aa & 2) == 2) then set_aa = 2
    else show_message("2xAA unsupported by your card");
    return -1;
    }
if argument0 = 2
    {
    if ((display_aa & 4) == 4) then set_aa = 4
    else show_message("4xAA unsupported by your card");
    return -1;
    }
if argument0 = 3
    {
    if ((display_aa & 8) == 8) then set_aa = 8
    else show_message("8xAA unsupported by your card");
    return -1;
    }
display_reset(set_aa,argument1);
return 0;

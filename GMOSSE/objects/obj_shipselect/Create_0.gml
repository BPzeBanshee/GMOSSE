// Control variables
selection = global.shipselect[global.myside];
hook = 1;
chr1 = 0;
text = "";
disabled = false;

// Ship metadata (aside from some globalvars not strictly needed)
max_ships = 5;
ship_spr = -1;
ship_index = 0;
scr_getshipinfo(selection);
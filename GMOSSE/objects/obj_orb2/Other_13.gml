/// @desc Attack Phase 3: Timeout behaviour
// This is forced by boss1 when boss1's timeout value hits 0.
scr_turntoangle(90,5);
if y < yview-(sprite_height/2) instance_destroy();
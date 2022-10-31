/*
Attack Phase 3: Timeout behaviour

Basically it slows down to minimum speed,
adjusts angle to point up and leaves.
*/
if speed > 5 then speed -= 1;
scr_turntoangle(90,5);
if y < (yview-sprite_height/2) then instance_destroy();
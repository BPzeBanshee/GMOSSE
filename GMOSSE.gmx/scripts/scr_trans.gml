///scr_trans(room,type,color/sprite,in_speed,out_speed,delay)
/* 
scr_trans, by BPzeBanshee

Usage: scr_trans(room,mode,sprite/color,animspeed,delayatend);

Returns: none
Arguments:
- input_room = the room to transition to
- mode = what kind of transition (animated sprite or plain colour)
- sprite/color = self-explanatory (depends on mode)
- speed = animated sprite speed/alpha increase-decrease speed
- delayatend = amount of frames to wait until going to next room
*/
if instance_exists(obj_trans) then exit;
t = instance_create(xview,yview,obj_trans);
t.input_room = argument0;
t.input_mode = argument1;
t.input_sprite = argument2;
t.input_speed1 = argument3;
t.input_speed2 = argument4;
t.input_delay = argument5;
global.nextroom = t.input_room;

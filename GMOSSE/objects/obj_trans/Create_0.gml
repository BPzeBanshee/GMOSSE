timer = 0;
draw_timer = 0;
mode = 0;
alpha = 0;

input_mode = 0;
input_color = c_white;
input_sprite = sprite_index;
input_speed1 = 1;
input_speed2 = 1;
input_delay = 0;
input_room = room;

global.levelend = true;

go_when_ready = function(){
if timer > input_delay 
    {
    if global.paused then scr_unpause();
    room_goto(input_room);
    global.levelend = false;
    }
}
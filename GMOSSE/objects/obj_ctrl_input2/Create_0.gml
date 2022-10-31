/*
obj_ctrl_input2, by BPze

Experimental modified input controller that allows
for input replays and recordings.

26-11-18
Despite my best efforts, I can't get this thing to
consistently work. Sometimes the replays are fine,
sometimes the replay ends at the same place but
the score is different, sometimes the player dies
long before getting to the end. The only clue I've
figured out with this is that the files themselves
once recorded play back the same way every time, even
if it's wrong to what was supposed to have been recorded.

It may be that GM's internal behaviour
just won't allow for consistent playback of inputs due
to use of floating doubles, or it might be something I'm
doing wrong that I haven't seen. Either which way I've tried
this and spent great effort at least twice over the years
of GMOSSE's life and I'm sick of it not working and sick of
rewriting from scratch, so this is relegated to the EXPERIMENTAL
folder until somebody figures it out.
*/

event_inherited();

// binary compare values
l_inp_up = 1;
l_inp_down = 2;
l_inp_left = 4;
l_inp_right = 8;
l_inp_b1 = 16;
l_inp_b2 = 32;
l_inp_b3 = 64;

l_step = 0;
l_input_value = 0;
stagenum = 0;
log_str = "";
recording = 0;
replaying = 0;

// initialise replay grid and input list
replay = ds_grid_create(10,6); // # array, grid large enough for 10 stages
// replay = ds_grid_create(room_last,6); // if we want to have replays for even main menu
ds_grid_clear(replay,0);
input = ds_list_create(); // | array which will have current_input saved into each "frame"

/*
The replay file system format I've devised works as follows:

replay[#0,y]
0,0 = version number (real) (todo: temporarily saving score here for debugging)
0,1 = starting stage (string, room_get_name(room) saved)
0,2 = player-specific globalvars (todo: get rid of those globalvars somehow)
0,3 = player-specific globalvars
0,4 = player-specific globalvars
0,5 = player-specific globalvars

example: 
s = asset_get_index(replay[#0,1]) for starting stage

replay[#x,y]
x = stage (eventually use something like global.level, for now we just use a counter)

x,0 = input array saved via ds_list_write
x,1 = random seed taken from room start
x,2 = ship id (1>)
x,3 = lives remaining
x,4 = current score
x,5 = current bomb stock
*/
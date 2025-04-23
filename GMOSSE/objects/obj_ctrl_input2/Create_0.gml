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
recording = false;
replaying = false;

// initialise replay grid and input list
replay = ds_grid_create(10,6); // # array, grid large enough for 10 stages
ds_grid_clear(replay,0);
input = ds_list_create(); // | array which will have current_input saved into each "frame"

// FUNCTIONS
load_replay = function(){
var l = get_open_filename("*.inp","replay.inp");
if l == "" exit;
replay = scr_replay_load(replay,l);
show_message("Replay file version (max score): "+string(replay[# 0,0])+"\n Starting stage: "+string(replay[# 0,1]));
var n = asset_get_index(replay[# 0,1]);
if room_exists(n) global.startstage = n;
}

save_replay = function(){
var l = get_save_filename("*.inp","replay.inp");
if l == "" l = "replay.inp";

scr_replay_save(replay,l);

ds_grid_clear(replay,0);
ds_list_clear(input);
stagenum = 0;
}

/*
EDIT 24/4/25: Not a fan of ds_*, thinking JSON+structs will be a more human-debuggable approach.
Security can come after confirming the replays actually *work* consistently in principle.

The ds_map-based  replay file system format I originall devised works as follows:

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

/*input = [];
repeat 256 array_push(input,irandom(256));
replay = {
	gamedata: {
		version: 1,
		start_stage: "rm_stage1",
		name: "RPY",
		ship: 1,
		side: 0,
		high_score: 123456789
		},
	stage1: {
		input_list: input,
		rng_seed: -1,
		score: 0,
		medals: 0,
		bombs: 3,
		lives: 3,
		option_type: 1,
		weapon_type: 1
		}
	}
var r = json_stringify(replay,true);
var f = file_text_open_write("replay.json");
file_text_write_string(f,r);
file_text_close(f);*/
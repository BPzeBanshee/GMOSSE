///scr_loadmusic(ini_section)
/* 
scr_loadmusic(), by BPzeBanshee

Usage: scr_loadmusic(argument0,argument1)
argument0 = the ini file
argument1 = the ini section to check for
*/
if !instance_exists(obj_ctrl_music) then exit;

// This part assumes the ini works
ini_open(global.music_ini);
global.music_info[1] = ini_read_string(argument0,"Path","NONE"); // file location
global.music_info[2] = ini_read_real(argument0,"Volume",100); // reads volume
global.music_info[3] = real(ini_read_string(argument0,"LoopStart","0")); // reads start of loop
global.music_info[4] = real(ini_read_string(argument0,"LoopEnd","1")); // reads end of loop
ini_close();

// quit early if no file to load
if global.music_info[1] = "NONE" return -1; 

// everything that's required is sorted, load and configure
var m,a,b;
m = ASourceLoad(global.music_info[1]);
if m < 0 // Error check
    {
    scr_console("Error loading "+string(global.music_info[1]));
    with obj_ctrl_filter alarm[1] = 1; // return to whatever fullscreen it was before
    return -2;
    }
    
// Set loop points
a = ASourceGetLength(m)*global.music_info[3];
b = ASourceGetLength(m)*global.music_info[4];
if a > 0 || b < 1 then ASourceAddLoopPoint(m,a,b,-1);

return m;

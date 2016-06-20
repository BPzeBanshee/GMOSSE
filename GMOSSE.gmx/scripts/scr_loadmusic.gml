/* 
scr_loadmusic(), by BPzeBanshee

Usage: scr_loadmusic(argument0,argument1)
argument0 = the ini section to check for
argument1 = the group number (default 1)
*/

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
if m < 0
    {
    show_message("Error loading "+string(global.music_info[1]));
    return -2;
    }
a = ASourceGetLength(m)*global.music_info[3];
b = ASourceGetLength(m)*global.music_info[4];
if a > 0 || b < 1 then ASourceAddLoopPoint(m,a,b,-1);
//FMODSoundSetMaxVolume(music,(global.music_info[2]/100));
return m;

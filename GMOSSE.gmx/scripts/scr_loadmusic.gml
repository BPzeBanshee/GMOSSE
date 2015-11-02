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
global.music_info[3] = ini_read_real(argument0,"LoopStart",0); // reads start of loop
global.music_info[4] = ini_read_real(argument0,"LoopEnd",1); // reads end of loop
ini_close();

// quit early if no file to load
if global.music_info[1] = "NONE" return -1; 

// everything that's required is sorted, load and configure
var music;
music = FMODSoundAdd(global.music_info[1],0,1);
if music = 0 then show_message("Error loading "+string(global.music_info[1]));
FMODSoundSetMaxVolume(music,(global.music_info[2]/100));
FMODSoundSetLoopPoints(music,global.music_info[3],global.music_info[4]);
if argument1 > 0 then FMODSoundSetGroup(music,argument1);
return music;

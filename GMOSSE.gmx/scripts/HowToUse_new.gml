#define HowToUse_new

var t;
t = "

Go here for details
Forum: http://gmc.yoyogames.com/index.php?showtopic=333705
GMFMODSimple v4.28 
Using 
FMOD Sound System, copyright ? Firelight Technologies Pty, Ltd., 1994-2007.
FMOD Ex API version: 4.28 
"


///////////////////////////////////////////////////////////
//Copy these code snippets to the right spots in your game

//////////////////////
//Simple setup
//On Game Start
LoadFMOD();
FMODinit(100,0);
//using a password
//FMODSetPassword("password");


//To load sounds
//game background music
global.bkMusic = FMODSoundAdd("bkmusic.mid",0,0);
FMODSoundSetGroup(global.bkMusic,3);
//To set the volume to 80%
FMODSoundSetMaxVolume(global.bkMusic,.8);

//To load a special effect
global.gunshot = FMODSoundAdd("gunshot.wav",0,0);
FMODSoundSetGroup(global.gunshot,2);

//On Room Start
FMODSoundLoop(global.bkMusic,0);

//On Sound Controller end Step
FMODUpdate();

//On Player Fire Gun
FMODSoundPlay(global.gunshot,0);

//On room end
FMODAllStop();

//On Game End
//to free the sounds
FMODSoundFree(global.bkMusic);
FMODSoundFree(global.gunshot);
//to free the system
FMODfree();
UnloadFMOD();
//Simple setup end
////////////////////////


//////////////////////
//3d setup
//On game start
LoadFMOD();
FMODinit(100,0);
//using a password
//FMODSetPassword("password");


//To load sounds
//game background music
global.bkMusic = FMODSoundAdd("bkmusic.mid",0,0);
FMODSoundSetGroup(global.bkMusic,3);
//To set the volume to 80%
FMODSoundSetMaxVolume(global.bkMusic,.8);

//To load a special effect
global.gunshot = FMODSoundAdd("gunshot.wav",true,0);
FMODSoundSetGroup(global.gunshot,2);
//to set it's 3d settings
FMODSoundSet3dMinMaxDistance(global.gunshot, 200,600);

//To load a ambient effect
global.enemygrunt = FMODSoundAdd("enemygrunting.wav",true,0);
FMODSoundSetGroup(global.enemygrunt,4);
//to set it's 3d settings
FMODSoundSet3dMinMaxDistance(global.enemygrunt,100,400);


//On Room Start
FMODSoundLoop(global.bkMusic,0);

//On Player Fire Gun
FMODSoundPlay3d(global.gunshot,x,y,0,0);
//On Player end step
FMODListenerSet3dPosition(1,x,y,0);

//On Sound Controller end Step
FMODUpdate();

//On enemy create
instance = FMODSoundLoop3d(global.enemygrunt,x,y,0,0);
//on enemy end step
FMODInstanceSet3dPosition(instance,x,y,0)
//On Enemy Fire Gun
FMODSoundPlay3d(global.gunshot,x,y,0,0);


//On room end
FMODAllStop();

//On Game End
//to free the sounds
FMODSoundFree(global.bkMusic);
FMODSoundFree(global.enemygrunt);
FMODSoundFree(global.gunshot);
//to free the system
FMODfree();
UnloadFMOD();
//3d setup end
////////////////////////

//////////////////////////////
//To quickly play a file in an object without having it loaded on game start
//on create
sound = 0;
instance = 0;
alarm[0] = 1;

//on alarm[0]
sound = FMODSoundAdd("music.mid",0,0);
FMODSoundSetGroup(sound,3);
instance = FMODSoundLoop(sound,0);


//on room end
instance_destroy();

//on instance destroy
FMODInstanceStop(instance);
FMODSoundFree(sound);
//////////////////////////////
//////////////////////////////

//////////////////////////////
//To quickly play random files in an object without having it loaded on game start
//on create
sound = 0;
instance = 0;
alarm[0] = 1;

//on alarm[0]
if(!FMODInstanceIsPlaying(instance)) //The system is smart enough to handle 0
{
    FMODInstanceStop(instance);
    FMODSoundFree(sound);
    sound = FMODSoundAdd(choose("music1.mid","music2.mid","music3.mid","music4.mid"),0,0);
    FMODSoundSetGroup(sound,3);
    instance = FMODSoundPlay(sound,0);
}

alarm[0] = room_speed;

//on room end
instance_destroy();

//on instance destroy
FMODInstanceStop(instance);
FMODSoundFree(sound);
//////////////////////////////
//////////////////////////////


//////////////////////////////
//To quickly play a file in a moving object without having it loaded on game start
//Recommended for MIDIs or streamed files
/*
//on create
sound = 0;
instance = 0;
alarm[0] = 1;
path_start(path0,3,3,true);
*/
//on alarm[0]
//sound = FMODSoundAdd("music.mid",true,false /* or true if large mp3*/);
//It's really like a moving boombox or a talking character, so ambient effect group could be used
/*
FMODSoundSetGroup(sound,4);
FMODSoundSet3dMinMaxDistance(sound,100,300);
instance = FMODSoundLoop3d(sound,x,y,0,0);

//on end step
FMODInstanceSet3dPosition(instance,x,y,0);
//With the player or controler object
//calling FMODUpdate3dPositions(); 
//once every step, this should work fine


//on room end
instance_destroy();

//on instance destroy
FMODInstanceStop(instance);
FMODSoundFree(sound);
//////////////////////////////
//////////////////////////////


/////////////////////////
/////////////////////////
//Example web music

//On Game Start
LoadFMOD();
FMODinit(100,true);

//To load sounds
//game background music
global.bkMusic = FMODSoundAdd("http://thewebsite/thewebfileofmusicprovider",false,true);
FMODSoundSetGroup(global.bkMusic,3);
//To set the volume to 80%
FMODSoundSetMaxVolume(global.bkMusic,.8);

//On Player Fire Gun
FMODSoundPlay(global.bkMusic,0);

//On room end
FMODAllStop();

//On Game End
//to free the sounds
FMODSoundFree(global.bkMusic);
//to free the system
FMODfree();
UnloadFMOD();
//web setup end
////////////////////////


//////////
//Example instance saving code script
//Play3dEcono
//Must be called by object making the noise
//You mus set the playerobject to your object
with(PlayerObj)
{
    if(point_distance(x,y,other.x,other.x) < FMODSoundGetMaxDist(argument0))
    {
        FMODSoundPlay3d(argument0,other.x,other.y,0,0);
    }
}
///////////////////
/////////////////
*/

#define Known_Problems_and_Questions_new
var t;
t = "
Question-In the demo, something is off with to police siren, it clips out or something
Answer-I used the same code as in the regular horn beep. The police beeps the horn to play
       the siren. That is why it stops when it's done and no other cars are in front of the 
       police car to make it beep again. I could have used a loop sound there, I know.
       
Problem-In the demo, the fps really drops when I press space to show the information
Reason-The functions to draw the spectrum and wave data use line draw and that cost a lot of stress
      -Getting data from the master group and other group takes time to analyse. You would not
       normally use those in a game.
      -I have reduced the amount of data fetched for the groups
      -However, I have increased to number of data for the instance and used the slowest
      -more accurate method to demonstrated the method so expect a drop when over an instance       

Problem-I don't get it... Why are new sounds instances cutting out old ones??? I set the stream to false. What give?
        It was not like this in Demo 1.
Reason-I have discovered an instanciating bug in FMOD that would cause the system to go unstable intanciating
        the same (unstreamed) sound many times. I have reported this problem to the FMOD developers and hard coded 
        the streamed flag to true to resolve this temporary issue. So, for the time being, multiple instances 
        of the same sound will stop the other playing sound. I hope to resolve this soon.
      -<solved>

Question-How come demo1 showed the sounds information of the cars and demo2 does not?
Answer-Because I was testing other things and had to remove the feature. However, you can
       still add a sound to a car, it will play it with information and you will not loose
       the engine sound. Kinda like having a teen playing his radio full blast, funny with the doppler on.
       
Problem-My sound volume does not seem to work propely. I set it to .1 but it's still too loud
Solution-For volumes to work right you must put the sound in a group. This bug affects 3d Sounds
        -Sometimes Master is refered to as group 0... Master in not really a group the reference
            in some function of master as group 0 is only to simplify the interface. Sounds not
            set to a group will go in the master 'virtual group' by default and that can cause
            the problem.
        -<issue solved> inform me if you still experience it.

Problem-I used Play/LoopSound or Play/LoopSound3d but the sound does not play
Solution-You created a 3d sound and tried to play it in 2d
        -You created a 2d sound and are trying to play in 3d
        -One or more of your volumes are to low sound volume, instance volume, group volume or global volume
        -You set the MinMax values improperly in you 3d sound (too small)
        -You have 3d sounds but no listener... That is FMODListenerSet3dPosition and FMODUpdatePosition
             have not been called yet.
        -Your sound is password protected and you forgot to set the password
        -<3d/2d mismatch issue solved> I added a message box to inform of the mismatch so you can resolve it faster

Problem-My 3dsounds dont seem to work. My player moves but the sounds dont play or stay at the same when I play
Solution-You forgot to add FMODListenerSet3dPosition in the player end step
        -You forgot to call FMODUpdate3dPositions once a step in a controler object
        -You did not use 3d sound
        -Your sound is password protected and you forgot to set the password
        -<3d/2d mismatch issue solved> I added a message box to inform of the mismatch so you can resolve it faster


Problem-Some of my sounds are not playing when I have a lot of objects with sounds (3d) in the room
Solution-Set the sound to a higher prority group
        -Boost the num sounds in FMODinit()
        -(*Recomended) Dont play the sound if it not close enough to the listener. You would need to
              keep track of the max value of the MinMaxDistance. EG for the demo I have.
              if(point_distance(PCarObj.x,PCarObj.y,x,y)<= _max)
              {
                   FMODSoundPlay3d(sound,x,y,0);
              }
        -Your sound is password protected and you forgot to set the password
        
Problem-My 3dsounds dont seem to work. Sounds moves with my objects but they stay the same when I play
Solution-You forgot to add FMODInstanceSet3dPosition in the object and you sound is a loop 3d sound
        -You forgot to call FMODUpdate3dPositions once a step in a controler object

Problem-My sound stops when I play it at 2 positions in the room
Solution-The sound is streamed. Read the FMODSoundAdd() comments in the script

Problem-My doppler effect it too much
Solution-Reduce the world scale FMODSetWorldScale (affects all) or set the sound's individual doppler setting 
             using FMODSoundSet3dDopplerMax

Problem-My game stops responding or I get an unxepected error when I quit the game or restart a room or restart a game
Solution-Make sure you dont free a sound that is playing or is invalid (already freed but not 0)

Problem-When I restart a room or a game the old sounds are still playing
Solution-You did not reset the system. Use the included SoundControler.

Proplem-I get an unexpected error in the game, quiting/changing room
Answer-you are freeing a sound that was freed beforehand

Problem-My game is getting slower and slower
Solution-You set the number of concurent sounds in FMODinit() too high and have too many sounds playing
        -You added a lot of sounds on the fly but never freed them
        -You have too many large sounds and you did not use the streaming option
        -Your laptop is in energy saver mode
        
Problem-My game pauses once in a while
Reason-You set the number of concurent sounds in FMODinit() too low and have too many 3d sounds playing
         so they are fighting to play.
         
Problem-I get a message about hardware acceleration...
Solution-You set the acceleration slider (In windows) to decrease performance and increase compatibility
            some people do this if they have a bad video card on older PC and XP
        -Your laptop is in power saver mode

Problem-Some functions don't work or something and I dont know why
Solution-Use show_message(FMODErrorStr(FMODGetLastError())); right after the call to see what the problem is

Question-Does your DLL leak? does not free memory?
Answer-Only if you let it, that is you dont free your sounds. Other than that, I'm pretty confident 
         I thought of everything

Question-Is it possible I can make the game crash using this dll
Answer-The only place that could happen is if you free a sound without checking
         if it's being played. It's hard to check for multiple instances of a sound
         In any case, if you stop everything when you leave a room and free the sounds
         after that, you should be fine. If you quit the game, the memory is freed
         by windows anyway. To top it off, FMOD is well implemented so it should be rare.
         One technique you can use is create your global sounds in your start game event
         like in the menu room and free them when the game quits or let windows handle it. 
         Followed by the room specific sounds when sounds used in a room are created on
         room start and stopped and freed on room end 
         Followed by the object specific sound where you can create your sound on
         room start or create (I use an alarm to make sure I dont do do it before the system
         is initialised) of an object and stop and free the sound on room end and destroy
         of the object.

Question-Why can I change the pitch of groups but not the pitch of an instance??
Answer-The feature is not included in FMOD, Use the FMODInstanceSetFrequency

Question-Why can't I get the group frequency?
Answer-The feature is not include in FMOD.
      -Use pitch. It's safer.

Question-Why does the demo goes slow when I press space to show the details
           while I have many objects visible on the screen?
Answer-In order to get the exact information on everything, I do a lot of calls
         to the dll, you would not normally do all these calls in a game
      -I also draw a lot of text and use GM drawing functions to show information
         and that causes a lot of stress on the CPU.

Question-Why dont I get doppler or realistic (stereo) sound position when I have 
          many listeners
Question-Because it would be confusing to the players to hear the other player's
          doppler or realistic position relative sound

Problem-3d sounds dont seem the pan left and right according to my settings?
Answer-You are correct. 3d sound have their pan relative to their position and listener.
       Even if you set the hear distance only, the 3d system still has a hold on the pan.
        
Problem-My password protected sound does not sound right or does not play
Cause(Not Playing)-You forgot to set the password when you loaded the sound in SoundAdd()
Cause(Not Playing)-You used the wrong password
Cause(Not Playing)-The file format use does not 'protect' properly (notify me of the format)
Cause(Weird Noises)-You set the stream option in SoundAdd on an mp3... you should not.
                   -<solved> notify me if you still have proplems with protected streamed mp3
Cause(Not Playing)-You initialised the system to play web music.

"

#define LoadFMOD_new
//Call this when the game starts to create the dll interface
//returns nothing... GM will stop if the dll could not be linked

//NOTE: You must have GMFMODSimple.dll and fmodex.dll in your game directory

//Example call
//When the game starts
//LoadFMOD();
if !file_exists('GMFMODSimple.dll') show_debug_message("File not found: GMFMODSimple.dll#In directory: " + working_directory);

var WTF;
WTF = true;
//export double FMODfree(void)
global.dll_FMODfree=external_define("GMFMODSimple.dll","FMODfree",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODfree")
//export double FMODinit(double maxsounds, supportwebmusic)
global.dll_FMODinit=external_define("GMFMODSimple.dll","FMODinit",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODinit")
//export double FMODSoundSetEffects(double sound, double effects)
global.dll_FMODSoundSetEffects=external_define("GMFMODSimple.dll","FMODSoundSetEffects",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSetEffects")
//export double FMODSoundSetGroup(double sound, double group)
global.dll_FMODSoundSetGroup=external_define("GMFMODSimple.dll","FMODSoundSetGroup",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSetGroup")
//export double FMODGroupSetVolume(double group, double volume)
global.dll_FMODGroupSetVolume=external_define("GMFMODSimple.dll","FMODGroupSetVolume",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupSetVolume")
//export double FMODSoundSetMaxVolume(double sound, double volume)
global.dll_FMODSoundSetMaxVolume=external_define("GMFMODSimple.dll","FMODSoundSetMaxVolume",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSetMaxVolume")
//export double FMODSoundLoop(double sound,paused)
global.dll_FMODSoundLoop=external_define("GMFMODSimple.dll","FMODSoundLoop",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundLoop")
//export double FMODSoundPlay(double sound,paused)
global.dll_FMODSoundPlay=external_define("GMFMODSimple.dll","FMODSoundPlay",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundPlay")
//export double FMODSoundLoop3d(double sound, double x, double y, double z,paused)
global.dll_FMODSoundLoop3d=external_define("GMFMODSimple.dll","FMODSoundLoop3d",dll_cdecl,ty_real,5,ty_real,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundLoop3d")
//export double FMODSoundPlay3d(double sound, double x, double y, double z,paused)
global.dll_FMODSoundPlay3d=external_define("GMFMODSimple.dll","FMODSoundPlay3d",dll_cdecl,ty_real,5,ty_real,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundPlay3d")
//export double FMODInstanceSet3dPosition(double channel,double x,double y,double z)
global.dll_FMODInstanceSet3dPosition=external_define("GMFMODSimple.dll","FMODInstanceSet3dPosition",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSet3dPosition")

//export double FMODSoundAdd(LPCSTR soundfile, double threed, double streamed)
global.dll_FMODSoundAdd=external_define("GMFMODSimple.dll","FMODSoundAdd",dll_cdecl,ty_real,3,ty_string,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundAdd")


//export double FMODMasterSetVolume(double volume)
global.dll_FMODMasterSetVolume=external_define("GMFMODSimple.dll","FMODMasterSetVolume",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODMasterSetVolume")
//export double FMODListenerSetNumber(double number)
global.dll_FMODListenerSetNumber=external_define("GMFMODSimple.dll","FMODListenerSetNumber",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODListenerSetNumber")
//export double FMODListenerSet3dPosition(double number, double x, double y, double z)
global.dll_FMODListenerSet3dPosition=external_define("GMFMODSimple.dll","FMODListenerSet3dPosition",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODListenerSet3dPosition")
//export double FMODSetWorldScale(double scale)
global.dll_FMODSetWorldScale=external_define("GMFMODSimple.dll","FMODSetWorldScale",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSetWorldScale")
//export double FMODSoundSet3dMinMaxDistance(double sound, double Min, double Max)
global.dll_FMODSoundSet3dMinMaxDistance=external_define("GMFMODSimple.dll","FMODSoundSet3dMinMaxDistance",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSet3dMinMaxDistance")
//export double FMODUpdate()
global.dll_FMODUpdate=external_define("GMFMODSimple.dll","FMODUpdate",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODUpdate")
//export double FMODSoundFree(double sound)
global.dll_FMODSoundFree=external_define("GMFMODSimple.dll","FMODSoundFree",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundFree")
//export double FMODGroupStop(double group)
global.dll_FMODGroupStop=external_define("GMFMODSimple.dll","FMODGroupStop",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupStop")
//export double FMODAllStop()
global.dll_FMODAllStop=external_define("GMFMODSimple.dll","FMODAllStop",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODAllStop")
//export double FMODInstanceStop(double instance)
global.dll_FMODInstanceStop=external_define("GMFMODSimple.dll","FMODInstanceStop",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceStop")
//export double FMODInstanceIsPlaying(double instance)
global.dll_FMODInstanceIsPlaying=external_define("GMFMODSimple.dll","FMODInstanceIsPlaying",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceIsPlaying")
//export double FMODGroupSetMuted(double group, double mute)
global.dll_FMODGroupSetMuted=external_define("GMFMODSimple.dll","FMODGroupSetMuted",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupSetMuted")
//export double FMODInstanceSetMuted(double instance, double mute)
global.dll_FMODInstanceSetMuted=external_define("GMFMODSimple.dll","FMODInstanceSetMuted",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetMuted")
//export double FMODInstanceSetVolume(double instance, double volume)
global.dll_FMODInstanceSetVolume=external_define("GMFMODSimple.dll","FMODInstanceSetVolume",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetVolume")
//export double FMODGroupSetPaused(double group, double mute)
global.dll_FMODGroupSetPaused=external_define("GMFMODSimple.dll","FMODGroupSetPaused",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupSetPaused")
//export double FMODInstanceSetPaused(double instance, double mute)
global.dll_FMODInstanceSetPaused=external_define("GMFMODSimple.dll","FMODInstanceSetPaused",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetPaused")
//export double FMODGetLastError(void)
global.dll_FMODGetLastError=external_define("GMFMODSimple.dll","FMODGetLastError",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODGetLastError")
//export double FMODListenerHearsDistanceOnly(double number, double t)
global.dll_FMODListenerHearsDistanceOnly=external_define("GMFMODSimple.dll","FMODListenerHearsDistanceOnly",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODListenerHearsDistanceOnly")
//export double FMODSetDopplerFPS(double fps)
global.dll_FMODSetDopplerFPS=external_define("GMFMODSimple.dll","FMODSetDopplerFPS",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSetDopplerFPS")
//export double FMODListenerSet3dPositionEx(double number, double x, double y, double z, double fx, double fy, double fz, double ux, double uy, double uz)
global.dll_FMODListenerSet3dPositionEx=external_define("GMFMODSimple.dll","FMODListenerSet3dPositionEx",dll_cdecl,ty_real,10,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODListenerSet3dPositionEx")
//export double FMODSoundSet3dDopplerMax(double sound, double max)
global.dll_FMODSoundSet3dDopplerMax=external_define("GMFMODSimple.dll","FMODSoundSet3dDopplerMax",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSet3dDopplerMax")
//export double FMODInstanceSetFrequency(double instance, double freq)
global.dll_FMODInstanceSetFrequency=external_define("GMFMODSimple.dll","FMODInstanceSetFrequency",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetFrequency")
//export double FMODInstanceGetFrequency(double instance)
global.dll_FMODInstanceGetFrequency=external_define("GMFMODSimple.dll","FMODInstanceGetFrequency",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetFrequency")
//export double FMODSoundSet3dCone(double sound, double insideconeangle, double outsideconeangle, double outsidevolume)
global.dll_FMODSoundSet3dCone=external_define("GMFMODSimple.dll","FMODSoundSet3dCone",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSet3dCone")
//export double FMODInstanceSet3dConeOrientation(double instance, double x, double y, double z)
global.dll_FMODInstanceSet3dConeOrientation=external_define("GMFMODSimple.dll","FMODInstanceSet3dConeOrientation",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSet3dConeOrientation")
//export double FMODGroupSetFrequency(double group, double freq)
global.dll_FMODGroupSetFrequency=external_define("GMFMODSimple.dll","FMODGroupSetFrequency",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupSetFrequency")

//export double FMODGroupGetVolume(double group)
global.dll_FMODGroupGetVolume=external_define("GMFMODSimple.dll","FMODGroupGetVolume",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupGetVolume")
//export double FMODGroupGetPitch(double group)
global.dll_FMODGroupGetPitch=external_define("GMFMODSimple.dll","FMODGroupGetPitch",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupGetPitch")
//export double FMODGroupGetPaused(double group)
global.dll_FMODGroupGetPaused=external_define("GMFMODSimple.dll","FMODGroupGetPaused",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupGetPaused")
//export double FMODGroupGetMuted(double group)
global.dll_FMODGroupGetMuted=external_define("GMFMODSimple.dll","FMODGroupGetMuted",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupGetMuted")
//export double FMODGroupSetPitch(double group,double pitch)
global.dll_FMODGroupSetPitch=external_define("GMFMODSimple.dll","FMODGroupSetPitch",dll_cdecl,ty_real,2,ty_real, ty_real);
if(WTF) show_debug_message("Defined: FMODGroupSetPitch")
//export double FMODInstanceGetVolume(double instance)
global.dll_FMODInstanceGetVolume=external_define("GMFMODSimple.dll","FMODInstanceGetVolume",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetVolume")

//export double FMODInstanceGetSound(double instance)
global.dll_FMODInstanceGetSound=external_define("GMFMODSimple.dll","FMODInstanceGetSound",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetSound")

//export double FMODSoundGetMaxVolume(double sound)
global.dll_FMODSoundGetMaxVolume=external_define("GMFMODSimple.dll","FMODSoundGetMaxVolume",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundGetMaxVolume")
//export double FMODInstanceGetPaused(double instance)
global.dll_FMODInstanceGetPaused=external_define("GMFMODSimple.dll","FMODInstanceGetPaused",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetPaused")
//export double FMODInstanceGetMuted(double instance)
global.dll_FMODInstanceGetMuted=external_define("GMFMODSimple.dll","FMODInstanceGetMuted",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetMuted")

//export double FMODSoundAddEffect(LPCSTR soundfile, double effect, double pos)
global.dll_FMODSoundAddEffect=external_define("GMFMODSimple.dll","FMODSoundAddEffect",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundAddEffect")

//export double FMODInstanceGetPosition(double instance)
global.dll_FMODInstanceGetPosition=external_define("GMFMODSimple.dll","FMODInstanceGetPosition",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetPosition")

//export double FMODInstanceSetPosition(double instance, double p)
global.dll_FMODInstanceSetPosition=external_define("GMFMODSimple.dll","FMODInstanceSetPosition",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetPosition")


//export double FMODGroupSetPan(double group, double pan)
global.dll_FMODGroupSetPan=external_define("GMFMODSimple.dll","FMODGroupSetPan",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupSetPan")

//export double FMODInstanceSetPan(double instance, double p)
global.dll_FMODInstanceSetPan=external_define("GMFMODSimple.dll","FMODInstanceSetPan",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetPan")

//export double FMODInstanceGetPan(double instance)
global.dll_FMODInstanceGetPan=external_define("GMFMODSimple.dll","FMODInstanceGetPan",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetPan")

//export double FMODInstanceSetLoopCount(double instance, double p)
global.dll_FMODInstanceSetLoopCount=external_define("GMFMODSimple.dll","FMODInstanceSetLoopCount",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetLoopCount")

//export double FMODInstanceGetLoopCount(double instance)
global.dll_FMODInstanceGetLoopCount=external_define("GMFMODSimple.dll","FMODInstanceGetLoopCount",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetLoopCount")

//export double FMODBlockersInit(double NumBlockers, double xs, double ys, double zs)
global.dll_FMODBlockersInit=external_define("GMFMODSimple.dll","FMODBlockersInit",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockersInit")

//export double FMODBlockersFree()
global.dll_FMODBlockersFree=external_define("GMFMODSimple.dll","FMODBlockersFree",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODBlockersFree")

//export double FMODBlockerAdd(double x, double y, double z, double xs, double ys, double zs, double xe, double ye, double ze)
global.dll_FMODBlockerAdd=external_define("GMFMODSimple.dll","FMODBlockerAdd",dll_cdecl,ty_real,9,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockerAdd")

//export double FMODBlockerSet3dPosition(double blocker, double x, double y, double z)
global.dll_FMODBlockerSet3dPosition=external_define("GMFMODSimple.dll","FMODBlockerSet3dPosition",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockerSet3dPosition")

//export double FMODBlockerSet3dOrientation(double blocker, double fx, double fy, double fz, double ux, double uy, double uz)
global.dll_FMODBlockerSet3dOrientation=external_define("GMFMODSimple.dll","FMODBlockerSet3dOrientation",dll_cdecl,ty_real,7,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockerSet3dOrientation")

//export double FMODBlockerSet3dScale(double blocker, double sx, double sy, double sz)
global.dll_FMODBlockerSet3dScale=external_define("GMFMODSimple.dll","FMODBlockerSet3dScale",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockerSet3dScale")

//export double FMODBlockerSetEnabled(double blocker, double enabled)
global.dll_FMODBlockerSetEnabled=external_define("GMFMODSimple.dll","FMODBlockerSetEnabled",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockerSetEnabled")

//export double FMODBlockerGetEnabled(double blocker)
global.dll_FMODBlockerGetEnabled=external_define("GMFMODSimple.dll","FMODBlockerSetEnabled",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockerGetEnabled")

//export double FMODBlockerGetStrength(double blocker)
global.dll_FMODBlockerGetStrength=external_define("GMFMODSimple.dll","FMODBlockerGetStrength",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockerGetStrength")

//export double FMODBlockerSetStrength(double blocker,double strength)
global.dll_FMODBlockerSetStrength=external_define("GMFMODSimple.dll","FMODBlockerSetStrength",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockerSetStrength")

//export double FMODGetNumInstances(void)
global.dll_FMODGetNumInstances=external_define("GMFMODSimple.dll","FMODGetNumInstances",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODGetNumInstances")

//export double FMODSetPassword(LPCSTR password)
global.dll_FMODSetPassword=external_define("GMFMODSimple.dll","FMODSetPassword",dll_cdecl,ty_real,1,ty_string);
if(WTF) show_debug_message("Defined: FMODSetPassword")

//export double FMODSoundIsStreamed(double sound)
global.dll_FMODSoundIsStreamed=external_define("GMFMODSimple.dll","FMODSoundIsStreamed",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundIsStreamed")

//export double FMODSoundIs3d(double sound)
global.dll_FMODSoundIs3d=external_define("GMFMODSimple.dll","FMODSoundIs3d",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundIs3d")

//double FMODSoundInstanciate(double sound)
global.dll_FMODSoundInstanciate=external_define("GMFMODSimple.dll","FMODSoundInstanciate",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundInstanciate")

//export double FMODSoundGetMaxDist(double sound)
global.dll_FMODSoundGetMaxDist=external_define("GMFMODSimple.dll","FMODSoundGetMaxDist",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundGetMaxDist")

//export double FMODInstanceSet3dMinMaxDistance(double instance, double Min, double Max)
global.dll_FMODInstanceSet3dMinMaxDistance=external_define("GMFMODSimple.dll","FMODInstanceSet3dMinMaxDistance",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSet3dMinMaxDistance")

//export double FMODInstanceSet3dDopplerMax(double instance, double doppler)
global.dll_FMODInstanceSet3dDopplerMax=external_define("GMFMODSimple.dll","FMODInstanceSet3dDopplerMax",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSet3dDopplerMax")

//export double FMODInstanceSet3dCone(double instance, double insideconeangle, double outsideconeangle, double outsidevolume)
global.dll_FMODInstanceSet3dCone=external_define("GMFMODSimple.dll","FMODInstanceSet3dCone",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSet3dCone")


//export double FMODSoundGetNumChannels(double sound)
global.dll_FMODSoundGetNumChannels=external_define("GMFMODSimple.dll","FMODSoundGetNumChannels",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundGetNumChannels")

//export double FMODInstanceGetMaxDist(double instance)
global.dll_FMODInstanceGetMaxDist=external_define("GMFMODSimple.dll","FMODInstanceGetMaxDist",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetMaxDist")

//export double FMODInstanceGetWaveSnapshot(double instance, double channel, double size, LPSTR Buffer)
global.dll_FMODInstanceGetWaveSnapshot=external_define("GMFMODSimple.dll","FMODInstanceGetWaveSnapshot",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODInstanceGetWaveSnapshot")

//export double FMODInstanceGetSpectrumSnapshot(double instance, double channel, double size, LPSTR Buffer)
global.dll_FMODInstanceGetSpectrumSnapshot=external_define("GMFMODSimple.dll","FMODInstanceGetSpectrumSnapshot",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODInstanceGetSpectrumSnapshot")

//export double FMODGroupGetWaveSnapshot(double group, double channel, double size, LPSTR Buffer)
global.dll_FMODGroupGetWaveSnapshot=external_define("GMFMODSimple.dll","FMODGroupGetWaveSnapshot",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODGroupGetWaveSnapshot")

//export double FMODGroupGetSpectrumSnapshot(double group, double channel, double size, LPSTR Buffer)
global.dll_FMODGroupGetSpectrumSnapshot=external_define("GMFMODSimple.dll","FMODGroupGetSpectrumSnapshot",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODGroupGetSpectrumSnapshot")




//export double FMODInstanceGetWaveSnapshot2(double instance, double channel, double size)
global.dll_FMODInstanceGetWaveSnapshot2=external_define("GMFMODSimple.dll","FMODInstanceGetWaveSnapshot2",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetWaveSnapshot2")

//export double FMODInstanceGetSpectrumSnapshot2(double instance, double channel, double size)
global.dll_FMODInstanceGetSpectrumSnapshot2=external_define("GMFMODSimple.dll","FMODInstanceGetSpectrumSnapshot2",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetSpectrumSnapshot2")

//export double FMODGroupGetWaveSnapshot2(double group, double channel, double size)
global.dll_FMODGroupGetWaveSnapshot2=external_define("GMFMODSimple.dll","FMODGroupGetWaveSnapshot2",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupGetWaveSnapshot2")

//export double FMODGroupGetSpectrumSnapshot2(double group, double channel, double size)
global.dll_FMODGroupGetSpectrumSnapshot2=external_define("GMFMODSimple.dll","FMODGroupGetSpectrumSnapshot2",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupGetSpectrumSnapshot2")

//export double FMODNormalizeSpectrumData(double startpos, double size)
global.dll_FMODNormalizeSpectrumData=external_define("GMFMODSimple.dll","FMODNormalizeSpectrumData",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODNormalizeSpectrumData")

//export double FMODNormalizeWaveData(double startpos, double size)
global.dll_FMODNormalizeWaveData=external_define("GMFMODSimple.dll","FMODNormalizeWaveData",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODNormalizeWaveData")

//export double FMODGetSnapshotEntry(double pos)
global.dll_FMODGetSnapshotEntry=external_define("GMFMODSimple.dll","FMODGetSnapshotEntry",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODGetSnapshotEntry")

//export double FMODGetWaveBuffer(double startpos, double size, LPSTR Buffer)
global.dll_FMODGetWaveBuffer=external_define("GMFMODSimple.dll","FMODGetWaveBuffer",dll_cdecl,ty_real,3,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODGetWaveBuffer")

//export double FMODGetSpectrumBuffer(double startpos, double size, LPSTR Buffer)
global.dll_FMODGetSpectrumBuffer=external_define("GMFMODSimple.dll","FMODGetSpectrumBuffer",dll_cdecl,ty_real,3,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODGetSpectrumBuffer")

//extern double FMODEncryptFile(LPCSTR sourcename, LPCSTR destname, LPCSTR password)
global.dll_FMODEncryptFile=external_define("GMFMODSimple.dll","FMODEncryptFile",dll_cdecl,ty_real,3,ty_string,ty_string,ty_string);
if(WTF) show_debug_message("Defined: FMODEncryptFile")

//export double FMODSoundGetLength(double sound)
global.dll_FMODSoundGetLength=external_define("GMFMODSimple.dll","FMODSoundGetLength",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundGetLength")

//export double FMODInstanceSoundGetLength(double instance)
global.dll_FMODInstanceSoundGetLength=external_define("GMFMODSimple.dll","FMODInstanceSoundGetLength",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSoundGetLength")

//export double FMODInstanceAddEffect(double instance, double effect)
global.dll_FMODInstanceAddEffect=external_define("GMFMODSimple.dll","FMODInstanceAddEffect",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceAddEffect")

//export double FMODGroupAddEffect(double group, double effect)
global.dll_FMODGroupAddEffect=external_define("GMFMODSimple.dll","FMODGroupAddEffect",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupAddEffect")

//export double FMODEffectFree(double effect)
global.dll_FMODEffectFree=external_define("GMFMODSimple.dll","FMODEffectFree",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectFree")


//export double FMODSoundSetLoopCount(double sound, double count)
global.dll_FMODSoundSetLoopCount=external_define("GMFMODSimple.dll","FMODSoundSetLoopCount",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSetLoopCount")

//export double FMODSoundGetLoopCount(double sound)
global.dll_FMODSoundGetLoopCount=external_define("GMFMODSimple.dll","FMODSoundGetLoopCount",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundGetLoopCount")

//export double FMODSoundSetLoopPoints(double sound, double start, double end)
global.dll_FMODSoundSetLoopPoints=external_define("GMFMODSimple.dll","FMODSoundSetLoopPoints",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSetLoopPoints")


//export double FMODInstanceSetSpeakerMix(
//  double instance,  
//  double  frontleft, 
//  double  frontright, 
//  double  center, 
//  double  lfe, 
//  double  backleft, 
//  double  backright, 
//  double  sideleft, 
//  double  sideright)
  
global.dll_FMODInstanceSetSpeakerMix=external_define("GMFMODSimple.dll","FMODInstanceSetSpeakerMix",dll_cdecl,ty_real,9,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetSpeakerMix")


//export double FMODInstanceSetLoopPoints(double instance, double start, double end)
global.dll_FMODInstanceSetLoopPoints=external_define("GMFMODSimple.dll","FMODInstanceSetLoopPoints",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetLoopPoints")

//export double FMODInstanceGetAudibility(double instance)
global.dll_FMODInstanceGetAudibility=external_define("GMFMODSimple.dll","FMODInstanceGetAudibility",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetAudibility")

//export double FMODUpdateTakeOverWhileLocked()
global.dll_FMODUpdateTakeOverWhileLocked=external_define("GMFMODSimple.dll","FMODUpdateTakeOverWhileLocked",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODUpdateTakeOverWhileLocked")

//export double FMODUpdateTakeOverDone()
global.dll_FMODUpdateTakeOverDone=external_define("GMFMODSimple.dll","FMODUpdateTakeOverDone",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODUpdateTakeOverDone")

//export double FMODSpectrumSetSnapshotType(double snapshottype)
global.dll_FMODSpectrumSetSnapshotType=external_define("GMFMODSimple.dll","FMODSpectrumSetSnapshotType",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSpectrumSetSnapshotType")

//export double FMODInstanceGetNextTag(double instance)
global.dll_FMODInstanceGetNextTag=external_define("GMFMODSimple.dll","FMODInstanceGetNextTag",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetNextTag")

//export double FMODGetTagName(LPSTR buffer)
global.dll_FMODGetTagName=external_define("GMFMODSimple.dll","FMODGetTagName",dll_cdecl,ty_real,1,ty_string);
if(WTF) show_debug_message("Defined: FMODGetTagName")

//export double FMODGetTagData(LPSTR buffer)
global.dll_FMODGetTagData=external_define("GMFMODSimple.dll","FMODGetTagData",dll_cdecl,ty_real,1,ty_string);
if(WTF) show_debug_message("Defined: FMODGetTagData")


//export double FMODSoundAddAsyncStream(LPCSTR soundfile, double threed)
global.dll_FMODSoundAddAsyncStream=external_define("GMFMODSimple.dll","FMODSoundAddAsyncStream",dll_cdecl,ty_real,2,ty_string,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundAddAsyncStream")


//export double FMODSoundAsyncReady(double sound)
global.dll_FMODSoundAsyncReady=external_define("GMFMODSimple.dll","FMODSoundAsyncReady",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundAsyncReady")


//export double FMODInstanceAsyncOK(double instance)
global.dll_FMODInstanceAsyncOK=external_define("GMFMODSimple.dll","FMODInstanceAsyncOK",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceAsyncOK")

//export double FMODSoundGetMusicNumChannels(double sound)
global.dll_FMODSoundGetMusicNumChannels=external_define("GMFMODSimple.dll","FMODSoundGetMusicNumChannels",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundGetMusicNumChannels")

//export double FMODSoundGetMusicChannelVolume(double sound, double channel)
global.dll_FMODSoundGetMusicChannelVolume=external_define("GMFMODSimple.dll","FMODSoundGetMusicChannelVolume",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundGetMusicChannelVolume")


//export double FMODSoundSetMusicChannelVolume(double sound, double channel, double volume)
global.dll_FMODSoundSetMusicChannelVolume=external_define("GMFMODSimple.dll","FMODSoundSetMusicChannelVolume",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSetMusicChannelVolume")


//export double FMODEffectGetActive(double effect)
global.dll_FMODEffectGetActive=external_define("GMFMODSimple.dll","FMODEffectGetActive",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetActive")

//export double FMODEffectSetActive(double effect, double v)
global.dll_FMODEffectSetActive=external_define("GMFMODSimple.dll","FMODEffectSetActive",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectSetActive")

//export double FMODEffectGetBypass(double effect)
global.dll_FMODEffectGetBypass=external_define("GMFMODSimple.dll","FMODEffectGetBypass",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetBypass")

//export double FMODEffectSetBypass(double effect, double v)
global.dll_FMODEffectSetBypass=external_define("GMFMODSimple.dll","FMODEffectSetBypass",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectSetBypass")

//export double FMODEffectGetDefaultPan(double effect)
global.dll_FMODEffectGetDefaultPan=external_define("GMFMODSimple.dll","FMODEffectGetDefaultPan",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetDefaultPan")

//export double FMODEffectSetDefaultPan(double effect, double val)
global.dll_FMODEffectSetDefaultPan=external_define("GMFMODSimple.dll","FMODEffectSetDefaultPan",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectSetDefaultPan")


//export double FMODEffectGetDefaultVol(double effect)
global.dll_FMODEffectGetDefaultVol=external_define("GMFMODSimple.dll","FMODEffectGetDefaultVol",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetDefaultVol")

//export double FMODEffectSetDefaultVol(double effect, double val)
global.dll_FMODEffectSetDefaultVol=external_define("GMFMODSimple.dll","FMODEffectSetDefaultVol",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectSetDefaultVol")


//export double FMODEffectGetDefaultFr(double effect)
global.dll_FMODEffectGetDefaultFr=external_define("GMFMODSimple.dll","FMODEffectGetDefaultFr",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetDefaultFr")

//export double FMODEffectSetDefaultFr(double effect, double val)
global.dll_FMODEffectSetDefaultFr=external_define("GMFMODSimple.dll","FMODEffectSetDefaultFr",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectSetDefaultFr")



//export double FMODEffectGetNumParams(double effect)
global.dll_FMODEffectGetNumParams=external_define("GMFMODSimple.dll","FMODEffectGetNumParams",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetNumParams")

//export double FMODEffectGetParamValue(double effect, double p)
global.dll_FMODEffectGetParamValue=external_define("GMFMODSimple.dll","FMODEffectGetParamValue",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetParamValue")

//export double FMODEffectSetParamValue(double effect, double p, double v)
global.dll_FMODEffectSetParamValue=external_define("GMFMODSimple.dll","FMODEffectSetParamValue",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectSetParamValue")

//export double FMODEffectGetParamMin(double effect, double p)
global.dll_FMODEffectGetParamMin=external_define("GMFMODSimple.dll","FMODEffectGetParamMin",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetParamMin")


//export double FMODEffectGetParamMax(double effect, double p)
global.dll_FMODEffectGetParamMax=external_define("GMFMODSimple.dll","FMODEffectGetParamMax",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetParamMax")

//export double FMODEffectGetParamValueStr(double effect, double p, LPSTR str)
global.dll_FMODEffectGetParamValueStr=external_define("GMFMODSimple.dll","FMODEffectGetParamValueStr",dll_cdecl,ty_real,3,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODEffectGetParamValueStr")

//export double FMODEffectGetParamName(double effect, double p, LPSTR str)
global.dll_FMODEffectGetParamName=external_define("GMFMODSimple.dll","FMODEffectGetParamName",dll_cdecl,ty_real,3,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODEffectGetParamName")


//export double FMODEffectGetParamLabel(double effect, double p, LPSTR str)
global.dll_FMODEffectGetParamLabel=external_define("GMFMODSimple.dll","FMODEffectGetParamLabel",dll_cdecl,ty_real,3,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODEffectGetParamLabel")


//export double FMODEffectGetParamDesc(double effect, double p, LPSTR str)
global.dll_FMODEffectGetParamDesc=external_define("GMFMODSimple.dll","FMODEffectGetParamDesc",dll_cdecl,ty_real,3,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODEffectGetParamDesc")



//export double FMODEffectGetSpeakerActive(double effect, double speaker)
global.dll_FMODEffectGetSpeakerActive=external_define("GMFMODSimple.dll","FMODEffectGetSpeakerActive",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetSpeakerActive")


//export double FMODEffectSetSpeakerActive(double effect, double speaker, double active)
global.dll_FMODEffectSetSpeakerActive=external_define("GMFMODSimple.dll","FMODEffectSetSpeakerActive",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectSetSpeakerActive")

//export double FMODEffectReset(double effect)
global.dll_FMODEffectReset=external_define("GMFMODSimple.dll","FMODEffectReset",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectReset")


//export double FMODInstanceGetPitch(double instance)
global.dll_FMODInstanceGetPitch=external_define("GMFMODSimple.dll","FMODInstanceGetPitch",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetPitch")

//export double FMODInstanceSetPitch(double instance, double pitch)
global.dll_FMODInstanceSetPitch=external_define("GMFMODSimple.dll","FMODInstanceSetPitch",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetPitch")

//export double FMODSnapShotToDsList(double startpos, double size, double ds)
global.dll_FMODSnapShotToDsList=external_define("GMFMODSimple.dll","FMODSnapShotToDsList",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSnapShotToDsList")

//export double FMODCreateSoundFromMicInput()
global.dll_FMODCreateSoundFromMicInput=external_define("GMFMODSimple.dll","FMODCreateSoundFromMicInput",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODCreateSoundFromMicInput")

//export double FMODRecordStart(double sound)
global.dll_FMODRecordStart=external_define("GMFMODSimple.dll","FMODRecordStart",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODRecordStart")

//export double FMODRecordStop(double startpos, double size, double ds)
global.dll_FMODRecordStop=external_define("GMFMODSimple.dll","FMODRecordStop",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODRecordStop")


//export double FMODInstanceSet3DSpread(double instance, double spreadangle)
global.dll_FMODInstanceSet3DSpread=external_define("GMFMODSimple.dll","FMODInstanceSet3DSpread",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSet3DSpread")

//export double FMODInstanceGet3DSpread(double instance)
global.dll_FMODInstanceGet3DSpread=external_define("GMFMODSimple.dll","FMODInstanceGet3DSpread",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGet3DSpread")

//export double FMODInstanceSet3DPanLevel(double instance, double panlevel)
global.dll_FMODInstanceSet3DPanLevel=external_define("GMFMODSimple.dll","FMODInstanceSet3DPanLevel",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSet3DPanLevel")

//export double FMODInstanceGet3DPanLevel(double instance)
global.dll_FMODInstanceGet3DPanLevel=external_define("GMFMODSimple.dll","FMODInstanceGet3DPanLevel",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGet3DPanLevel")


//export string FMODGetErrorString(double error_code)
global.dll_FMODGetErrorString=external_define("GMFMODSimple.dll","FMODGetErrorString",dll_cdecl,ty_string,1,ty_real);
if(WTF) show_debug_message("Defined: FMODGetErrorString")

#define UnloadFMOD_new
//This frees the FMOD dll
//returns nothing

//Example calling
//When game ends
//UnloadFMOD();

external_free("GMFMODSimple.dll");

#define FMODfree_new
//export double FMODfree(void)

//Frees fmods allocated resources and stops the sound system
//You must call FMODinit(); if you want to use the system again
//You should free all you sounds before calling this function 
//(unless you are quiting the game), In which case it does not matter.

//FMODfree();

//See also
//FMODinit()
//FMODAllStop()
//FMODSoundFree()
//UnloadFMOD()

return external_call(global.dll_FMODfree);

#define FMODinit_new
//export double FMODinit(double maxsounds, double supportwebmusic)
//maxsounds is the maximum number of concurrent sound instances playing

//Initiates the FMOD sound system
//Call at the beggining of the game, after you called LoadFMOD()

//LoadFMOD()
//FMODinit(100);

//You can then start adding sounds to the system
//See Also
//LoadFMOD()
//FMODfree()
//FMODSoundAdd()

//to play web music, you must initialise the system like so
//FMODinit(100,true);
//Password encription is no longer supperted if you use the web music option

return external_call(global.dll_FMODinit,argument0, argument1);

#define FMODUpdate_new
//export double FMODUpdate3dPositions()
//You must call this once every step to update system
//In a controller object end step event
//FMODUpdate();
return external_call(global.dll_FMODUpdate);

#define FMODSoundAdd_new
//export double FMODSoundAdd(LPCSTR soundfile, double threed, double streamed)

//Adds a sound resource in the system but does not play it
//returns a soundid which you should store in a variable
//in order to play it and free it later
//returns 0 on error

//threed (optional false is default) specifies to load the file as 3d enabled

//stream (optional 0 is default):
//0 -> Preloads all the decompressed audio into memory before playing (RAM intensive)
//1 -> Streams from disk (Disk intensive)
//2 -> Preloads the compressed audio into memory before playing, then streams from memory

// specify threed as true if the sound will be 3d enabled
// You cannot mix 3d functions with non 3d sounds

//you can load up your sounds at the beginning of the game
//and store them in a global array or variable

//global.gunshot = FMODSoundAdd("gunshot.wav");
//or
//global.gunshot = FMODSoundAdd("gunshot.wav", true); //for 3d
//you free the sound when the game ends with FMODSoundFree(sound)
//you play the sound with FMODSoundPlay(sound)

//NOTE. Stream any single instance playing large files to save on memory
//If you choose to stream a files, it WILL affect
//multiple instance behaviour. That is the new instance will cause the
//sound to halt any other intance playing the sound and play for the new instance
//from the start, in effect, causing the other instance to become mute.

//MOTE. Multiple instancing have been tested with WAV file, MID and mp3 
//file. Thus far ONLY WAV and MP3 files will have multiple playing instances.
//Streamed of not, MIDs files will cause the sound halt (other file types may be affected)
//in the other instance and restart in the new instance

//NOTE. To conteract this limitation on MID and streamed files, you may add the same MID
//file multiple times in the system so each file has it's own sound id and instance
//mid_1 = FMODSoundAdd("music.mid",true)
//mid_2 = FMODSoundAdd("music.mid",true)
//mid_3 = FMODSoundAdd("music.mid",false)
//mid_4 = FMODSoundAdd("music.mid",false)
//mp3_1 = FMODSoundAdd("music.mp3",false,true)
//mp3_1 = FMODSoundAdd("music.mp3",false,true)
//
//FMODSoundPlay3d(mid_1,1000,1000,0);
//FMODSoundPlay3d(mid_2,2000,2000,0);
//FMODSoundPlay(mid_3);
//sleep(3000)
//FMODSoundPlay(mid_4);
//FMODSoundPlay(mp3_1);
//sleep(3000)
//FMODSoundPlay(mp3_1);

//You may do this if 2 sounds are close enough to be heard at the same time (in 3d)
//  or you dont want to sound to restart when the player hits the sweet spot, so
//  the sound will have progressed forward while you were away
//  or if the 2 sounds need to play in 2D mode concurenttly
//  AGAIN, this is only for MIDs and streamed files
//  WAV files behave normally and does not require this work arround

//Password encrypted mp3 sounds should not be streamed or you may get odd noises
//If you enabled webmusic, you will not be able to play encripted sounds
//To play a webfile, enter the full url for the file name and set the streamed option
//FMODSoundAdd("http://www.thesite.com/thefileormusicprovider",false,true);
//See also 
//FMODSoundFree()
//FMODSoundPlay()
//FMODSoundLoop()
//FMODSoundPlay3d()
//FMODSoundLoop3d()
//FMODSetPassword()
//FMODinit()

return external_call(global.dll_FMODSoundAdd,argument0, argument1, argument2);

#define FMODSoundFree_new
//export double FMODSoundFree(double sound)
//This function frees a sound from memory
//You shoud do this when the game ends though it's not required
//You should definitivelly do this if you added a temporary sound
//to the system and no longer need it. Otherwise, you may end up using 
//to much memory such as when playing a tempprary sound from file

//FMODSoundFree(global.gunshot);
//global.gunshot = 0; //this prevents from accidently using the sound

//returns 0 on error (sound is being played by an instance)
//return 1 on success 

//Dont forget to stop the instance or the group or all instances before calling this

//See also
//FMODSoundAdd()
//FMODInstanceStop()
//FMODGroupStop()
//FMODAllStop()


return external_call(global.dll_FMODSoundFree,argument0);

#define FMODSoundSetGroup_new
//export double FMODSoundSetGroup(double sound, double group)
//You have 4 groups in the system
//returns 1 on success
//returns 0 on error
//Groups are a number from 1 to 4
//priority - 1 //Assured to me played. Use for menu and game critical sounds/music)
//effects - 2 //Will be bumped if concurent instance count is reached and priority soun needs to play
//ambientmusic - 3 //Will be cut by abouve group of count is maxed (background music usually)
//ambient effects -4 //will be cut by any above. rain sound, river sounds

//Is also defines what volume setting the sound will obey as you can play with groups volume,mute and pause
//if you dont set the group, only the GlobalVolume and instancevolume will affect the sound
//sound = FMODSoundAdd("gunshot.wav");
//FMODSoundSetGroup(sound,2);

//Call before playing the sound

return external_call(global.dll_FMODSoundSetGroup,argument0,argument1);

#define FMODSoundSetMaxVolume_new
//export double FMODSoundSetMaxVolume(double sound, double volume)

//returns 0 on error
//returns 1 on success

//volume is the volume 0 to 1

//Use this to define sound's max volume (default is 1)

//The sound will never be louder than this value
//Other volume controls exist in the game, the global, the group and the distance (if 3d)
//the overall volume is a combination of all of those
// overall = maxvalue*instancevalue*group*global*distancefactor

//sound = FMODSoundAdd("gunshot.wav");
//FMODSoundSetMaxVolume(sound,.5);

//Call before playing the sound

return external_call(global.dll_FMODSoundSetMaxVolume,argument0,argument1);

#define FMODSoundGetMaxVolume_new
//export double FMODSoundGetMaxVolume(double sound)

//returns 0 on error
//returns volume on success


return external_call(global.dll_FMODSoundGetMaxVolume,argument0);

#define FMODSoundGetMaxDist_new
//export double FMODSoundGetMaxDist(double sound)

//returns 0 on error
//returns max dist on success


return external_call(global.dll_FMODSoundGetMaxDist,argument0);

#define FMODSoundSetEffects_new
//export double FMODSoundSetEffects(double sound, double effects)

//adds sound effects to the sound, just like GM
//sound = FMODSoundAdd("gunshot.wav")
//FMODSoundSetEffects(sound, se_flanger | se_reverb);
//Action cannot be undone and you should not call this while an 
//instance of the sound exists
//You should only call this once per sound

//The same constants as GM are used to make it easy though not all effect will be exactly the same as in GM
//se_chorus
//se_compressor (no effect)
//se_echo
//se_equalizer (not the same as GM. FMOD_DSP_TYPE_HIGHPASS used) Adds more trebble 
//se_flanger
//se_reverb (not as strong a reverb as GM)
//se_gargle (not the same as GM. FMOD_DSP_TYPE_DISTORTION used)
//se_none

//Call before playing the sound


return external_call(global.dll_FMODSoundSetEffects,argument0,argument1);

#define FMODSoundAddEffect_new
//export double FMODSoundAddEffect(double sound, double effects, position)

//Adds an FMOD effect to a sound at the position (0-9) specified 
//Effects
//    FMOD_DSP_TYPE_MIXER,          1    /* This unit does nothing but take inputs and mix them together then feed the result to the soundcard unit. */
//    FMOD_DSP_TYPE_OSCILLATOR,     2    /* This unit generates sine/square/saw/triangle or noise tones. */
//    FMOD_DSP_TYPE_LOWPASS,        3    /* This unit filters sound using a high quality, resonant lowpass filter algorithm but consumes more CPU time. */
//    FMOD_DSP_TYPE_ITLOWPASS,      4    /* This unit filters sound using a resonant lowpass filter algorithm that is used in Impulse Tracker, but with limited cutoff range (0 to 8060hz). */
//    FMOD_DSP_TYPE_HIGHPASS,       5    /* This unit filters sound using a resonant highpass filter algorithm. */
//    FMOD_DSP_TYPE_ECHO,           6    /* This unit produces an echo on the sound and fades out at the desired rate. */
//    FMOD_DSP_TYPE_FLANGE,         7    /* This unit produces a flange effect on the sound. */
//    FMOD_DSP_TYPE_DISTORTION,     8    /* This unit distorts the sound. */
//    FMOD_DSP_TYPE_NORMALIZE,      9    /* This unit normalizes or amplifies the sound to a certain level. */
//    FMOD_DSP_TYPE_PARAMEQ,        10    /* This unit attenuates or amplifies a selected frequency range. */
//    FMOD_DSP_TYPE_PITCHSHIFT,     11    /* This unit bends the pitch of a sound without changing the speed of playback. */
//    FMOD_DSP_TYPE_CHORUS,         12    /* This unit produces a chorus effect on the sound. */
//    FMOD_DSP_TYPE_REVERB,         13    /* This unit produces a reverb effect on the sound. */
//    FMOD_DSP_TYPE_VSTPLUGIN,      14    /* This unit allows the use of Steinberg VST plugins */
//    FMOD_DSP_TYPE_WINAMPPLUGIN,   15    /* This unit allows the use of Nullsoft Winamp plugins */
//    FMOD_DSP_TYPE_ITECHO,         16    /* This unit produces an echo on the sound and fades out at the desired rate as is used in Impulse Tracker. */
//    FMOD_DSP_TYPE_COMPRESSOR,     17    /* This unit implements dynamic compression (linked multichannel, wideband) */
//    FMOD_DSP_TYPE_SFXREVERB,      18    /* This unit implements SFX reverb */
//    FMOD_DSP_TYPE_LOWPASS_SIMPLE, 19    /* This unit filters sound using a simple lowpass with no resonance, but has flexible cutoff and is fast. */


//I dont check if an effect exist at the specified position do be careful not to
//add an effect at the same position twice.
//sound = FMODSoundAdd("gunshot.wav")
//FMODSoundAddEffect(sound, 19,0);
//FMODSoundAddEffect(sound, 5,1);

//Action cannot be undone and you should not call this while an 
//instance of the sound exists

//Call before playing the sound


return external_call(global.dll_FMODSoundAddEffect,argument0,argument1,argument2);

#define FMODSoundSet3dMinMaxDistance_new
//export double FMODSoundSet3dMinMaxDistance(double sound, double Min, double Max)
//returns 0 on error
//returns 1 on success

//Use this to define the sound travelling distance on for 3d sounds

//Min specifies the radius (in pixel, usually) where the sound is maximum
//Max specifies the radius where the sound is no longer heard
//the sound fades between min and max

//Sound must be 3d
//sound = FMODSoundAdd("gunshot.wav",true);
//FMODSoundSet3dMinMaxDistance(sound,100,500);

//you cannot call this while a sound instance is playing

//Call before playing the sound

return external_call(global.dll_FMODSoundSet3dMinMaxDistance,argument0,argument1,argument2);

#define FMODSoundSet3dDopplerMax_new
//export double FMODSoundSet3dDopplerMax(double sound, double dopplerval)
//Call this to set the sound doppler setting

//doppler settings 0 to 5) 0 - none 1 - normal, 5 is maximum
//This turns off doppler for this sound
//sound = FMODSoundAdd("sound.wav",true);
//FMODSoundSet3dDopplerMax(sound,0);
//Sound must be 3d

//FMODSetDopplerFPS(room_speed) must have been called for doppler to work 
return external_call(global.dll_FMODSoundSet3dDopplerMax,argument0,argument1);

#define FMODSoundSet3dCone_new
//export double FMODSoundSet3dCone(double sound, double insideconeangle, double outsideconeangle, double outsidevolume)

//Call before you play the sound
//Should work the same as GM sound_3d_set_sound_cone
//But you set the position using the instance FMODInstanceSet3dPosition
//and you set it's relative direction using FMODInstanceSet3dConeOrientation

//I have not tested this feature

return external_call(global.dll_FMODSoundSet3dCone,argument0,argument1,argument2,argument3);

#define FMODSoundGetNumChannels_new
//export double FMODSoundGetNumChannels(double sound)
//returns 0 on error
//returns the number of channels of the sound 1 for mono, 2 stereo 4 for quatro...

return external_call(global.dll_FMODSoundGetNumChannels,argument0);

#define FMODSoundGetLength_new
//export double FMODSoundGetLength(double sound)
//returns 0 on error
//returns the length of the sound in millisecs

return external_call(global.dll_FMODSoundGetLength,argument0);

#define FMODSoundSetLoopCount_new
//export double FMODSoundSetLoopCount(double sound, double count)

//returns 0 on error
//returns 1 on success

//Sets how many times a sound will be looped when played
//Same as FMODInstanceSetLoopCount but affect all instances created after


//Call before playing the sound

return external_call(global.dll_FMODSoundSetLoopCount,argument0,argument1);

#define FMODSoundGetLoopCount_new
//export double FMODSoundGetLoopCount(double sound)

//returns the loops count set for the sound

//NOT the Same as FMODInstanceGetLoopCount 
//This ALWAYS returns the Loop Count that was set for the sound

return external_call(global.dll_FMODSoundGetLoopCount,argument0);

#define FMODSoundSetLoopPoints_new
//export double FMODSoundSetLoopPoints(double sound, double start, double end)

//returns 0 on error
//returns 1 on success

//Sets how the part of the sound that will be looped
// sound is the sound that was added
// start (0 to 1) is the position of the start of the loop
// end (0 to 1) is the position of the end of the loop

//this set the loop point from 40% to 60% so only that part is looped
//FMODSoundSetLoopPoints(global.musicsound,.4,.6);

//Call before playing the sound

return external_call(global.dll_FMODSoundSetLoopPoints,argument0,argument1,argument2);

#define FMODSoundGetMusicNumChannels_new
//export double FMODSoundGetMusicNumChannels(double sound)
//Retrieves number of music channel for MOD/S3M/XM/IT/MIDI sounds. 
//A Music channel is basically an instrument in a midi file

//Use with FMODSoundSet/GetMusicChannelVolume to be sure not to ask for a channel that does not exist

return external_call(global.dll_FMODSoundGetMusicNumChannels,argument0);

#define FMODSoundGetMusicChannelVolume_new
//export double FMODSoundGetMusicChannelVolume(double sound, double channel)
//Retrieves volume (0 to 1) of a channel for MOD/S3M/XM/IT/MIDI sounds. 
//A Music channel is basically an instrument in a midi file
//channel specifies the midi instrument track you want to get the volume for.


//Use with FMODSoundGetMusicNumChannels to be sure not to ask for a channel that does not exist

return external_call(global.dll_FMODSoundGetMusicChannelVolume,argument0,argument1);

#define FMODSoundSetMusicChannelVolume_new
//export double FMODSoundSetMusicChannelVolume(double sound, double channel, double volume)
//Set the volume (0 to 1) for a channel for MOD/S3M/XM/IT/MIDI sounds. 
//A Music channel is basically an instrument in a midi file
//channel specifies the midi instrument track you want to get the volume for.

//Use with FMODSoundGetMusicNumChannels to be sure not to ask for a channel that does not exist

return external_call(global.dll_FMODSoundSetMusicChannelVolume,argument0, argument1, argument2);

#define FMODSoundPlay_new
//export double FMODSoundPlay(double sound, double paused)

//Plays a sound... Finally

//returns 0 on error
//returns a sound instance on success
//paused is optional. set to true and unpause later to play. 
//If you hear a short blurb of sound after you start the sound, 
//because you are playing with the instance settings
//you might want to start it paused.

//sound = FMODSoundAdd("gunshot.wav");
//instance = FMODSoundPlay(sound);

//You dont need to keep track of the instance if you dont plan to change it
//or if the sound is short, you may never have time to use it other that right
//after you make the PlaySound Call... The instance will become invalid 
//when the sound is done playing
var t;
t =  external_call(global.dll_FMODSoundPlay,argument0,argument1);
//FMODUpdate();
return t;

#define FMODSoundLoop_new
//export double FMODSoundLoop(double sound, double paused)

//Loops a sound

//returns 0 on error
//retuns a sound instance on success
//paused is optional. set to true and unpause later to play. 
//If you hear a short blurb of sound after you start the sound, 
//because you are playing with the instance settings
//you might want to start it paused.

//sound = FMODSoundAdd("gunshot.wav");
//instance = FMODSoundLoop(sound);

//You dont need to keep track of the instance if you dont plan to change it
//The instance will be valid for as long as you dont stop it or stop the group
// or stop the entire system
//See also FMODInstanceSetLoopCount()
var t;
t =  external_call(global.dll_FMODSoundLoop,argument0,argument1);
//FMODUpdate();
return t;

#define FMODSoundPlay3d_new
//export double FMODSoundPlay3d(double sound, double x, double y, double z, double paused)

//Play a sound relative to the playe or listenner position

//returns 0 on error
//retuns a sound instance on success
//paused is optional. set to true and unpause later to play. 
//If you hear a short blurb of sound after you start the sound, 
//because you are playing with the instance settings
//you might want to start it paused.

//sound = FMODSoundAdd("gunshot.wav",true);
//FMODSoundSet3dMinMaxDistance(sound,100,300);
//FMODListenerSet3dPosition(1,50,50);
//instance = FMODSoundPlay3d(sound,300,300,0);

//You dont need to keep track of the instance if you dont plan to change it
//or if the sound is short, you may never have time to use it other that right
//after you make the PlaySoundCall... The instance will become invalid 
//when the sound is done playing. you can move the instance while it plays
//if you want
//See FMODUpdate for imprtant information
//See FMODSoundAdd for very important information
//var paused;
var t;
t =  external_call(global.dll_FMODSoundPlay3d,argument0,argument1,argument2,argument3,argument4);
//FMODUpdate();
return t;

#define FMODSoundLoop3d_new
//export double FMODSoundLoop3d(double sound, double x, double y, double z, double paused)

//Plays (Loops) a sound relative to the player or listenner position

//returns 0 on error
//retuns a sound instance on success
//paused is optional. set to true and unpause later to play. 
//If you hear a short blurb of sound after you start the sound, 
//because you are playing with the instance settings
//you might want to start it paused.

//sound = FMODSoundAdd("gunshot.wav",true);
//FMODSoundSet3dMinMaxDistance(sound,100,300);
//FMODListenerSet3dPosition(1,50,50);
//instance = FMODSoundLoop3d(sound,300,300,0);

//You dont need to keep track of the instance if you dont plan to change it
//You can move the instance while it plays if you want
//See FMODSoundLoop for important details
//See FMODUpdate for important information
//See FMODSoundAdd for very important information
//See also FMODInstanceSetLoopCount()


var t;
t =  external_call(global.dll_FMODSoundLoop3d,argument0,argument1,argument2,argument3,argument4);
//FMODUpdate();
return t;

#define FMODInstanceStop_new
//export double FMODInstanceStop(double instance)

//Use this to stop and free an instance when done with a 
//looped instance for example

return external_call(global.dll_FMODInstanceStop,argument0);

#define FMODInstanceGetSound_new
//export double FMODInstanceGetSound(double instance)

//Get the sound the instance is playing. It must be playing (valid) or you will get 0

//sound = FMODInstanceGetSound(instance);
return external_call(global.dll_FMODInstanceGetSound,argument0);

#define FMODInstanceIsPlaying_new
//export double FMODInstanceIsPlaying(double instance)

//Retuns 1 if the sound instance is playing
//Returns 0 if not playing or error (an error can happen if the instance is no longer valid but you get 0 in this case)

//Example to free a sound when it's done playing (for a single play once temporary sound)
//which is useful to do
//if(!FMODInstanceIsPlaying(instance))
//{ 
//    FMODSoundFree(sound);
//    sound = 0;
//}

return external_call(global.dll_FMODInstanceIsPlaying,argument0);

#define FMODInstanceSetVolume_new
//export double FMODInstanceSetVolume(double instance, double volume)
//returns 0 on error
//returns 1 on success

//instance is the sound instance gotten with FMODSoundPlay
//volume is the volume 0 to 1

//Use this to change an sound instance volume

//The instance will never be louder than the max sound volume
//Other volume controls exist in the game, the global, the group and the distance (if 3d)
//the overall volume is a combination of all of those
// overall = maxvalue*instancevalue*group*global*distancefactor

//sound = FMODSoundAdd("gunshot.wav");
//FMODSoundSetMaxVolume(sound,.5);
//instance = FMODSoundLoop(sound);
//FMODInstanceSetVolume(instance,.5);
//You can use this to implement your fade system
//You need to keep track of the volume yourself in a variable 
//if you need to remember the max volume of the intance

return external_call(global.dll_FMODInstanceSetVolume,argument0,argument1);

#define FMODInstanceGetVolume_new
//export double FMODInstanceGetVolume(double instance)

//Get the instance volume. It must be playing (valid) or you will get 0

return external_call(global.dll_FMODInstanceGetVolume,argument0);

#define FMODInstanceSetFrequency_new
//export double FMODInstanceSetFrequency(double instance, double freq)

//Set a playing instance frequency fro "bullet time" effect
//some sounds can have negative freq, reversed/rewinding effect if not streamed
//sound = FMODSoundAdd("test.mp3");
//instance= FMODSoundLoop(sound);
//FMODInstanceSetFrequency(instance,FMODInstanceGetFrequency(instance)/2);
//Use FMODInstanceGetFrequency(instance); to get to original frequency before changing it
//so to reset the frequency when done with your effect
//44100 is usually the normal frequency 
//See FMODGroupSetFrequency for changing many sounds at the same time
return external_call(global.dll_FMODInstanceSetFrequency,argument0,argument1);

#define FMODInstanceGetFrequency_new
//export double FMODInstanceGetFrequency(double instance)

//Set a playing instance frequency fro "bullet time" effect
//some sounds can have negative freq, reversed/rewinding effect if not streamed

//returns the frequency of the instance or 0 on error
//sound = FMODSoundAdd("test.mp3");
//instance= FMODSoundLoop(sound);
//fr = FMODInstanceGetFrequency(instance,FMODInstanceGetFrequency(instance)/2);
return external_call(global.dll_FMODInstanceGetFrequency,argument0);

#define FMODInstanceSetMuted_new
//export double FMODInstanceSetMuted(double instance, double mute)

//Mutes the specified instance but does not stop it
//if the group or all is muted, it will unmute when the group and all are unmuted
//returns 1 on success or 0 on error
//mute - set to true or false to mute and unmute

return external_call(global.dll_FMODInstanceSetMuted,argument0,argument1);

#define FMODInstanceGetMuted_new
//export double FMODInstanceGetMuted(double instance)

//Get the instance mute setting. It must be playing (valid) or you will get 0

return external_call(global.dll_FMODInstanceGetMuted,argument0);

#define FMODInstanceSetPaused_new
//export double FMODInstanceSetPaused(double instance, double pause)

//Use this to pause/unpause an instance

return external_call(global.dll_FMODInstanceSetPaused,argument0,argument1);

#define FMODInstanceGetPaused_new
//export double FMODInstanceGetPaused(double instance)

//Get the instance paused setting. It must be playing (valid) or you will get 0

return external_call(global.dll_FMODInstanceGetPaused,argument0);

#define FMODInstanceSetPosition_new
//export double FMODInstanceSetPosition(double instance, double p)

//Set the play position (0 - start, 1 is end, .5 is middle) of the music
return external_call(global.dll_FMODInstanceSetPosition,argument0,argument1);

#define FMODInstanceGetPosition_new
//export double FMODInstanceGetPosition(double instance)

//Returns the current play position (0 - start, 1 is end, .5 is middle) of the music
return external_call(global.dll_FMODInstanceGetPosition,argument0);

#define FMODInstanceSetPan_new
//export double FMODInstanceSetPan(double instance, double p)
//Set the instance pan. -1(left) to 0 (center) to 1 (right)
return external_call(global.dll_FMODInstanceSetPan,argument0,argument1);

#define FMODInstanceGetPan_new
//export double FMODInstanceGetPan(double instance)

//Returns the instance pan (-1 to 0 to 1)
return external_call(global.dll_FMODInstanceGetPan,argument0);

#define FMODInstanceSetLoopCount_new
//export double FMODInstanceSetLoopCount(double instance, double loopcount)
//Set the instance loop count. -1 loop forever, 0 no loop >0 the number of times to loop 
//(1 will loop once, playing the sound twice)
return external_call(global.dll_FMODInstanceSetLoopCount,argument0,argument1);

#define FMODInstanceGetLoopCount_new
//export double FMODInstanceGetLoopCount(double instance)

//Returns the instance loop count (0 - done looping (performing last play), -1 looping forever, >0 Number of loops left)

return external_call(global.dll_FMODInstanceGetLoopCount,argument0);

#define FMODInstanceSet3dConeOrientation_new
//export double FMODInstanceSet3dConeOrientation(double instance, double dx, double dy, double dz)

//Should work like GM's sound_3d_set_sound_cone, the actual cone definition is done with the sound
//using FMODSoundSet3dMinMaxDistance()

//dx,dy,dz are the directional vectors... Again, dont ask me how the relate... See FMODListenerSet3dPositionEx()

//the instance must be of a 3d sound 

//I have not tested this feature

return external_call(global.dll_FMODInstanceSet3dConeOrientation,argument0,argument1,argument2,argument3);

#define FMODInstanceSet3dPosition_new
//export double FMODInstanceSet3dPosition(double instance,double x,double y,double z)
//Chages the position of a sound instance

//returns 0 on error
//returns 1 on success

//Sound must be 3d
//sound = FMODSoundAdd("gunshot.wav",true);
//FMODSoundSet3dMinMaxDistance(sound,100,300);
//FMODListenerSet3dPosition(1,50,50);
//instance = FMODSoundLoop3d(sound,300,300,0);

//later (end step)
//FMODInstanceSet3dPosition(instance,x,y,0);

//FMODUpdate for important information
return external_call(global.dll_FMODInstanceSet3dPosition,argument0,argument1,argument2,argument3);

#define FMODInstanceFadeVolume_new
//FMODInstanceFadeVolume(instance, curvolume, targetvolume,numframes, updatecode)
//instance is the instance to fade
//target volume the volume to go to
//numframes. The number of frames the effect will take place
//    use room_speed*2 for 2 seconds
//Current volume is the instance's current volume to prevent
//burst of sounds. If you dont know it try 1 if fading from an unknown volume to 0
//or 0 if going to a volume. Usually, when you use this sort of control, you know
//the volume of the instance An instance volume is 1 when it starts
//updatecode (optional) is the code to call to update your volume variable
// it has the form of "with(100010 /*YourInstanceID*/) {YourVariableName = other.instvol;}"}
// or "global.thevariablename = instvol;"
var d;
d = argument2
var i;
//if(argument0 > 0)
{
    d = max(0,min(d,1));
    i = (d-argument1)/(argument3+1);
    with(FMODFaderObj)
    {
        if(group = argument0 and isinst = true)
        {
            inc = max(abs(inc),abs(i))*sign(i);
            dest = d;
            exit
        }
    }
    with(instance_create(0,0,FMODFaderObj))
    {
        inc = i;
        dest = d;
        instvol = argument1
        group = argument0;
        code = ""
        if(is_string(argument4)) code = string(argument4)
        isinst = true;
        exit;
    }
}

#define FMODInstanceFadeFrequency_new
//FMODInstanceFadeFrequency(instance,targetfr, time)
//instance is the sound instance, 
//targetfr, is the target frequency, 
//time is the time to do the effect for 2 seconds, use room_speed*2
//Fade the frequency

var d;
d = argument1    

var i;
//if(argument0 > 0)
{
    i = (d-FMODInstanceGetFrequency(argument0))/(argument2+1);
    with(FMODFreqFaderObj)
    {
        if(group = argument0 and isinst = true)
        {
            inc = max(abs(inc),abs(i))*sign(i);
            dest = d;
            exit
        }
    }
    with(instance_create(0,0,FMODFreqFaderObj))
    {
        inc = i;
        dest = d;
        instfreq = FMODInstanceGetFrequency(argument0);
        group = argument0;
        isinst = true;
        exit;
    }
}

#define FMODInstanceFadePan_new
//FMODGroupFadePan(instance, targetpan,numframes)
//instance is the instance to fade
//target pan the pan to go to
//numframes. The number of frames the effect will take place
//    use room_speed*2 for 2 seconds
//Current pan is the instance's current volume to prevent
//burst of sounds. If you dont know it try 0 if fading from an unknown pan to 1 or -1
//updatecode (optional) is the code to call to update your pan variable
// it has the form of "with(100010 /*YourInstanceID*/) {YourVariableName = other.curpan;}"}
// or "global.thevariablename = curpan;"
var d;
d = argument1
var i;
if(argument0 > 0)
{
    d = max(-1,min(d,1))+1;
    i = (d-(FMODInstanceGetPan(argument0)+1))/(argument2+1);
    with(FMODPanFaderObj)
    {
        if(group = argument0 and isinst = false)
        {
            inc = max(abs(inc),abs(i))*sign(i);
            dest = d;
            exit
        }
    }
    with(instance_create(0,0,FMODPanFaderObj))
    {
        inc = i;
        dest = d;
        curpan = FMODInstanceGetPan(argument0)+1;
        group = argument0;
        code = ""
        isinst = true;
        exit;
    }
}

#define FMODInstanceSet3dMinMaxDistance_new
//export double FMODInstanceSet3dMinMaxDistance(double instance, double Min, double Max)
//Sets the min max distance of an instance
return external_call(global.dll_FMODInstanceSet3dMinMaxDistance,argument0,argument1,argument2);

#define FMODInstanceSet3dDopplerMax_new
//export double FMODInstanceSet3dDopplerMax(double sound, double dopplerval)
//Call this to set the instance doppler setting

//FMODSetDopplerFPS(room_speed) must have been called for doppler to work 
return external_call(global.dll_FMODInstanceSet3dDopplerMax,argument0,argument1);

#define FMODInstanceSet3dCone_new
//export double FMODInstanceSet3dCone(double sound, double insideconeangle, double outsideconeangle, double outsidevolume)

//I have not tested this feature

return external_call(global.dll_FMODInstanceSet3dCone,argument0,argument1,argument2,argument3);

#define FMODInstanceGetMaxDist_new
//export double FMODInstanceGetMaxDist(double instance)

//returns 0 on error
//returns max dist on success


return external_call(global.dll_FMODInstanceGetMaxDist,argument0);

#define FMODInstanceGetWaveSnapshot_new
//export double FMODInstanceGetWaveSnapshot(double instance, double channel, double size)
//returns 0 on error
//returns 1 success
//Instance is the sound instance
//Channel is the sound channel (FMODSoundGetNumChannels to figure how many channels you need to fetch)
//It's usually good enough to get channel 0 (for mono sounds or left channel for stereo sounds) 1 is right, 2 and higher are the other channels if any
//size is the size of the buffer... keep it 2^n 32,64,128.... 16384(max)

//var buf;
global.FMODbuf = string_repeat(chr(0), argument2+1);
//Gets the wave snapshot into a string buffer
//Each character is a value from 0to 255 to represent the wave played (not the full wave, just the portion being played)
//success = FMODInstanceGetWaveSnapshot(instance,0, 256)
//The bigger the sample size the more accurate the reading. Though FMOD documentation does not specify
//if the sample size corresponds to the smapshot window width or the precision of the snapshot.

//the flatline is at char 127. 127-n is the -crest 127+n is the +crest of the wave form

//NOTE BECAUSE OF A GM BUG REGARDING LEAKS RETURNING STRINGS
//global.FMODbuf is now used
//Use ord(string_char_at(global.FMODbuf,<<1 to size>>)) to access values
//If you need to average left and right channels create a more accurate display of both channels in one screen 
//you will need to call this twice (with 0 then with 1) then loop through each value, add them together and divide by 2
//The demo draws both left and right individually

return external_call(global.dll_FMODInstanceGetWaveSnapshot,argument0,argument1,argument2,global.FMODbuf);
//return buf;

#define FMODInstanceGetSpectrumSnapshot_new
//export double FMODInstanceGetSpectrumSnapshot(double instance, double channel, double size)
//returns 0 on error
//returns maxv on success (so, the return of 0 could be an error or maxv)

//Instance is the sound instance
//Channel is the sound channel (FMODSoundGetNumChannels to figure how many channels you need to fetch)
//It's usually good enough to get channel 0 (for mono sounds or left channel for stereo sounds) 1 is right, 2 and higher are the other channels if any
//size is the size of the buffer... keep it 2^n 64,128.... Min = 64. Max = 8192(max)

//var buf;
global.FMODbuf = string_repeat(chr(0), argument2+1);
//Gets the spectrum snapshot into a string buffer
//Each character is a value from 0to 255 to represent the spectrum played 
//unuseable = FMODInstanceGetSpectrumSnapshot(instance,0, 256)

//NOTE BECAUSE OF A GM BUG REGARDING LEAKS RETURNING STRINGS
//global.FMODbuf is now used

//Use ord(string_char_at(global.FMODbuf,<<1 to size>>)) to access values
//If you need to average left and right channels create a more accurate display of both channels in one screen 
//you will need to call this twice (with 0 then with 1) then loop through each value, add them together and divide by 2
//The demo draws both left and right individually
//NOTE for drawing... If the sound is 41000 or 48000, consider asking for 256 bytes but display only the first 128
//like the demo does...That will draw frequencies 0 to 22KHz, the commun hearing frequencies

//The function normalises the values... That is the highest value will always be 255... 
//This ensures your will get the maximum range possible. Done in the Dll this is faster 
//than GM would do it with strings. Since I figure most poeple will want this on default...
//However, the retun call of the DLL function returns the max value and I stuff it in a member
//variable FMODMaxV so you may un-normalize the data if you need to using
//ord(string_char_at(buffer,<<1 to size>>))*FMODMaxV
FMODMaxV = external_call(global.dll_FMODInstanceGetSpectrumSnapshot,argument0,argument1,argument2,global.FMODbuf);
return FMODMaxV;

#define FMODInstanceGetWaveSnapshot2_new
//export double FMODInstanceGetWaveSnapshot2(double instance, double channel, double size)
//This function stores data to a memory buffer which you can manipulate for better
//range using FMODNormalizeWaveData and read using 
//FMODGetWaveBuffer and FMODGetSnapshotEntry

//returns 0 on error
//Instance is the sound instance
//Channel is the sound channel (FMODSoundGetNumChannels to figure how many channels you need to fetch)
//It's usually good enough to get channel 0 (for mono sounds or left channel for stereo sounds) 1 is right, 2 and higher are the other channels if any
//size is the size of the buffer... keep it 2^n 32,64,128.... 16384(max)

//The bigger the sample size the more accurate the reading. Though FMOD documentation does not specify
//if the sample size corresponds to the smapshot window width or the precision of the snapshot.

//use FMODGetSnapshotEntry(pos) to get the data points 
//each point is a value from -1 to 1 representing the waveform crest point position

return external_call(global.dll_FMODInstanceGetWaveSnapshot2,argument0,argument1,argument2);

#define FMODInstanceGetSpectrumSnapshot2_new
//export double FMODInstanceGetSpectrumSnapshot2(double instance, double channel, double size)
//This function stores data to a memory buffer which you can manipulate for better
//range using FMODNormalizeSpectrumData and read using 
//FMODGetSpectrumBuffer and FMODGetSnapshotEntry

//returns 0 on error
//returns 1 on success
//Instance is the sound instance
//Channel is the sound channel (FMODSoundGetNumChannels to figure how many channels you need to fetch)
//It's usually good enough to get channel 0 (for mono sounds or left channel for stereo sounds) 1 is right, 2 and higher are the other channels if any
//size is the size of the buffer... keep it 2^n 64,128.... Min = 64. Max = 8192(max)

//Gets the spectrum snapshot into a string buffer
//If you need to average left and right channels create a more accurate display of both channels in one screen 
//you will need to call this twice (with 0 then with 1) then loop through each value, add them together and divide by 2
//The demo draws both left and right individually
//NOTE for drawing... If the sound is 41000 or 48000, consider asking for 256 bytes but display only the first 128
//like the demo does...That will draw frequencies 0 to 22KHz, the commun hearing frequencies

//The function does NOT normalize the values... 
//use FMODNormalizeSpectrumData() to do that

//use FMODGetSnapshotEntry(pos) to get the data points 
//each point is a value from 0 to 1 representing the spectrum value (volume at relative frequency)

return external_call(global.dll_FMODInstanceGetSpectrumSnapshot2,argument0,argument1,argument2);

#define FMODInstanceSoundGetLength_new
//export double FMODInstanceSoundGetLength(double instance)
//returns 0 on error
//returns the length of the intance's sound in millisecs

return external_call(global.dll_FMODInstanceSoundGetLength,argument0);

#define FMODInstanceSetLoopPoints_new
//export double FMODInstanceSetLoopPoints(double instance, double start, double end)

//returns 0 on error
//returns 1 on success

//Sets what part of the sound INSTANCE that will be looped
// sound is the sound that was added
// start (0 to 1) is the position of the start of the loop
// end (0 to 1) is the position of the end of the loop

//this set the loop point from 40% to 60% so only that part is looped
//only affects the instanciated sound, not the actual sound so other calls to sound loop will use the sound defaults
//instance = FMODSoundLoop(global.musicsound)
//FMODInstanceSetLoopPoints(instance,.4,.6);

return external_call(global.dll_FMODInstanceSetLoopPoints,argument0,argument1,argument2);

#define FMODInstanceGetAudibility_new
//export double FMODInstanceGetAudibility(double instance)
//returns the audibility of the sound instance
//to determine if the instance can be heard over the speakers

return external_call(global.dll_FMODInstanceGetAudibility,argument0);

#define FMODInstanceSetSpeakerMix_new
//export double FMODInstanceSetSpeakerMix(
//  double instance,  
//  double  frontleft, 
//  double  frontright, 
//  double  center, 
//  double  lfe, 
//  double  backleft, 
//  double  backright, 
//  double  sideleft, 
//  double  sideright)

//Set how the instance is played over the all the speakers
//Pretty sure if the sound is threed, the function has no effect
//You can actualy make pretty cool effect with this

//each speaker setting takes a value from 0 (mute) to 1 (normal) to 5 (amplified x5)

//returns 0 or failure, 1 on success
return external_call(global.dll_FMODInstanceSetSpeakerMix,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);

#define FMODInstanceSet3DPanLevel_new
//export double FMODInstanceSet3DPanLevel(double instance, double panlevel)
//returns 1 on succes, 0 on error

//A 3d sound instance pan level can be changed from 0 up to 1
//Where 1 (default) means the 3d sound instance is perceived as per the 
//listener's position.
//0 mean the sound plays on all speakers as it would play normally
//Gradually changing the value from 1 to 0 would give the player the impression 
//the sound started at a 3d location and is now all arround him

//Of course, FMODListenerHearsDistanceOnly affects the way this behaves
return external_call(global.dll_FMODInstanceSet3DPanLevel,argument0,argument1);

#define FMODInstanceGet3DPanLevel_new
//export double FMODInstanceGet3DPanLevel(double instance)

//Returns the pan level of the instance

return external_call(global.dll_FMODInstanceGet3DPanLevel,argument0);

#define FMODInstanceSet3DSpread_new
//export double FMODInstanceSet3DSpread(double instance, double spreadangle)
//Return 1 on success, 0 on error
//Spread angle is the angle the sound is distributed over the speakers
//This is more complicated, Quoting FMOD Documentation
/*
By default (0), if a stereo sound was played in 3d, and it was directly in front of you, 
the left and right part of the stereo sound would be summed into the center speaker 
(on a 5.1 setup), making it sound mono.
This function lets you control the speaker spread of a stereo (and above) sound within 
the speaker array, to separate the left right part of a stereo sound for example.
In the above case, in a 5.1 setup, specifying a spread of 90 degrees would put the 
left part of the sound in the front left speaker, and the right part of the sound 
in the front right speaker. This stereo separation remains intact as the listener 
rotates and the sound moves around the speakers.

To summarize (for a stereo sound).
1. A spread angle of 0 makes the stereo sound mono at the point of the 3d emitter.
2. A spread angle of 90 makes the left part of the stereo sound place itself at 45 
degrees to the left and the right part 45 degrees to the right.
3. A spread angle of 180 makes the left part of the stero sound place itself at 90 
degrees to the left and the right part 90 degrees to the right.
4. A spread angle of 360 makes the stereo sound mono at the opposite speaker location 
to where the 3d emitter should be located (by moving the left part 180 degrees left and 
the right part 180 degrees right). So in this case, behind you when the sound should be 
in front of you!

Multichannel sounds with channel counts greater than stereo have their sub-channels spread 
evently through the specified angle. For example a 6 channel sound over a 90 degree spread 
has each subchannel located 15 degrees apart from each other in the speaker array.
*/

return external_call(global.dll_FMODInstanceSet3DSpread,argument0,argument1);

#define FMODInstanceGet3DSpread_new
//export double FMODInstanceGet3DSpread(double instance)

//Returns the 3d spread of a sound insance (0 to 360 degrees)

return external_call(global.dll_FMODInstanceGet3DSpread,argument0);

#define FMODInstanceGetPitch_new
//export double FMODInstanceGetPitch(double instance)

//Set the instance pitch. 0 to 10, 1 is default
//some sounds can have negative pitch, reversed/rewinding effect if not streamed

//See Also FMODInstanceSetPitch/Frequency
return external_call(global.dll_FMODInstanceGetPitch,argument0);

#define FMODInstanceSetPitch_new
//export double FMODInstanceSetPitch(double instance, double pitch)

//Set the instance pitch. 0 to 10, 1 is default
//some sounds can have negative pitch, reversed/rewinding effect if not streamed

//See Also FMODInstanceGetPitch/Frequency
return external_call(global.dll_FMODInstanceSetPitch,argument0,argument1);

#define FMODAllStop_new
//export double FMODAllStop(void)
//This stops all the sound and frees all the instances. Call this when the room ends

return external_call(global.dll_FMODAllStop);

#define FMODGroupStop_new
//export double FMODGroupStop(double group)

//This stops a group and frees all instances used by it.

//Call this when the room ends FMODAllStop is the same as group 0 

return external_call(global.dll_FMODGroupStop,argument0);

#define FMODMasterSetVolume_new
//export double FMODMasterSetVolume(double volume)

//This sets the global volume. changes are relative to the sounds max volume and 
//the group they belong too

//You need to keep track of the volume yourself in a variable 
//if you need to remember the global volume
// overall = maxvalue*instancevalue*group*global*distancefactor

return external_call(global.dll_FMODMasterSetVolume,argument0);

#define FMODGroupSetVolume_new
//export double FMODGroupSetVolume(double group, double volume)
//This set the group (1-4) volume. 0 for master. Changes are relative to the sound max volume and 
//the global volume

//You need to keep track of the groups volume yourself in variables 
//if you need to remember the volume of the each group
// overall = maxvalue*instancevalue*group*global*distancefactor

return external_call(global.dll_FMODGroupSetVolume,argument0,argument1);

#define FMODGroupGetVolume_new
//export double FMODGroupGetVolume(double group)

//This gets the group volume 0-Master (Global), 1-priority, 2-seefect, 3-ambientmusic, 4-ambient effects

return external_call(global.dll_FMODGroupGetVolume,argument0);

#define FMODGroupSetPitch_new
//export double FMODGroupSetPitch(double group, double pitch)

//Set the group pitch. 0 to 10, 1 is default
//some sounds can have negative pitch, reversed/rewinding effect
//Regular Groups are 1-4. 0 for the master group. Useful for bullet time on all sounds or underwater sound
//this does not override a channel pitch (it has none)
//See Also FMODGroupSetFrequency
return external_call(global.dll_FMODGroupSetPitch,argument0,argument1);

#define FMODGroupGetPitch_new
//export double FMODGroupGetPitch(double group)


//This gets the group pitch (0-10, 1 default) groups: 0-Master (Global), 1-priority, 2-effects, 3-ambientmusic, 4-ambient effects

return external_call(global.dll_FMODGroupGetPitch,argument0);

#define FMODGroupSetPaused_new
//export double FMODGroupSetPaused(double group, double pause)
//Pause/Unpause a group (1-4). does not affect individual settings of instances

return external_call(global.dll_FMODGroupSetPaused,argument0,argument1);

#define FMODGroupGetPaused_new
//export double FMODGroupGetPaused(double group)


//This gets the group paused (0, 1 (paused)) groups: 0-Master (Global), 1-priority, 2-effects, 3-ambientmusic, 4-ambient effects

return external_call(global.dll_FMODGroupGetPaused,argument0);

#define FMODGroupSetMuted_new
//export double FMODGroupSetMuted(double group, double mute)
//Mutes/unmutes the specified group (1-4) does not affect individual settings of instances
return external_call(global.dll_FMODGroupSetMuted,argument0,argument1);

#define FMODGroupGetMuted_new
//export double FMODGroupGetMuted(double group)


//This gets the group mute (0, 1 (paused)) groups: 0-Master (Global), 1-priority, 2-effects, 3-ambientmusic, 4-ambient effects

return external_call(global.dll_FMODGroupGetMuted,argument0);

#define FMODGroupSetFrequency_new
//export double FMODGroupSetFrequency(double group, double freq)

//Set the group frequency. 44100 is usually the defaul frequency
//Regular Groups are 1-4. 0 for the master group. Useful for bullet time on all sounds
//Carefull, this overrides the instance frequency too and you may not be able to reset it to normal
//See Also FMODGroupSetPitch
return external_call(global.dll_FMODGroupSetFrequency,argument0,argument1);

#define FMODGroupSetPan_new
//export double FMODGroupSetPan(double group, double pan)

//Set the group pan. -1(left) to 0 (center) to 1 (right)
//Regular Groups are 1-4. 0 for the master group. 
//Carefull, this overrides the instance and group pans too
return external_call(global.dll_FMODGroupSetPan,argument0,argument1);

#define FMODGroupFadeVolume_new
//FMODGroupFadeVolume(group,targetvolume,numframes)
//group 0 for all, 1-4 for a specific group
//target volume the volume to go to
//numframes. The number of frames the effect will take place
//    use room_speed*2 for 2 seconds

var d;
d = argument1
var i;
//if(argument0 = 0)
{
    i = (d-FMODGroupGetVolume(argument0))/(argument2+1);
    with(FMODFaderObj)
    {
        if(group = argument0 and isinst = false)
        {
            inc = max(abs(inc),abs(i))*sign(i);
            dest = d;
            exit
        }
    }
    with(instance_create(0,0,FMODFaderObj))
    {
        inc = i;
        dest = d;
        instvol = FMODGroupGetVolume(argument0);
        group = argument0;
        exit;
    }
}

#define FMODGroupFadePitch_new
//FMODGroupFadePitch(group,targetfreq,numframes)
//group 0 for all, 1-4 for a specific group
//target Frequency the Frequency to go to
//numframes. The number of frames the effect will take place
//    use room_speed*2 for 2 seconds

var d;
d = argument1
var i;
if(argument0 >= 0 and argument0 <=4)
{
    i = (d-FMODGroupGetPitch(argument0 ))/(argument2+1);
    with(FMODPitchFaderObj)
    {
        if(group = argument0 and isinst = false)
        {
            inc = max(abs(inc),abs(i))*sign(i);
            dest = d;
            exit
        }
    }
    with(instance_create(0,0,FMODPitchFaderObj))
    {
        inc = i;
        dest = d;
        instpitch = FMODGroupGetPitch(argument0 )
        group = argument0;
        exit;
    }
}

#define FMODGroupFadePan_new
//FMODGroupFadePan(instance, currentpan, targetpan,numframes, updatecode)
//instance is the instance to fade
//target pan the pan to go to
//numframes. The number of frames the effect will take place
//    use room_speed*2 for 2 seconds
//Current pan is the instance's current volume to prevent
//burst of sounds. If you dont know it try 0 if fading from an unknown pan to 1 or -1
//updatecode (optional) is the code to call to update your pan variable
// it has the form of "with(100010 /*YourInstanceID*/) {YourVariableName = other.curpan;}"}
// or "global.thevariablename = curpan;"
var d;
d = argument2
var i;
//if(argument0 > 0)
{
    d = max(-1,min(d,1))+1;
    i = (d-(argument1+1))/(argument3+1);
    with(FMODPanFaderObj)
    {
        if(group = argument0 and isinst = false)
        {
            inc = max(abs(inc),abs(i))*sign(i);
            dest = d;
            exit
        }
    }
    with(instance_create(0,0,FMODPanFaderObj))
    {
        inc = i;
        dest = d;
        curpan = argument1+1;
        group = argument0;
        code = ""
        if(is_string(argument4)) code = string(argument4)
        //isinst = true;
        exit;
    }
}

#define FMODGroupGetWaveSnapshot_new
//export double FMODGroupGetWaveSnapshot(double group, double channel, double size, LPSTR Buffer)
//returns 0 on error
//returns  on success
//Group is the sound group, 0 Master, 1- priority, 2 Effect, 3 Ambiant Music, 4 Ambiant effects
//Channel is the sound channel (FMODSoundGetNumChannels to figure how many channels you need to fetch)
//It's usually good enough to get channel 0 (for mono sounds or left channel for stereo sounds) 1 is right, 2 and higher are the other channels if any
//size is the size of the buffer... keep it 2^n 32,64,128.... 16384(max)

//var buf;
global.FMODbuf = string_repeat(chr(0), argument2+1);
//Gets the wave snapshot into a string buffer
//Each character is a value from 0to 255 to represent the wave played (not the full wave, just the portion being played)
//buffer = FMODGroupGetWaveSnapshot(0,0, 256)
//The bigger the sample size the more accurate the reading. Though FMOD documentation does not specify
//if the sample size corresponds to the smapshot window width or the precision of the snapshot.

//the flatline is at char 127. 127-n is the -crest 127+n is the +crest of the wave form

//NOTE BECAUSE OF A GM BUG REGARDING LEAKS RETURNING STRINGS
//global.FMODbuf is now used
//Use ord(string_char_at(global.FMODbuf,<<1 to size>>)) to access values

//If you need to average left and right channels create a more accurate display of both channels in one screen 
//you will need to call this twice (with 0 then with 1) then loop through each value, add them together and divide by 2
//The demo draws both left and right individually

return external_call(global.dll_FMODGroupGetWaveSnapshot,argument0,argument1,argument2,global.FMODbuf);
//return buf;

#define FMODGroupGetSpectrumSnapshot_new
//export double FMODGroupGetSpectrumSnapshot(double group, double channel, double size, LPSTR Buffer)
//returns 0 on error
//returns maxv on success (so, the return of 0 could be an error or maxv)

//Group is the sound group, 0 Master, 1- priority, 2 Effect, 3 Ambiant Music, 4 Ambiant effects
//Channel is the sound channel (FMODSoundGetNumChannels to figure how many channels you need to fetch)
//It's usually good enough to get channel 0 (for mono sounds or left channel for stereo sounds) 1 is right, 2 and higher are the other channels if any
//size is the size of the buffer... keep it 2^n 64,128.... Min = 64. Max = 8192
//var buf;
global.FMODbuf = string_repeat(chr(0), argument2+1);
//Gets the spectrum snapshot into a string buffer
//Each character is a value from 0to 255 to represent the spectrum played 
//FMODGroupGetSpectrumSnapshot(0,0, 256)

//NOTE BECAUSE OF A GM BUG REGARDING LEAKS RETURNING STRINGS
//global.FMODbuf is now used

//Use ord(string_char_at(global.FMODBuf,<<1 to size>>)) to access values
//If you need to average left and right channels create a more accurate display of both channels in one screen 
//you will need to call this twice (with 0 then with 1) then loop through each value, add them together and divide by 2
//The demo draws both left and right individually
//NOTE for drawing... If the sound is 41000 or 48000, consider asking for 256 bytes but display only the first 128
//like the demo does...That will draw frequencies 0 to 22KHz, the commun hearing frequencies

//The function normalises the values... That is the highest value will always be 255... 
//This ensures your will get the maximum range possible. Done in the Dll this is faster 
//than GM would do it with strings. Since I figure most poeple will want this on default...
//However, the retun call of the DLL function returns the max value and I stuff it in a member
//variable FMODMaxV so you may un-normalize the data if you need to using

//NOTE BECAUSE OF A GM BUG REGARDING LEAKS RETURNING STRINGS
//global.FMODbuf is now used
//ord(string_char_at(global.FMODBuf,<<1 to size>>))*FMODMaxV
FMODMaxV = external_call(global.dll_FMODGroupGetSpectrumSnapshot,argument0,argument1,argument2,global.FMODbuf);
return FMODMaxV;

#define FMODGroupGetWaveSnapshot2_new
//export double FMODGroupGetWaveSnapshot2(double group, double channel, double size)
//This function stores data to a memory buffer which you can manipulate for better
//range using FMODNormalizeWaveData and read using 
//FMODGetWaveBuffer and FMODGetSnapshotEntry
//returns 0 on error
//group is the sound group 0-4
//Channel is the sound channel (FMODSoundGetNumChannels to figure how many channels you need to fetch)
//It's usually good enough to get channel 0 (for mono sounds or left channel for stereo sounds) 1 is right, 2 and higher are the other channels if any
//size is the size of the buffer... keep it 2^n 32,64,128.... 16384(max)

//The bigger the sample size the more accurate the reading. Though FMOD documentation does not specify
//if the sample size corresponds to the smapshot window width or the precision of the snapshot.

//use FMODGetSnapshotEntry(pos) to get the data points 
//each point is a value from -1 to 1 representing the waveform crest point position

return external_call(global.dll_FMODGroupGetWaveSnapshot2,argument0,argument1,argument2);

#define FMODGroupGetSpectrumSnapshot2_new
//export double FMODGroupGetSpectrumSnapshot2(double group, double channel, double size)
//This function stores data to a memory buffer which you can manipulate for better
//range using FMODNormalizeSpectrumData and read using 
//FMODGetSpectrumBuffer and FMODGetSnapshotEntry

//returns 0 on error
//returns 1 on success
//group is the sound group 0-4
//Channel is the sound channel (FMODSoundGetNumChannels to figure how many channels you need to fetch)
//It's usually good enough to get channel 0 (for mono sounds or left channel for stereo sounds) 1 is right, 2 and higher are the other channels if any
//size is the size of the buffer... keep it 2^n 64,128.... Min = 64. Max = 8192

//Gets the spectrum snapshot into a string buffer
//If you need to average left and right channels create a more accurate display of both channels in one screen 
//you will need to call this twice (with 0 then with 1) then loop through each value, add them together and divide by 2
//The demo draws both left and right individually
//NOTE for drawing... If the sound is 41000 or 48000, consider asking for 256 bytes but display only the first 128
//like the demo does...That will draw frequencies 0 to 22KHz, the commun hearing frequencies

//The function does NOT normalize the values... 
//use FMODNormalizeSpectrumData() to do that

//use FMODGetSnapshotEntry(pos) to get the data points 
//each point is a value from 0 to 1 representing the spectrum value (volume at relative frequency)

return external_call(global.dll_FMODGroupGetSpectrumSnapshot2,argument0,argument1,argument2);

#define FMODListenerSetNumber_new
//export double FMODListenerSetNumber(double number)

//Use this to set the number of listener in the game room
//A listenner is usally a player... Player 2 can be another listener
// A listener can also be a "game microphone" in the room, hearing 
// the sounds in the room and playing them on the speaker.

//You can have up to 4 listeners in the room
//When there are more than 1 listener, the doppler effects are disabled
return external_call(global.dll_FMODListenerSetNumber,argument0);

#define FMODListenerSet3dPosition_new
//export double FMODListenerSet3dPosition(double number, double x, double y, double z)
//Sets the litenner position in the room
//number is the listenner id (1 to 4) to position
//See FMODUpdate for important information

//in player 1 end step
//FMODListenerSet3dPosition(1,x,y,0);

//in player 2 end step
//FMODListenerSet3dPosition(2,x,y,0);


return external_call(global.dll_FMODListenerSet3dPosition,argument0,argument1,argument2,argument3);

#define FMODListenerSet3dPositionEx_new
//export double FMODListenerSet3dPositionEx(double number, double x, double y, double z, double fx, double fy, double fz, double ux, double uy, double uz)

//the extended version of FMODListenerSet3dPosition so you can do your 3d FPS setup

//Sets the litenner position in the room
//number is the listenner id (1 to 4) to position
//x,y,z are to world relative positions
//fx,fy,fz are the foreward directions in vectors 
//ux,uy,uz are the up direction in vertors 

//Dont ask me how it works, it depends on your game and how sound relates to the player
//It took me a while to tweak those values for top down and platform games
// (My IQ is that of a plant when it come to those)
//I assume you can use sin and cos degetorad(image_angle) in the right spots
//Internally, these values are 
//FMOD_VECTOR forward {x,y,z}       = { 0.0f, 0.0f, -1.0f };
//FMOD_VECTOR up {x,y,z}            = { 0.0f, -1.0f, 0.0f };
//For non stereoscopic 3d sound to player relationship (FMODListenerHearsDistanceOnly(1,true))
//FMOD_VECTOR up {x,y,z}            = { 0.0f, 0.0f, 0.0f };
//See FMODUpdate3dPositions for important information

//So, be aware that this may affect (override) the stereoscopic cancelation of 3d sounds
//set by MODSet3dDistanceOnly(true)

//This is the description from the FMOD documentation 'cause I cant explain it any better

//pos (x,y,z)
//Position of the listener in world space, measured in distance units. 

//forward (fx,fy,fz)
//The forwards orientation of the listener. This vector must be of unit length 
//and perpendicular to the up vector. 

//up (ux,uy,uz)
//The upwards orientation of the listener. This vector must be of unit length 
//and perpendicular to the forwards vector. 
 
//Remarks

//By default, FMOD uses a left-handed co-ordinate system. 
//This means +X is right, +Y is up, and +Z is forwards.

//To map to another coordinate system, flip/negate and exchange these values.

//Orientation vectors are expected to be of UNIT length. This means the magnitude of the vector should be 1.0.

//Yeah... very useful... thanks... As you can see, for these guys, 3d is so second nature that their
//explaination is useless unless you already know how it works. It basically fails to explain how to 
//set the vectors. And I can't help you with those either.


//in player 1 end step
//FMODListenerSet3dPositionEx(1, x,y,0, 0,0,-1, 0,-1,0);

//in player 2 end step
//FMODListenerSet3dPositionEx(2, x,y,0, 0,0,-1, 0,-1,0);


return external_call(global.dll_FMODListenerSet3dPositionEx,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);

#define FMODListenerHearsDistanceOnly_new
//export double FMODListenerHearsDistanceOnly(double listener, double truefalse)

//Call this if you want to enable x,y,z relative 3d sounds
//listener is the id (1-4) of the listener
// true is default. 3d sounds will fade in and out but their relative position will not register in the speakers
// false, the 3d sounds will appear to eminated from the left when the sound is on the left, right if on the right giving a better idea where the sound is comming from
// this has no effect to the sounds stereo quality, only it's position
return external_call(global.dll_FMODListenerHearsDistanceOnly,argument0,argument1);

#define FMODSetDopplerFPS_new
//export double FMODSetDopplerFPS(double fps)

//Sets the sound system's framespersecond value to use in doppler effect calculations
//fps is the frame per second of your game. (room_speed or fps)
//set to 0 (default) to disable the doppler effect

//You may play with this value to achive the right doppler effect for your game
//though using wolrd scale is recommended
return external_call(global.dll_FMODSetDopplerFPS,argument0);

#define FMODSetWorldScale_new
//export double FMODSetWorldScale(double scale)
//Sets the scale of the worls.
//Default scale is 1 meter per pixel
//it affects the doppler effect
//if your player moves 3 pixels in one second
//it will appear to the sound system as though he moved
//3 meters per second 
//reduce the value to reduce the overall doppler effects in the game

return external_call(global.dll_FMODSetWorldScale,argument0);

#define FMODSetPassword_new
//export double FMODSetPassword(LPCSTR password)
//Sets the password to use for encrypted sound files
//Call this from the start if all your sounds have the same password
//or before SoundAdd if your sounds have different passwords
//Password does not affect non encrypted files
return external_call(global.dll_FMODSetPassword,argument0);

#define FMODBlockersInit_new
//export double FMODBlockersInit(double NumBlockers, double xs, double ys, double zs)

//Blockers block sounds in the game, useful for walls, windows and other things

//This turns the blocker feature on. Call it before you play any sounds
//NumBlockers specifies the number of blocker in the room try to match your game and not to create too many blockers
//xs is the room width
//ys is the room height
//zs is the zspace (use 0) if not room
//The system actualy makes an equilateral cube region the size of the biggest s value.
//FMOD warns not to set these to a "too large" value with no mention what a "too large" value is
//Call it when the room starts with numblockes set to your wall count + door count + window count
//See FMODBlockersAddGMObjects to add your object to the system easily
//FMODBlockersInit(instance_number(wallsobj) + instance_number(doorsobj),room_width,room_height,0);
return external_call(global.dll_FMODBlockersInit,argument0,argument1,argument2,argument3);

#define FMODBlockersFree_new
//export double FMODBlockersFree()
//Blockers block sounds in the game, useful for walls, windows and other things

//This turns the blocker feature off and frees all the added blockers. Call it when the room ends

return external_call(global.dll_FMODBlockersFree);

#define FMODBlockersAddGMObjects_new
//FMODBlockerAddGMObjects (ObjectIndex or instance ID)
//adds all the objects of type ObjectIndex or the instance ID to the blocker system
with(argument0)
{
    //var binstance;
    binstance = FMODBlockerAdd(x,y,0,bbox_left,bbox_top,-10,bbox_right-1,bbox_bottom-1,10);
    //show_message(FMODErrorStr(FMODGetLastError()));
    //show_message(string(binstance ));
}

#define FMODBlockerAdd_new
//export double FMODBlockerAdd(double x, double y, double z, double xs, double ys, double zs, double xe, double ye, double ze)
//Blockers block sounds in the game, useful for walls, windows and other things

//Adds a blocker to the system
//Returns the blockerID to use with any move functions... Usedful for moving doors or fading blockers
//x,y,z are the position of your object
//xs,ys,zs are the start position of the cube
//xe,ye,ze are the end position of the cube
//Blockers are destroyed when you call FMODBlockersFree()
//On default, the blocker will be full on. You can reduce this using the blocker instance
//FMODBlockersInit(instance_number(wallsobj) + instance_number(doorsobj),room_width,room_height,0);
//binstance = FMODBlockerAdd(x,y,0,bbox_left,bbox_top,0,bbox_right,bbox_bottom,0);
//see also FMODBlockersAddGMObjects()
return external_call(global.dll_FMODBlockerAdd, argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);

#define FMODBlockerSet3dPosition_new
//export double FMODBlockerSet3dPosition(double blocker, double x, double y, double z)
//Blockers block sounds in the game, useful for walls, windows and other things

//Sets the position of a blocker in the room. Useful to slide doors
//binstance = FMODBlockerAdd(x,y,0,bbox_left,bbox_top,0,bbox_right,bbox_bottom,0);
//FMODBlockerSet3dPosition(binstance, x, y, 0)
return external_call(global.dll_FMODBlockerSet3dPosition, argument0, argument1, argument2, argument3);

#define FMODBlockerSet3dOrientation_new
//export double FMODBlockerSet3dOrientation(double blocker, double fx, double fy, double fz, double ux, double uy, double uz)
//Blockers block sounds in the game, useful for walls, windows and other things

//Sets the orientation of a blocker in the room. Useful to rotate doors
//binstance = FMODBlockerAdd(x,y,0,bbox_left,bbox_top,0,bbox_right,bbox_bottom,0);
//fx,fy,fz are the facing direction vectors
//ux,uy,uz are the upward direction vectors
//Dont ask me to explain vectors... See ListenerSet3dPositionEx
//the default vectors are set for a 2d game and are
//TODO Defaults here
//FMODBlockerSet3dOrientation(binstance, 1,0,1,0,1,0)
return external_call(global.dll_FMODBlockerSet3dOrientation, argument0, argument1, argument2, argument3, argument4, argument5, argument6);

#define FMODBlockerSet3dScale_new
//export double FMODBlockerSet3dScale(double blocker, double sx, double sy, double sz)
//Blockers block sounds in the game, useful for walls, windows and other things

//Sets the size of a blocker. You can match your image_x/yscale Just make sure you 
//added the blocker when the image_scale was 1 if you do.

//FMODBlockerSet3dScale(binstance, image_xscale, image_yscale, 0)
return external_call(global.dll_FMODBlockerSet3dScale, argument0, argument1, argument2, argument3);

#define FMODBlockerSetEnabled_new
//export double FMODBlockerSetEnabled(double blocker, double enabled)
//Blockers block sounds in the game, useful for walls, windows and other things

//Turns a blocker ON OFF. Useful is a wall is destroyed

//FMODBlockerSetEnabled(binstance, false)
return external_call(global.dll_FMODBlockerSetEnabled, argument0, argument1);

#define FMODBlockerGetEnabled_new
//export double FMODBlockerGetEnabled(double blocker)
//Blockers block sounds in the game, useful for walls, windows and other things

//Returns true if a blocker is ON, false if not.

//Example to toggle on off
//FMODBlockerSetEnabled(binstance,!FMODBlockerGetEnabled(binstance))
return external_call(global.dll_FMODBlockerGetEnabled, argument0);

#define FMODBlockerGetStrength_new
//export double FMODBlockerGetStrength(double blocker)
//Blockers block sounds in the game, useful for walls, windows and other things

//Returns the strength of a blocker. 0-no blocking, .5 half blocking 1 full blocking
//Example fading
//FMODBlockerSetStrength(binstance,FMODBlockerGetStrength(binstance)-.01);
return external_call(global.dll_FMODBlockerGetStrength, argument0);

#define FMODBlockerSetStrength_new
//export double FMODBlockerSetStrength(double blocker,double strength)
//Blockers block sounds in the game, useful for walls, windows and other things

//Sets the strength of a blocker. 0-no blocking, .5 half blocking 1 full blocking
//Example fading
//FMODBlockerSetStrength(binstance,FMODBlockerGetStrength(binstance)-.01);

return external_call(global.dll_FMODBlockerSetStrength, argument0,argument1);

#define FMODInstanceAddEffect_new
//export double FMODInstanceAddEffect(double sound, double effects)
//effect (0 on fail) = FMODInstanceAddEffect(double intance, double effect)

//Adds an FMOD effect to an instance
//Effects
//    FMOD_DSP_TYPE_MIXER,          1    /* This unit does nothing but take inputs and mix them together then feed the result to the soundcard unit. */
//    FMOD_DSP_TYPE_OSCILLATOR,     2    /* This unit generates sine/square/saw/triangle or noise tones. */
//    FMOD_DSP_TYPE_LOWPASS,        3    /* This unit filters sound using a high quality, resonant lowpass filter algorithm but consumes more CPU time. */
//    FMOD_DSP_TYPE_ITLOWPASS,      4    /* This unit filters sound using a resonant lowpass filter algorithm that is used in Impulse Tracker, but with limited cutoff range (0 to 8060hz). */
//    FMOD_DSP_TYPE_HIGHPASS,       5    /* This unit filters sound using a resonant highpass filter algorithm. */
//    FMOD_DSP_TYPE_ECHO,           6    /* This unit produces an echo on the sound and fades out at the desired rate. */
//    FMOD_DSP_TYPE_FLANGE,         7    /* This unit produces a flange effect on the sound. */
//    FMOD_DSP_TYPE_DISTORTION,     8    /* This unit distorts the sound. */
//    FMOD_DSP_TYPE_NORMALIZE,      9    /* This unit normalizes or amplifies the sound to a certain level. */
//    FMOD_DSP_TYPE_PARAMEQ,        10    /* This unit attenuates or amplifies a selected frequency range. */
//    FMOD_DSP_TYPE_PITCHSHIFT,     11    /* This unit bends the pitch of a sound without changing the speed of playback. */
//    FMOD_DSP_TYPE_CHORUS,         12    /* This unit produces a chorus effect on the sound. */
//    FMOD_DSP_TYPE_REVERB,         13    /* This unit produces a reverb effect on the sound. */
//    FMOD_DSP_TYPE_VSTPLUGIN,      14    /* This unit allows the use of Steinberg VST plugins */
//    FMOD_DSP_TYPE_WINAMPPLUGIN,   15    /* This unit allows the use of Nullsoft Winamp plugins */
//    FMOD_DSP_TYPE_ITECHO,         16    /* This unit produces an echo on the sound and fades out at the desired rate as is used in Impulse Tracker. */
//    FMOD_DSP_TYPE_COMPRESSOR,     17    /* This unit implements dynamic compression (linked multichannel, wideband) */
//    FMOD_DSP_TYPE_SFXREVERB,      18    /* This unit implements SFX reverb */
//    FMOD_DSP_TYPE_LOWPASS_SIMPLE, 19    /* This unit filters sound using a simple lowpass with no resonance, but has flexible cutoff and is fast. */

//Use this to dynamicaly add effects to a playing instance.
//Usefull for temporary effects. Like when in water or like Guitar Hero in power up mode
//You can add as many effects as you want as long as you keep track and free each effect added

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 5);
//...
// //later
//FMODEffectFree(effect)

//The effect is removed when you call FMODEffectFree(effect)
//You must free the effect when done with it or when the instance is done playing

return external_call(global.dll_FMODInstanceAddEffect,argument0,argument1);

#define FMODGroupAddEffect_new
//export double FMODGroupAddEffect(double group, double effects)
//effect (0 on fail) = FMODGroupAddEffect(1, 5)

//Adds an FMOD effect to a group
//Effects
//    FMOD_DSP_TYPE_MIXER,          1    /* This unit does nothing but take inputs and mix them together then feed the result to the soundcard unit. */
//    FMOD_DSP_TYPE_OSCILLATOR,     2    /* This unit generates sine/square/saw/triangle or noise tones. */
//    FMOD_DSP_TYPE_LOWPASS,        3    /* This unit filters sound using a high quality, resonant lowpass filter algorithm but consumes more CPU time. */
//    FMOD_DSP_TYPE_ITLOWPASS,      4    /* This unit filters sound using a resonant lowpass filter algorithm that is used in Impulse Tracker, but with limited cutoff range (0 to 8060hz). */
//    FMOD_DSP_TYPE_HIGHPASS,       5    /* This unit filters sound using a resonant highpass filter algorithm. */
//    FMOD_DSP_TYPE_ECHO,           6    /* This unit produces an echo on the sound and fades out at the desired rate. */
//    FMOD_DSP_TYPE_FLANGE,         7    /* This unit produces a flange effect on the sound. */
//    FMOD_DSP_TYPE_DISTORTION,     8    /* This unit distorts the sound. */
//    FMOD_DSP_TYPE_NORMALIZE,      9    /* This unit normalizes or amplifies the sound to a certain level. */
//    FMOD_DSP_TYPE_PARAMEQ,        10    /* This unit attenuates or amplifies a selected frequency range. */
//    FMOD_DSP_TYPE_PITCHSHIFT,     11    /* This unit bends the pitch of a sound without changing the speed of playback. */
//    FMOD_DSP_TYPE_CHORUS,         12    /* This unit produces a chorus effect on the sound. */
//    FMOD_DSP_TYPE_REVERB,         13    /* This unit produces a reverb effect on the sound. */
//    FMOD_DSP_TYPE_VSTPLUGIN,      14    /* This unit allows the use of Steinberg VST plugins */
//    FMOD_DSP_TYPE_WINAMPPLUGIN,   15    /* This unit allows the use of Nullsoft Winamp plugins */
//    FMOD_DSP_TYPE_ITECHO,         16    /* This unit produces an echo on the sound and fades out at the desired rate as is used in Impulse Tracker. */
//    FMOD_DSP_TYPE_COMPRESSOR,     17    /* This unit implements dynamic compression (linked multichannel, wideband) */
//    FMOD_DSP_TYPE_SFXREVERB,      18    /* This unit implements SFX reverb */
//    FMOD_DSP_TYPE_LOWPASS_SIMPLE, 19    /* This unit filters sound using a simple lowpass with no resonance, but has flexible cutoff and is fast. */

//Use this to dynamicaly add effects to a group.
//Usefull for temporary effects. Like when in water or like Guitar Hero in power up mode
//You can add as many effects as you want as long as you keep track and free each effect added


//sound = FMODSoundAdd("gunshot.wav")
//FMODSoundSetGroup(sound,1);
//effect = FMODGroupAddEffect(1, 5);
//instance = FMODSoundPlay(sound);
//...
// //later
//FMODEffectFree(effect)

//The effect is removed when you call FMODEffectFree(effect)
//You must free the effect when done with it or when the instance is done playing

return external_call(global.dll_FMODGroupAddEffect,argument0,argument1);

#define FMODEffectFree_new
//export double FMODEffectFree(double effect)
//This function stops and frees an effect from memory

//FMODEffectFree(effect);
//effect = 0; //this prevents from accidently using the effect

//returns 0 on error (sound is being played by an instance)
//return 1 on success 

//sound = FMODSoundAdd("gunshot.wav")
//FMODSoundSetGroup(sound,1);
//effect = FMODGroupAddEffect(1, 5);
//instance = FMODSoundPlay(sound);
//effect2 = FMODInstanceAddEffect(instance, 3);

//...
// //later
//FMODEffectFree(effect)
//FMODEffectFree(effect2)

return external_call(global.dll_FMODEffectFree,argument0);

#define FMODEffectGetNumParams_new
//export double FMODEffectGetNumParams(double effect)
//This function gets the number of parameters of the effect

//n = FMODEffectGetNumParams(effect);

//returns the numebr of parameters

//You dont really need this if you know (using the demo)
//  the parameter id of the parameter you want to change

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//numeff = FMODEffectGetNumParams(effect)

//...
// //later
//FMODEffectFree(effect)

return external_call(global.dll_FMODEffectGetNumParams,argument0);

#define FMODEffectGetParamValue_new
//export double FMODEffectGetParamValue(double effect, double p)
//This function gets the parameter value of the effect

//n = FMODEffectGetParamValue(effect,0);

//returns the value of effect parameters

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//v = FMODEffectGetParamValue(effect,1)

//...
// //later
//FMODEffectFree(effect)

return external_call(global.dll_FMODEffectGetParamValue,argument0, argument1);

#define FMODEffectSetParamValue_new
//export double FMODEffectSetParamValue(double effect, double p, double v)
//This function set the parameter value of the effect to the value specified (v)

//n = FMODEffectGetParamValue(effect,0);

//returns the value of effect parameters

//each effect have different parameter that have different ranges in values
//You can figure out the parameter id and values in the demo

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//FMODEffectSetParamValue(effect,1,.5)

//...
// //later
//FMODEffectFree(effect)

return external_call(global.dll_FMODEffectSetParamValue,argument0, argument1, argument2);

#define FMODEffectGetParamValueStr_new
//export double FMODEffectGetParamValueStr(double effect, double p)
//This function gets the parameter value of the effect in a string 

//n = FMODEffectGetParamValueStr(effect,0);

//returns the value of effect parameters

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//vs = FMODEffectGetParamValueStr(effect,1)

//...
// //later
//FMODEffectFree(effect)
var s;
s = string_repeat(chr(0),20)
external_call(global.dll_FMODEffectGetParamValueStr,argument0, argument1,s);
return s;

#define FMODEffectGetParamName_new
//export double FMODEffectGetParamName(double effect, double p)
//This function gets the parameter name in a string 

//n = FMODEffectGetParamName(effect,0);

//returns the value of effect parameters

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//nm = FMODEffectGetParamName(effect,1)

//...
// //later
//FMODEffectFree(effect)
var s;
s = string_repeat(chr(0),20)
external_call(global.dll_FMODEffectGetParamName,argument0, argument1,s);
return s;

#define FMODEffectGetParamLabel_new
//export double FMODEffectGetParamLabel(double effect, double p)
//This function gets the parameter label in a string 

//n = FMODEffectGetParamValueStr(effect,0);

//returns the label of the parameters

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//lb= FMODEffectGetParamLabel(effect,1)

//...
// //later
//FMODEffectFree(effect)
var s;
s = string_repeat(chr(0),20)
external_call(global.dll_FMODEffectGetParamLabel,argument0, argument1,s);
return s;

#define FMODEffectGetParamDesc_new
//export double FMODEffectGetParamDesc(double effect, double p)
//This function gets the parameter description of the effect in a string 

//n = FMODEffectGetParamDesc(effect,0);

//returns the description of the parameter

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//desc = FMODEffectGetParamDesc(effect,1)

//...
// //later
//FMODEffectFree(effect)
var s;
s = string_repeat(chr(0),257)
external_call(global.dll_FMODEffectGetParamDesc,argument0, argument1,s);
return s;

#define FMODEffectGetParamMin_new
//export double FMODEffectGetParamMin(double effect, double p)
//This function gets the parameter min value of the effect

//n = FMODEffectGetParamMin(effect,0);

//returns the min value of effect parameters

//each effect have different parameter that have different ranges in values
//You can figure out the parameter id and values in the demo


//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//vmin = FMODEffectGetParamMin(effect,1)

//...
// //later
//FMODEffectFree(effect)

return external_call(global.dll_FMODEffectGetParamMin,argument0, argument1);

#define FMODEffectGetParamMax_new
//export double FMODEffectGetParamMax(double effect, double p)
//This function gets the parameter max value of the effect

//n = FMODEffectGetParamMax(effect,0);

//returns the max value of effect parameters

//each effect have different parameter that have different ranges in values
//You can figure out the parameter id and values in the demo


//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//vmax = FMODEffectGetParamMax(effect,1)

//...
// //later
//FMODEffectFree(effect)

return external_call(global.dll_FMODEffectGetParamMax,argument0, argument1);

#define FMODEffectGetActive_new
//export double FMODEffectGetActive(double effect)
//This function checks if the effect is active

//true/false = FMODEffectGetActive(effect);

//returns 0 on error or not active
//return 1 if active 

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//FMODEffectSetActive(effect,false)
//active = FMODEffectGetActive(effect)

//...
// //later
//FMODEffectFree(effect)

//Use the Bypass method instead. 

return external_call(global.dll_FMODEffectGetActive,argument0);

#define FMODEffectSetActive_new
//export double FMODEffectSetActive(double effect, double active)
//This function sets the effect active or disabled

//FMODEffectSetActive(effect, true/false);

//return 1 if success 

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//FMODEffectSetActive(effect,false)
//active = FMODEffectGetActive(effect)

//...
// //later
//FMODEffectFree(effect)

//Use the Bypass method. this actually stops the sound instance from playing

return external_call(global.dll_FMODEffectSetActive,argument0, argument1);

#define FMODEffectGetBypass_new
//export double FMODEffectGetBypass(double effect)
//This function checks if the effect is bypassed

//true/false = FMODEffectGetBypass(effect);

//returns 0 on error or not active
//return 1 if active 

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//FMODEffectSetBypass(effect,false)
//active = FMODEffectGetBypass(effect)

//...
// //later
//FMODEffectFree(effect)

//You can deactivate effects instead of freeing them this whay you don't have to recreate it
//If you add multiple effect to a sound the effect are cumulative wich is usually what you want
//Removing the effect would cause the chain of effects to be changed and re-creating the effect
//would put it back but at the end of the chain. 

return external_call(global.dll_FMODEffectGetBypass,argument0);

#define FMODEffectSetBypass_new
//export double FMODEffectSetBypass(double effect, double bypass)
//This function disables the effect without turning off the playing chain

//FMODEffectSetBypass(effect, true/false); //true means OFF realy

//return 1 if success 

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//FMODEffectSetBypass(effect,false)
//active = FMODEffectGetBypass(effect)

//...
// //later
//FMODEffectFree(effect)

//You can deactivate effects instead of freeing them this way you don't have to recreate it
//If you add multiple effect to a sound the effect are cumulative which is usually what you want
//Removing the effect would cause the chain of effects to be changed and re-creating the effect
//would put it back but at the end of the chain.  So use this to deactivate the effect

return external_call(global.dll_FMODEffectSetBypass,argument0, argument1);

#define FMODEffectGetDefaultPan_new
//export double FMODEffectGetDefaultPan(double effect)
//This function gets the pan of the effect

//-1(left) to 1 right = FMODEffectGetDefaultPan(effect);

//returns the pan value

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//FMODEffectSetDefaultPan(effect,1)
//active = FMODEffectGetDefaultPan(effect)

//...
// //later
//FMODEffectFree(effect)

//Some effect can be panned (Have not found one that does though)

return external_call(global.dll_FMODEffectGetDefaultPan,argument0);

#define FMODEffectGetDefaultFr_new
//export double FMODEffectGetDefaultFr(double effect)
//This function gets the frequency of the effect

//-1(left) to 1 right = FMODEffectGetDefaultFr(effect);

//returns the frequency value

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//FMODEffectSetDefaultFr(effect,1)
//fr = FMODEffectGetDefaultFr(effect)

//...
// //later
//FMODEffectFree(effect)

//Have not tried this... 
//Expect same as pan and vol


return external_call(global.dll_FMODEffectGetDefaultFr,argument0);

#define FMODEffectSetDefaultFr_new
//export double FMODEffectSetDefaultFr(double effect, double frequency)
//This function gets the frequency of the effect

//success = FMODEffectSetDefaultFr(effect, -1 to 1);

//returns 0 on error
//return 1 on success

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//FMODEffectSetDefaultFr(effect,1)
//active = FMODEffectGetDefaultFr(effect)

//...
// //later
//FMODEffectFree(effect)

//Have not tried this... 
//Expect same as pan and vol


return external_call(global.dll_FMODEffectSetDefaultFr,argument0,argument1);

#define FMODEffectSetDefaultPan_new
//export double FMODEffectSetDefaultPan(double effect, double pan)
//This function gets the pan of the effect

//success = FMODEffectSetDefaultPan(effect, -1 to 1);

//returns 0 on error
//return 1 on success

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//FMODEffectSetDefaultPan(effect,1)
//active = FMODEffectGetDefaultPan(effect)

//...
// //later
//FMODEffectFree(effect)

//Some effect can be panned (Have not found one that does though)


return external_call(global.dll_FMODEffectSetDefaultPan,argument0,argument1);

#define FMODEffectGetDefaultVol_new
//export double FMODEffectGetDefaultVol(double effect)
//This function gets the pan of the effect

//0 to 1 = FMODEffectGetDefaultVol(effect);

//returns the volume value

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//FMODEffectSetDefaultVol(effect,1)
//active = FMODEffectGetDefaultVol(effect)

//...
// //later
//FMODEffectFree(effect)

//Some effect can be have the volume changed (Have not found one that does though)


return external_call(global.dll_FMODEffectGetDefaultVol,argument0);

#define FMODEffectSetDefaultVol_new
//export double FMODEffectSetDefaultVol(double effect, double vol)
//This function gets the pan of the effect

//success = FMODEffectGetDefaultVol(effect, 0 to 1);

//returns 0 on error, 1 on success

//sound = FMODSoundAdd("gunshot.wav")
//instance = FMODSoundPlay(sound);
//effect = FMODInstanceAddEffect(instance, 3);
//FMODEffectSetDefaultVol(effect,1)
//active = FMODEffectGetDefaultVol(effect)

//...
// //later
//FMODEffectFree(effect)

//Some effect can be have the volume changed (Have not found one that does though)



return external_call(global.dll_FMODEffectSetDefaultVol,argument0, argument1);

#define FMODEffectGetSpeakerActive_new
//export double FMODEffectGetSpeakerActive(double effect, double speaker)
//This function gets the if the effect is active on the speaker

//true/false = FMODEffectGetSpeakerActive(effect,speaker 0 to number of speakers);

//returns if the effect is active on the speaker


//Have not tried this


return external_call(global.dll_FMODEffectGetSpeakerActive,argument0, argument1);

#define FMODEffectSetSpeakerActive_new
//export double FMODEffectSetSpeakerActive(double effect, double speaker, double true/false)
//This function set the effect is active on the speaker

//FMODEffectSetSpeakerActive(effect,speaker 0 to number of speakers, true/flase);


//Have not tried this


return external_call(global.dll_FMODEffectSetSpeakerActive,argument0, argument1, argument2);

#define FMODEffectReset_new
//export double FMODEffectReset(double effect)
//Resets the effect

//FMODEffectReset(effect);

//According to the docs, this clears the effect from any remnent data
//which I now realize is only useful if you reuse the effect on another instance
//which my dll does not allow

return external_call(global.dll_FMODEffectReset,argument0);

#define FMODGetNumInstances_new
//returns the number of instances playing
//You can add watch and paste
//FMODGetNumInstances();
//in the debug window
return external_call(global.dll_FMODGetNumInstances);

#define FMODSoundIsStreamed_new
//Returns if a sound is streamed
//FMODSoundIsStreamed(sound)
return external_call(global.dll_FMODSoundIsStreamed,argument0);

#define FMODSoundInstanciate_new
//Do not use..
//FMODSoundInstanciate(sound)
return external_call(global.dll_FMODSoundInstanciate,argument0);

#define FMODSoundIs3d_new
//Returns if a sound is 3d
//FMODSoundIs3d(sound)
return external_call(global.dll_FMODSoundIs3d,argument0);

#define FMODErrorStr_new
//argument0 is a value from FMODGetLastError()
///FMOD_ErrorString
return external_call(global.dll_FMODGetErrorString,argument0);
//show_debug_message(FMODErrorStr(FMODGetLastError()))
var FMOD_OK,
    FMOD_ERR_ALREADYLOCKED,         /* Tried to call lock a second time before unlock was called. */
    FMOD_ERR_BADCOMMAND,            /* Tried to call a function on a data type that does not allow this type of functionality (ie calling Sound::lock on a streaming sound). */
    FMOD_ERR_CDDA_DRIVERS,          /* Neither NTSCSI nor ASPI could be initialised. */
    FMOD_ERR_CDDA_INIT,             /* An error occurred while initialising the CDDA subsystem. */
    FMOD_ERR_CDDA_INVALID_DEVICE,   /* Couldn't find the specified device. */
    FMOD_ERR_CDDA_NOAUDIO,          /* No audio tracks on the specified disc. */
    FMOD_ERR_CDDA_NODEVICES,        /* No CD/DVD devices were found. */ 
    FMOD_ERR_CDDA_NODISC,           /* No disc present in the specified drive. */
    FMOD_ERR_CDDA_READ,             /* A CDDA read error occurred. */
    FMOD_ERR_CHANNEL_ALLOC,         /* Error trying to allocate a channel. */
    FMOD_ERR_CHANNEL_STOLEN,        /* The specified channel has been reused to play another sound. */
    FMOD_ERR_COM,                   /* A Win32 COM related error occured. COM failed to initialize or a QueryInterface failed meaning a Windows codec or driver was not installed properly. */
    FMOD_ERR_DMA,                   /* DMA Failure.  See debug output for more information. */
    FMOD_ERR_DSP_CONNECTION,        /* DSP connection error.  Connection possibly caused a cyclic dependancy. */
    FMOD_ERR_DSP_FORMAT,            /* DSP Format error.  A DSP unit may have attempted to connect to this network with the wrong format. */
    FMOD_ERR_DSP_NOTFOUND,          /* DSP connection error.  Couldn't find the DSP unit specified. */
    FMOD_ERR_DSP_RUNNING,           /* DSP error.  Cannot perform this operation while the network is in the middle of running.  This will most likely happen if a connection or disconnection is attempted in a DSP callback. */
    FMOD_ERR_DSP_TOOMANYCONNECTIONS,/* DSP connection error.  The unit being connected to or disconnected should only have 1 input or output. */
    FMOD_ERR_FILE_BAD,              /* Error loading file. */
    FMOD_ERR_FILE_COULDNOTSEEK,     /* Couldn't perform seek operation.  This is a limitation of the medium (ie netstreams) or the file format. */
    FMOD_ERR_FILE_DISKEJECTED,      /* Media was ejected while reading. */
    FMOD_ERR_FILE_EOF,              /* End of file unexpectedly reached while trying to read essential data (truncated data?). */
    FMOD_ERR_FILE_NOTFOUND,         /* File not found. */
    FMOD_ERR_FILE_UNWANTED,         /* Unwanted file access occured. */
    FMOD_ERR_FORMAT,                /* Unsupported file or audio format. */
    FMOD_ERR_HTTP,                  /* A HTTP error occurred. This is a catch-all for HTTP errors not listed elsewhere. */
    FMOD_ERR_HTTP_ACCESS,           /* The specified resource requires authentication or is forbidden. */
    FMOD_ERR_HTTP_PROXY_AUTH,       /* Proxy authentication is required to access the specified resource. */
    FMOD_ERR_HTTP_SERVER_ERROR,     /* A HTTP server error occurred. */
    FMOD_ERR_HTTP_TIMEOUT,          /* The HTTP request timed out. */
    FMOD_ERR_INITIALIZATION,        /* FMOD was not initialized correctly to support this function. */
    FMOD_ERR_INITIALIZED,           /* Cannot call this command after System::init. */
    FMOD_ERR_INTERNAL,              /* An error occured that wasn't supposed to.  Contact support. */
    FMOD_ERR_INVALID_ADDRESS,       /* On Xbox 360, this memory address passed to FMOD must be physical, (ie allocated with XPhysicalAlloc.) */
    FMOD_ERR_INVALID_FLOAT,         /* Value passed in was a NaN, Inf or denormalized float. */
    FMOD_ERR_INVALID_HANDLE,        /* An invalid object handle was used. */
    FMOD_ERR_INVALID_PARAM,         /* An invalid parameter was passed to this function. */
    FMOD_ERR_INVALID_SPEAKER,       /* An invalid speaker was passed to this function based on the current speaker mode. */
    FMOD_ERR_INVALID_VECTOR,        /* The vectors passed in are not unit length, or perpendicular. */
    FMOD_ERR_IRX,                   /* PS2 only.  fmodex.irx failed to initialize.  This is most likely because you forgot to load it. */
    FMOD_ERR_MAXAUDIBLE,            /* Reached maximum audible playback count for this sound's soundgroup. */
    FMOD_ERR_MEMORY,                /* Not enough memory or resources. */
    FMOD_ERR_MEMORY_IOP,            /* PS2 only.  Not enough memory or resources on PlayStation 2 IOP ram. */
    FMOD_ERR_MEMORY_SRAM,           /* Not enough memory or resources on console sound ram. */
    FMOD_ERR_MEMORY_CANTPOINT,      /* Can't use FMOD_OPENMEMORY_POINT on non PCM source data, or non mp3/xma/adpcm data if FMOD_CREATECOMPRESSEDSAMPLE was used. */
    FMOD_ERR_NEEDS2D,               /* Tried to call a command on a 3d sound when the command was meant for 2d sound. */
    FMOD_ERR_NEEDS3D,               /* Tried to call a command on a 2d sound when the command was meant for 3d sound. */
    FMOD_ERR_NEEDSHARDWARE,         /* Tried to use a feature that requires hardware support.  (ie trying to play a VAG compressed sound in software on PS2). */
    FMOD_ERR_NEEDSSOFTWARE,         /* Tried to use a feature that requires the software engine.  Software engine has either been turned off, or command was executed on a hardware channel which does not support this feature. */
    FMOD_ERR_NET_CONNECT,           /* Couldn't connect to the specified host. */
    FMOD_ERR_NET_SOCKET_ERROR,      /* A socket error occurred.  This is a catch-all for socket-related errors not listed elsewhere. */
    FMOD_ERR_NET_URL,               /* The specified URL couldn't be resolved. */
    FMOD_ERR_NET_WOULD_BLOCK,       /* Operation on a non-blocking socket could not complete immediately. */
    FMOD_ERR_NOTREADY,              /* Operation could not be performed because specified sound is not ready. */
    FMOD_ERR_OUTPUT_ALLOCATED,      /* Error initializing output device, but more specifically, the output device is already in use and cannot be reused. */
    FMOD_ERR_OUTPUT_CREATEBUFFER,   /* Error creating hardware sound buffer. */
    FMOD_ERR_OUTPUT_DRIVERCALL,     /* A call to a standard soundcard driver failed, which could possibly mean a bug in the driver or resources were missing or exhausted. */
    FMOD_ERR_OUTPUT_FORMAT,         /* Soundcard does not support the minimum features needed for this soundsystem (16bit stereo output). */
    FMOD_ERR_OUTPUT_INIT,           /* Error initializing output device. */
    FMOD_ERR_OUTPUT_NOHARDWARE,     /* FMOD_HARDWARE was specified but the sound card does not have the resources nescessary to play it. */
    FMOD_ERR_OUTPUT_NOSOFTWARE,     /* Attempted to create a software sound but no software channels were specified in System::init. */
    FMOD_ERR_PAN,                   /* Panning only works with mono or stereo sound sources. */
    FMOD_ERR_PLUGIN,                /* An unspecified error has been returned from a 3rd party plugin. */
    FMOD_ERR_PLUGIN_MISSING,        /* A requested output, dsp unit type or codec was not available. */
    FMOD_ERR_PLUGIN_RESOURCE,       /* A resource that the plugin requires cannot be found. (ie the DLS file for MIDI playback) */
    FMOD_ERR_PLUGIN_INSTANCES,      /* The number of allowed instances of a plugin has been exceeded. */
    FMOD_ERR_RECORD,                /* An error occured trying to initialize the recording device. */
    FMOD_ERR_REVERB_INSTANCE,       /* Specified Instance in FMOD_REVERB_PROPERTIES couldn't be set. Most likely because another application has locked the EAX4 FX slot. */
    FMOD_ERR_SUBSOUNDS,             /* The error occured because the sound referenced contains subsounds.  (ie you cannot play the parent sound as a static sample, only its subsounds.) */
    FMOD_ERR_SUBSOUND_ALLOCATED,    /* This subsound is already being used by another sound, you cannot have more than one parent to a sound.  Null out the other parent's entry first. */
    FMOD_ERR_TAGNOTFOUND,           /* The specified tag could not be found or there are no tags. */
    FMOD_ERR_TOOMANYCHANNELS,       /* The sound created exceeds the allowable input channel count.  This can be increased using the maxinputchannels parameter in System::setSoftwareFormat. */
    FMOD_ERR_UNIMPLEMENTED,         /* Something in FMOD hasn't been implemented when it should be! contact support! */
    FMOD_ERR_UNINITIALIZED,         /* This command failed because System::init or System::setDriver was not called. */
    FMOD_ERR_UNSUPPORTED,           /* A command issued was not supported by this object.  Possibly a plugin without certain callbacks specified. */
    FMOD_ERR_UPDATE,                /* An error caused by System::update occured. */
    FMOD_ERR_VERSION,               /* The version number of this file format is not supported. */

    FMOD_ERR_EVENT_FAILED,          /* An Event failed to be retrieved, most likely due to 'just fail' being specified as the max playbacks behavior. */
    FMOD_ERR_EVENT_INTERNAL,        /* An error occured that wasn't supposed to.  See debug log for reason. */
    FMOD_ERR_EVENT_INFOONLY,        /* Can't execute this command on an EVENT_INFOONLY event. */
    FMOD_ERR_EVENT_MAXSTREAMS,      /* Event failed because 'Max streams' was hit when FMOD_INIT_FAIL_ON_MAXSTREAMS was specified. */
    FMOD_ERR_EVENT_MISMATCH,        /* FSB mis-matches the FEV it was compiled with. */
    FMOD_ERR_EVENT_NAMECONFLICT,    /* A category with the same name already exists. */
    FMOD_ERR_EVENT_NOTFOUND;        /* The requested event, event group, event category or event property could not be found. */

    FMOD_OK = 0;
    FMOD_ERR_ALREADYLOCKED=1;         /* Tried to call lock a second time before unlock was called. */
    FMOD_ERR_BADCOMMAND=2;            /* Tried to call a function on a data type that does not allow this type of functionality (ie calling Sound::lock on a streaming sound). */
    FMOD_ERR_CDDA_DRIVERS=3;          /* Neither NTSCSI nor ASPI could be initialised. */
    FMOD_ERR_CDDA_INIT=4;             /* An error occurred while initialising the CDDA subsystem. */
    FMOD_ERR_CDDA_INVALID_DEVICE=5;   /* Couldn't find the specified device. */
    FMOD_ERR_CDDA_NOAUDIO=6;          /* No audio tracks on the specified disc. */
    FMOD_ERR_CDDA_NODEVICES=7;        /* No CD/DVD devices were found. */ 
    FMOD_ERR_CDDA_NODISC=8;           /* No disc present in the specified drive. */
    FMOD_ERR_CDDA_READ=9;             /* A CDDA read error occurred. */
    FMOD_ERR_CHANNEL_ALLOC=10;         /* Error trying to allocate a channel. */
    FMOD_ERR_CHANNEL_STOLEN=11;        /* The specified channel has been reused to play another sound. */
    FMOD_ERR_COM=12;                   /* A Win32 COM related error occured. COM failed to initialize or a QueryInterface failed meaning a Windows codec or driver was not installed properly. */
    FMOD_ERR_DMA=13;                   /* DMA Failure.  See debug output for more information. */
    FMOD_ERR_DSP_CONNECTION=14;        /* DSP connection error.  Connection possibly caused a cyclic dependancy. */
    FMOD_ERR_DSP_FORMAT=15;            /* DSP Format error.  A DSP unit may have attempted to connect to this network with the wrong format. */
    FMOD_ERR_DSP_NOTFOUND=16;          /* DSP connection error.  Couldn't find the DSP unit specified. */
    FMOD_ERR_DSP_RUNNING=17;           /* DSP error.  Cannot perform this operation while the network is in the middle of running.  This will most likely happen if a connection or disconnection is attempted in a DSP callback. */
    FMOD_ERR_DSP_TOOMANYCONNECTIONS=18;/* DSP connection error.  The unit being connected to or disconnected should only have 1 input or output. */
    FMOD_ERR_FILE_BAD = 19;              /* Error loading file. Bad password/required password not set*/
    FMOD_ERR_FILE_COULDNOTSEEK=20;     /* Couldn't perform seek operation.  This is a limitation of the medium (ie netstreams) or the file format. */
    FMOD_ERR_FILE_DISKEJECTED=21;      /* Media was ejected while reading. */
    FMOD_ERR_FILE_EOF=22;              /* End of file unexpectedly reached while trying to read essential data (truncated data?). */
    FMOD_ERR_FILE_NOTFOUND=23;         /* File not found. */
    FMOD_ERR_FILE_UNWANTED=24;         /* Unwanted file access occured. */
    FMOD_ERR_FORMAT=25;                /* Unsupported file or audio format. */
    FMOD_ERR_HTTP=26;                  /* A HTTP error occurred. This is a catch-all for HTTP errors not listed elsewhere. */
    FMOD_ERR_HTTP_ACCESS=27;           /* The specified resource requires authentication or is forbidden. */
    FMOD_ERR_HTTP_PROXY_AUTH=28;       /* Proxy authentication is required to access the specified resource. */
    FMOD_ERR_HTTP_SERVER_ERROR=29;     /* A HTTP server error occurred. */
    FMOD_ERR_HTTP_TIMEOUT=30;          /* The HTTP request timed out. */
    FMOD_ERR_INITIALIZATION=31;        /* FMOD was not initialized correctly to support this function. */
    FMOD_ERR_INITIALIZED=32;           /* Cannot call this command after System::init. */
    FMOD_ERR_INTERNAL=33;              /* An error occured that wasn't supposed to.  Contact support. */
    FMOD_ERR_INVALID_ADDRESS=34;       /* On Xbox 360, this memory address passed to FMOD must be physical, (ie allocated with XPhysicalAlloc.) */
    FMOD_ERR_INVALID_FLOAT=35;         /* Value passed in was a NaN, Inf or denormalized float. */
    FMOD_ERR_INVALID_HANDLE=36;        /* An invalid object handle was used. */
    FMOD_ERR_INVALID_PARAM=37;         /* An invalid parameter was passed to this function. */
    FMOD_ERR_INVALID_SPEAKER=38;       /* An invalid speaker was passed to this function based on the current speaker mode. */
    FMOD_ERR_INVALID_VECTOR=39;        /* The vectors passed in are not unit length, or perpendicular. */
    FMOD_ERR_IRX=40;                   /* PS2 only.  fmodex.irx failed to initialize.  This is most likely because you forgot to load it. */
    FMOD_ERR_MAXAUDIBLE=41;            /* Reached maximum audible playback count for this sound's soundgroup. */
    FMOD_ERR_MEMORY=42;                /* Not enough memory or resources. */
    FMOD_ERR_MEMORY_IOP=43;            /* PS2 only.  Not enough memory or resources on PlayStation 2 IOP ram. */
    FMOD_ERR_MEMORY_SRAM=44;           /* Not enough memory or resources on console sound ram. */
    FMOD_ERR_MEMORY_CANTPOINT=45;      /* Can't use FMOD_OPENMEMORY_POINT on non PCM source data, or non mp3/xma/adpcm data if FMOD_CREATECOMPRESSEDSAMPLE was used. */
    FMOD_ERR_NEEDS2D=46;               /* Tried to call a command on a 3d sound when the command was meant for 2d sound. */
    FMOD_ERR_NEEDS3D=47;               /* Tried to call a command on a 2d sound when the command was meant for 3d sound. */
    FMOD_ERR_NEEDSHARDWARE=48;         /* Tried to use a feature that requires hardware support.  (ie trying to play a VAG compressed sound in software on PS2). */
    FMOD_ERR_NEEDSSOFTWARE=49;         /* Tried to use a feature that requires the software engine.  Software engine has either been turned off, or command was executed on a hardware channel which does not support this feature. */
    FMOD_ERR_NET_CONNECT=50;           /* Couldn't connect to the specified host. */
    FMOD_ERR_NET_SOCKET_ERROR=51;      /* A socket error occurred.  This is a catch-all for socket-related errors not listed elsewhere. */
    FMOD_ERR_NET_URL=52;               /* The specified URL couldn't be resolved. */
    FMOD_ERR_NET_WOULD_BLOCK=53;       /* Operation on a non-blocking socket could not complete immediately. */
    FMOD_ERR_NOTREADY=54;              /* Operation could not be performed because specified sound is not ready. */
    FMOD_ERR_OUTPUT_ALLOCATED=55;      /* Error initializing output device, but more specifically, the output device is already in use and cannot be reused. */
    FMOD_ERR_OUTPUT_CREATEBUFFER=56;   /* Error creating hardware sound buffer. */
    FMOD_ERR_OUTPUT_DRIVERCALL=57;     /* A call to a standard soundcard driver failed, which could possibly mean a bug in the driver or resources were missing or exhausted. */
    FMOD_ERR_OUTPUT_FORMAT=58;         /* Soundcard does not support the minimum features needed for this soundsystem (16bit stereo output). */
    FMOD_ERR_OUTPUT_INIT=59;           /* Error initializing output device. */
    FMOD_ERR_OUTPUT_NOHARDWARE=60;     /* FMOD_HARDWARE was specified but the sound card does not have the resources nescessary to play it. */
    FMOD_ERR_OUTPUT_NOSOFTWARE=61;     /* Attempted to create a software sound but no software channels were specified in System::init. */
    FMOD_ERR_PAN=62;                   /* Panning only works with mono or stereo sound sources. */
    FMOD_ERR_PLUGIN=63;                /* An unspecified error has been returned from a 3rd party plugin. */
    FMOD_ERR_PLUGIN_MISSING=64;        /* A requested output, dsp unit type or codec was not available. */
    FMOD_ERR_PLUGIN_RESOURCE=65;       /* A resource that the plugin requires cannot be found. (ie the DLS file for MIDI playback) */
    FMOD_ERR_PLUGIN_INSTANCES=66;      /* The number of allowed instances of a plugin has been exceeded. */
    FMOD_ERR_RECORD=67;                /* An error occured trying to initialize the recording device. */
    FMOD_ERR_REVERB_INSTANCE=68;       /* Specified Instance in FMOD_REVERB_PROPERTIES couldn't be set. Most likely because another application has locked the EAX4 FX slot. */
    FMOD_ERR_SUBSOUNDS=69;             /* The error occured because the sound referenced contains subsounds.  (ie you cannot play the parent sound as a static sample, only its subsounds.) */
    FMOD_ERR_SUBSOUND_ALLOCATED=70;    /* This subsound is already being used by another sound, you cannot have more than one parent to a sound.  Null out the other parent's entry first. */
    FMOD_ERR_TAGNOTFOUND=71;           /* The specified tag could not be found or there are no tags. */
    FMOD_ERR_TOOMANYCHANNELS=72;       /* The sound created exceeds the allowable input channel count.  This can be increased using the maxinputchannels parameter in System::setSoftwareFormat. */
    FMOD_ERR_UNIMPLEMENTED=73;         /* Something in FMOD hasn't been implemented when it should be! contact support! */
    FMOD_ERR_UNINITIALIZED=74;         /* This command failed because System::init or System::setDriver was not called. */
    FMOD_ERR_UNSUPPORTED=75;           /* A command issued was not supported by this object.  Possibly a plugin without certain callbacks specified. */
    FMOD_ERR_UPDATE=76;                /* An error caused by System::update occured. */
    FMOD_ERR_VERSION=77;               /* The version number of this file format is not supported. */

    FMOD_ERR_EVENT_FAILED=78;          /* An Event failed to be retrieved, most likely due to 'just fail' being specified as the max playbacks behavior. */
    FMOD_ERR_EVENT_INTERNAL=79;        /* An error occured that wasn't supposed to.  See debug log for reason. */
    FMOD_ERR_EVENT_INFOONLY=80;        /* Can't execute this command on an EVENT_INFOONLY event. */
    FMOD_ERR_EVENT_MAXSTREAMS=81;      /* Event failed because 'Max streams' was hit when FMOD_INIT_FAIL_ON_MAXSTREAMS was specified. */
    FMOD_ERR_EVENT_MISMATCH=82;        /* FSB mis-matches the FEV it was compiled with. */
    FMOD_ERR_EVENT_NAMECONFLICT=83;    /* A category with the same name already exists. */
    FMOD_ERR_EVENT_NOTFOUND=84;        /* The requested event, event group, event category or event property could not be found. */


    switch (argument0)
    {
        case FMOD_ERR_ALREADYLOCKED:          return "Tried to call lock a second time before unlock was called. ";
        case FMOD_ERR_BADCOMMAND:             return "Tried to call a function on a data type that does not allow this type of functionality (ie calling Sound::lock on a streaming sound). ";
        case FMOD_ERR_CDDA_DRIVERS:           return "Neither NTSCSI nor ASPI could be initialised. ";
        case FMOD_ERR_CDDA_INIT:              return "An error occurred while initialising the CDDA subsystem. ";
        case FMOD_ERR_CDDA_INVALID_DEVICE:    return "Couldn't find the specified device. ";
        case FMOD_ERR_CDDA_NOAUDIO:           return "No audio tracks on the specified disc. ";
        case FMOD_ERR_CDDA_NODEVICES:         return "No CD/DVD devices were found. ";
        case FMOD_ERR_CDDA_NODISC:            return "No disc present in the specified drive. ";
        case FMOD_ERR_CDDA_READ:              return "A CDDA read error occurred. ";
        case FMOD_ERR_CHANNEL_ALLOC:          return "Error trying to allocate a channel. ";
        case FMOD_ERR_CHANNEL_STOLEN:         return "The specified channel has been reused to play another sound. ";
        case FMOD_ERR_COM:                    return "A Win32 COM related error occured. COM failed to initialize or a QueryInterface failed meaning a Windows codec or driver was not installed properly. ";
        case FMOD_ERR_DMA:                    return "DMA Failure.  See debug output for more information. ";
        case FMOD_ERR_DSP_CONNECTION:         return "DSP connection error.  Connection possibly caused a cyclic dependancy. ";
        case FMOD_ERR_DSP_FORMAT:             return "DSP Format error.  A DSP unit may have attempted to connect to this network with the wrong format. ";
        case FMOD_ERR_DSP_NOTFOUND:           return "DSP connection error.  Couldn't find the DSP unit specified. ";
        case FMOD_ERR_DSP_RUNNING:            return "DSP error.  Cannot perform this operation while the network is in the middle of running.  This will most likely happen if a connection or disconnection is attempted in a DSP callback. ";
        case FMOD_ERR_DSP_TOOMANYCONNECTIONS: return "DSP connection error.  The unit being connected to or disconnected should only have 1 input or output. ";
        case FMOD_ERR_EVENT_FAILED:           return "An Event failed to be retrieved, most likely due to 'just fail' being specified as the max playbacks behavior. ";
        case FMOD_ERR_EVENT_INFOONLY:         return "Can't execute this command on an EVENT_INFOONLY event. ";
        case FMOD_ERR_EVENT_INTERNAL:         return "An error occured that wasn't supposed to.  See debug log for reason. ";
        case FMOD_ERR_EVENT_MAXSTREAMS:       return "Event failed because 'Max streams' was hit when FMOD_INIT_FAIL_ON_MAXSTREAMS was specified. ";
        case FMOD_ERR_EVENT_MISMATCH:         return "FSB mis-matches the FEV it was compiled with. ";
        case FMOD_ERR_EVENT_NAMECONFLICT:     return "A category with the same name already exists. ";
        case FMOD_ERR_EVENT_NOTFOUND:         return "The requested event, event group, event category or event property could not be found. ";
        case FMOD_ERR_FILE_BAD:               return "Error loading file. ";
        case FMOD_ERR_FILE_COULDNOTSEEK:      return "Couldn't perform seek operation.  This is a limitation of the medium (ie netstreams) or the file format. ";
        case FMOD_ERR_FILE_DISKEJECTED:       return "Media was ejected while reading. ";
        case FMOD_ERR_FILE_EOF:               return "End of file unexpectedly reached while trying to read essential data (truncated data?). ";
        case FMOD_ERR_FILE_NOTFOUND:          return "File not found. ";
        case FMOD_ERR_FILE_UNWANTED:          return "Unwanted file access occured. ";
        case FMOD_ERR_FORMAT:                 return "Unsupported file or audio format. ";
        case FMOD_ERR_HTTP:                   return "A HTTP error occurred. This is a catch-all for HTTP errors not listed elsewhere. ";
        case FMOD_ERR_HTTP_ACCESS:            return "The specified resource requires authentication or is forbidden. ";
        case FMOD_ERR_HTTP_PROXY_AUTH:        return "Proxy authentication is required to access the specified resource. ";
        case FMOD_ERR_HTTP_SERVER_ERROR:      return "A HTTP server error occurred. ";
        case FMOD_ERR_HTTP_TIMEOUT:           return "The HTTP request timed out. ";
        case FMOD_ERR_INITIALIZATION:         return "FMOD was not initialized correctly to support this function. ";
        case FMOD_ERR_INITIALIZED:            return "Cannot call this command after System::init. ";
        case FMOD_ERR_INTERNAL:               return "An error occured that wasn't supposed to.  Contact support. ";
        case FMOD_ERR_INVALID_ADDRESS:        return "On Xbox 360, this memory address passed to FMOD must be physical, (ie allocated with XPhysicalAlloc.) ";
        case FMOD_ERR_INVALID_FLOAT:          return "Value passed in was a NaN, Inf or denormalized float. ";
        case FMOD_ERR_INVALID_HANDLE:         return "An invalid object handle was used. ";
        case FMOD_ERR_INVALID_PARAM:          return "An invalid parameter was passed to this function. ";
        case FMOD_ERR_INVALID_SPEAKER:        return "An invalid speaker was passed to this function based on the current speaker mode. ";
        case FMOD_ERR_INVALID_VECTOR:         return "The vectors passed in are not unit length, or perpendicular. ";
        case FMOD_ERR_IRX:                    return "PS2 only.  fmodex.irx failed to initialize.  This is most likely because you forgot to load it. ";
        case FMOD_ERR_MAXAUDIBLE:             return "Reached maximum audible playback count for this sound's soundgroup. ";
        case FMOD_ERR_MEMORY:                 return "Not enough memory or resources. ";
        case FMOD_ERR_MEMORY_CANTPOINT:       return "Can't use FMOD_OPENMEMORY_POINT on non PCM source data, or non mp3/xma/adpcm data if FMOD_CREATECOMPRESSEDSAMPLE was used. ";
        case FMOD_ERR_MEMORY_IOP:             return "PS2 only.  Not enough memory or resources on PlayStation 2 IOP ram. ";
        case FMOD_ERR_MEMORY_SRAM:            return "Not enough memory or resources on console sound ram. ";
        case FMOD_ERR_NEEDS2D:                return "Tried to call a command on a 3d sound when the command was meant for 2d sound. ";
        case FMOD_ERR_NEEDS3D:                return "Tried to call a command on a 2d sound when the command was meant for 3d sound. ";
        case FMOD_ERR_NEEDSHARDWARE:          return "Tried to use a feature that requires hardware support.  (ie trying to play a VAG compressed sound in software on PS2). ";
        case FMOD_ERR_NEEDSSOFTWARE:          return "Tried to use a feature that requires the software engine.  Software engine has either been turned off, or command was executed on a hardware channel which does not support this feature. ";
        case FMOD_ERR_NET_CONNECT:            return "Couldn't connect to the specified host. ";
        case FMOD_ERR_NET_SOCKET_ERROR:       return "A socket error occurred.  This is a catch-all for socket-related errors not listed elsewhere. ";
        case FMOD_ERR_NET_URL:                return "The specified URL couldn't be resolved. ";
        case FMOD_ERR_NET_WOULD_BLOCK:        return "Operation on a non-blocking socket could not complete immediately. ";
        case FMOD_ERR_NOTREADY:               return "Operation could not be performed because specified sound is not ready. ";
        case FMOD_ERR_OUTPUT_ALLOCATED:       return "Error initializing output device, but more specifically, the output device is already in use and cannot be reused. ";
        case FMOD_ERR_OUTPUT_CREATEBUFFER:    return "Error creating hardware sound buffer. ";
        case FMOD_ERR_OUTPUT_DRIVERCALL:      return "A call to a standard soundcard driver failed, which could possibly mean a bug in the driver or resources were missing or exhausted. ";
        case FMOD_ERR_OUTPUT_FORMAT:          return "Soundcard does not support the minimum features needed for this soundsystem (16bit stereo output). ";
        case FMOD_ERR_OUTPUT_INIT:            return "Error initializing output device. ";
        case FMOD_ERR_OUTPUT_NOHARDWARE:      return "FMOD_HARDWARE was specified but the sound card does not have the resources nescessary to play it. ";
        case FMOD_ERR_OUTPUT_NOSOFTWARE:      return "Attempted to create a software sound but no software channels were specified in System::init. ";
        case FMOD_ERR_PAN:                    return "Panning only works with mono or stereo sound sources. ";
        case FMOD_ERR_PLUGIN:                 return "An unspecified error has been returned from a 3rd party plugin. ";
        case FMOD_ERR_PLUGIN_INSTANCES:       return "The number of allowed instances of a plugin has been exceeded. ";
        case FMOD_ERR_PLUGIN_MISSING:         return "A requested output, dsp unit type or codec was not available. ";
        case FMOD_ERR_PLUGIN_RESOURCE:        return "A resource that the plugin requires cannot be found. (ie the DLS file for MIDI playback) ";
        case FMOD_ERR_RECORD:                 return "An error occured trying to initialize the recording device. ";
        case FMOD_ERR_REVERB_INSTANCE:        return "Specified Instance in FMOD_REVERB_PROPERTIES couldn't be set. Most likely because another application has locked the EAX4 FX slot. ";
        case FMOD_ERR_SUBSOUNDS:              return "The error occured because the sound referenced contains subsounds.  (ie you cannot play the parent sound as a static sample, only its subsounds.) ";
        case FMOD_ERR_SUBSOUND_ALLOCATED:     return "This subsound is already being used by another sound, you cannot have more than one parent to a sound.  Null out the other parent's entry first. ";
        case FMOD_ERR_TAGNOTFOUND:            return "The specified tag could not be found or there are no tags. ";
        case FMOD_ERR_TOOMANYCHANNELS:        return "The sound created exceeds the allowable input channel count.  This can be increased using the maxinputchannels parameter in System::setSoftwareFormat. ";
        case FMOD_ERR_UNIMPLEMENTED:          return "Something in FMOD hasn't been implemented when it should be! contact support! ";
        case FMOD_ERR_UNINITIALIZED:          return "This command failed because System::init or System::setDriver was not called. ";
        case FMOD_ERR_UNSUPPORTED:            return "A command issued was not supported by this object.  Possibly a plugin without certain callbacks specified. ";
        case FMOD_ERR_UPDATE:                 return "An error caused by System::update occured. ";
        case FMOD_ERR_VERSION:                return "The version number of this file format is not supported. ";
        case FMOD_OK:                         return "No errors.";
        default :                             return "Unknown error.";
    };

#define FMODGetLastError_new
//Get the last error in the dll
//Call only if the result of anthe call returns 0nothe FMOD call returns 0;

//errnumber = FMODGetLastError();

///Example call
//if(FMODInit(100) = 0) show_message(FMODErrorStr(FMODGetLastError()));

//export double FMODGetLastError(void)
return external_call(global.dll_FMODGetLastError);

#define FMODNormalizeWaveData_new
//export double FMODNormalizeWaveData(double startpos, double size)
//Normalizes the wave data from start to start+size to increase the data range values
//which is useful for better display of the data though the accuracy of the wave form
//will be affected... Not that it matters in this case.
//Portions of the wave that have very little deltav will show an exagerated deltav so
//you can see the wave instead of a straight line.
//A side effect is that larger variations may be reduced... but overall, the effect is 
//acceptable for use in draw function

//Returns the calculated value use in the normalization (max range variation value in the data set)
//FMODInstanceGetWaveSnapshot2(instance,0, 1024);
//FMODNormalizeWaveData(0, 1024);
//for(i=0; i<1024,i+=1)
//{
//    entry = FMODGetSnapshotEntry(i);
//}

return external_call(global.dll_FMODNormalizeWaveData,argument0, argument1);

#define FMODNormalizeSpectrumData_new
//export double FMODNormalizeSpectrumData(double startpos, double size)
//Normalizes the spectrum data from start to start+size to increase the data range values
//which is useful for better display of the data
//The effect is that values that are very small will stretch according to the
//highest value of the set. For eaxmple, if the highest value was .05 and the others
//.005, .0005, the highest will be bumped to 1 making the others .1 and .01
//For display purpose, it ensures you always have data to see.

//Returns the calculated value use in the normalization (max value in the dtata set)
//v = FMODInstanceGetSpectrumSnapshot2(instance,0, 1024);
//FMODNormalizeSpectrumData(0, 1024);
//for(i=0; i<1024,i+=1)
//{
//    entry = FMODGetSnapshotEntry(i);
//}

return external_call(global.dll_FMODNormalizeSpectrumData,argument0,argument1);

#define FMODGetSnapshotEntry_new
//export double FMODGetSnapshotEntry(double pos)
//returns the data point value at position pos

//FMODInstanceGetWaveSnapshot2(instance,0, 1024);
//FMODNormalizeWaveData(1024);
//for(i=0; i<1024,i+=1)
//{
//    entry = FMODGetSnapshotEntry(i);
//}

return external_call(global.dll_FMODGetSnapshotEntry,argument0);

#define FMODGetSpectrumBuffer_new
//export double FMODGetSpectrumBuffer(double start, double size)
//returns 0 on error
//returns 1 on success 

//It's faster to use the string buffer method than getting every point using 
//FMODGetSnapshotEntry()

//var buf;
global.FMODbuf = string_repeat(chr(0), argument1+1);
//Gets the spectrum snapshot into a string buffer
//Each character is a value from 0to 255 to represent the spectrum played 
//success = FMODGetSpectrumBuffer(0, 256)

//NOTE BECAUSE OF A GM BUG REGARDING LEAKS RETURNING STRINGS
//global.FMODbuf is now used
//Use ord(string_char_at(global.FMODBuf,<<1 to size>>)) to access values

return external_call(global.dll_FMODGetSpectrumBuffer,argument0,argument1,global.FMODbuf);
//return buf;

#define FMODGetWaveBuffer_new
//export double FMODGetWaveBuffer(double start, double size)
//returns 0 on error
//returns 1 on success 

//It's faster to use the string buffer method than getting every point using 
//FMODGetSnapshotEntry()


//var buf;
global.FMODbuf = string_repeat(chr(0), argument1+1);
//Gets the FMODGetWaveBuffer snapshot into a string buffer
//Each character is a value from 0to 255 to represent the wave played 
//the flatline is at char 127. 127-n is the -crest 127+n is the +crest of the wave form

//buffer = FMODGetWaveBuffer(0, 256)
//NOTE BECAUSE OF A GM BUG REGARDING LEAKS RETURNING STRINGS
//global.FMODbuf is now used
//Use ord(string_char_at(global.FMODbuf,<<1 to size>>)) to access values

return external_call(global.dll_FMODGetWaveBuffer,argument0,argument1,global.FMODbuf);
//return buf;

#define FMODEncryptFile_new
//export double FMODEncryptFile(string sourcefile, string destfile, string password)
//returns 0 on error
//returns 1 on success
//Destination file will be deleted if it exists
//Will show error message boxes.  No FMODGetLastError on this one.
//Use this to encrypt your sounds without using the included password encryption applet

return external_call(global.dll_FMODEncryptFile,argument0,argument1,argument2);

#define FMODUpdateTakeOverWhileLocked_new
//export double FMODUpdateTakeOverWhileLocked()
//returns 0 on error
//returns 1 on success

//This function in used while you pop up a dialog box in GM
//Or show the Help (F1)
//Or go into a long loop when GM events will no longer be called
//Therefore FMODUpdate will no longer be called, which may freeze the music
//after a few seconds

//in the case of F1, you would have to disable GM's automatic handling of it
//and recreate it 
//FMODUpdateTakeOverWhileLocked()
//show_info();
//FMODUpdateTakeOverDone()

//for dialog boxes
//FMODUpdateTakeOverWhileLocked()
//filename = get_open_filename()
//FMODUpdateTakeOverDone()
return external_call(global.dll_FMODUpdateTakeOverWhileLocked);

#define FMODUpdateTakeOverDone_new
//export double FMODUpdateTakeOverDone()
//returns 0 on error
//returns 1 on success

//This function in used after you pop up a dialog box in GM
//Or show the Help (F1)
//Or go into a long loop when GM events will no longer be called
//Therefore FMODUpdate will no longer be called, which may freeze the music
//after a few seconds

//in the case of F1, you would have to disable GM's automatic handling of it
//and recreate it 
//FMODUpdateTakeOverWhileLocked()
//show_info();
//FMODUpdateTakeOverDone()

//for dialog boxes
//FMODUpdateTakeOverWhileLocked()
//filename = get_open_filename()
//FMODUpdateTakeOverDone()
return external_call(global.dll_FMODUpdateTakeOverDone);

#define FMODSpectrumSetSnapshotType_new
//export double FMODSpectrumSetSnapshotType(double snapshottype)
//sets the shape of the spectrum data. Affects all get spectrum data functions
//argument
//0 (default)   FMOD_DSP_FFT_WINDOW_RECT,            /* w[n] = 1.0                                                                                            */
//1             FMOD_DSP_FFT_WINDOW_TRIANGLE,        /* w[n] = TRI(2n/N)                                                                                      */
//2             FMOD_DSP_FFT_WINDOW_HAMMING,         /* w[n] = 0.54 - (0.46 * COS(n/N) )                                                                      */
//3             FMOD_DSP_FFT_WINDOW_HANNING,         /* w[n] = 0.5 *  (1.0  - COS(n/N) )                                                                      */
//4             FMOD_DSP_FFT_WINDOW_BLACKMAN,        /* w[n] = 0.42 - (0.5  * COS(n/N) ) + (0.08 * COS(2.0 * n/N) )                                           */
//5             FMOD_DSP_FFT_WINDOW_BLACKMANHARRIS,  /* w[n] = 0.35875 - (0.48829 * COS(1.0 * n/N)) + (0.14128 * COS(2.0 * n/N)) - (0.01168 * COS(3.0 * n/N)) */

return external_call(global.dll_FMODSpectrumSetSnapshotType,argument0);

#define FMODSnapShotToDsList_new
//GM7 ONLY, GM8 see bottom
//export double FMODSnapShotToDsList(double startpos, double size, double ds)
//returns 0 on error; probable error because...
//... returns the variation of the data (maxv-minv) which can be used to normalise the data 

//This is the fastest means to get snapshot data because it populates a ds list

//FMODGroup/InstanceGetWave/SpectrumSnapshot2(...,1024)
//l = ds_list_create(); //MAKE SURE YOU DO THIS OR IT WILL BLOW UP!!!
//FMODSnapShotToDsList(0,1024,l)
//var i; i=0;
//repeat(ds_list_size(l))
//{
//  thevalue = ds_list_find_value(l,i);
//  i+=1;
//}
//ds_list_destroy(l); //it is faster to destroy and recreate lists than clearing them
//hack for Studio. may be better to use the string method
var i = 0;
repeat(argument1)
{
    ds_list_add(argument2,FMODGetSnapshotEntry(i+argument0))
    i+=1;
}
return 1;

return external_call(global.dll_FMODSnapShotToDsList,argument0,argument1,argument2);

/*
//////////////////////////////
//GM8 version
//export double FMODSnapShotToDsList(double startpos, double size, double ds)
//returns 0 on error; probable error because...
//... returns the variation of the data (maxv-minv) which can be used to normalise the data 

//This is the fastest means to get snapshot data because it populates a ds list

//FMODGroup/InstanceGetWave/SpectrumSnapshot2(...,1024)
//l = ds_list_create(); //MAKE SURE YOU DO THIS OR IT WILL BLOW UP!!!
//FMODSnapShotToDsList(0,1024,l)
//var i; i=0;
//repeat(ds_list_size(l))
//{
//  thevalue = ds_list_find_value(l,i);
//  i+=1;
//}
//ds_list_destroy(l); //it is faster to destroy and recreate lists than clearing them

var; i = argument0;
repeat(argument1)
{
    ds_list_add(argument2,FMODGetSnapshotEntry(i));
    i+=1;
}

//return external_call(global.dll_FMODSnapShotToDsList,argument0,argument1,argument2);
*/

#define FMODSoundAddAsyncStream_new
//export double FMODSoundAddAsyncStream(url/file, threed)
//This is hard core. 
//Refer to the VisualMusic demo for proper use
//Adds a sound (from a web stream usually, but can be used for regular files)
//The sound is not ready to setup until FMODSoundAsyncReady returns true

//sound = FMODSoundAddAsyncStream("http://www.server.com:80")
//in step event
//if(FMODSoundAsyncReady(sound)) 
//{
//    FMODSoundSetMaxVolume(sound,.5)
//    instance = FMODSoundPlay(sound);
//}

//There are a lot of other things to do while it plays...

return external_call(global.dll_FMODSoundAddAsyncStream,argument0,argument1);

#define FMODSoundAsyncReady_new
//export double FMODSoundAsyncReady(double sound)

//This is hard core. 
//Refer to the VisualMusic demo for proper use
//Adds a sound (from a web stream usually, but can be used for regular files)
//The sound is not ready to setup until FMODSoundAsyncReady returns true

//sound = FMODSoundAddAsyncStream("http://www.server.com:80")
//in step event
//if(FMODSoundAsyncReady(sound)) 
//{
//    FMODSoundSetMaxVolume(sound,.5)
//    instance = FMODSoundPlay(sound);
//}

//There are a lot of other things to do while it plays...

return external_call(global.dll_FMODSoundAsyncReady,argument0);

#define FMODInstanceAsyncOK_new
//export double FMODInstanceAsyncOK(double instance)

//This is hard core. 
//Refer to the VisualMusic demo for proper use
//Adds a sound (from a web stream usually, but can be used for regular files)
//The sound is not ready to setup until FMODSoundAsyncReady returns true

//sound = FMODSoundAddAsyncStream("http://www.server.com:80")
//in step event
//if(FMODSoundAsyncReady(sound)) 
//{
//    FMODSoundSetMaxVolume(sound,.5)
//    instance = FMODSoundPlay(sound);
//}

//There are a lot of other things to do while it plays...

//if(instance and !FMODInstanceAsyncOK(instance)) 
//{
//    FMODInstanceSetMuted(instance,true)
//    other things needed like if timed out, refer to VisualMusic demo
//}
//else
//{
//    FMODInstanceSetMuted(instance,false)
//}
return external_call(global.dll_FMODInstanceAsyncOK,argument0);

#define FMODServerError_new
//show_debug_message(string(FMODGetLastError()))

return (FMODGetLastError() <> 0)

#define FMODGetTagData_new
//export double FMODGetTagData()
//Gets the tag data from a stream
//Refer to Visual Music Demo
var buf;
buf = string_repeat(chr(0), 2048);
var len;
len = external_call(global.dll_FMODGetTagData,buf);
return "" + string_copy(buf,1,len);

#define FMODGetTagName_new
//export double FMODGetTagName()
//Gets the tag name from the stream
//Refer to Visual Music Demo

var buf;
buf = string_repeat(chr(0), 2048);
var len;
len = external_call(global.dll_FMODGetTagName,buf);
return "" + string_copy(buf,1,len);

#define FMODInstanceGetNextTag_new
//export double FMODInstanceGetNextTag(double instance)
//returns 1 is there is a (new) tag to be looked at.
//reads the next unread tag from the stream
//Use FMODGetTagName and FMODGetTagData to get the tags information you just read
//Refer to Visual Music Demo

return external_call(global.dll_FMODInstanceGetNextTag,argument0);

#define FMODCreateSoundFromMicInput_new
//export double FMODCreateSoundFromMicInput()
//Creates a sound object from the standard mic

//See FMODMicStart
return external_call(global.dll_FMODCreateSoundFromMicInput);

#define FMODMicStart_new
//export double FMODMicStart(double sound)
//Starts recording on a sound...
//Returns an instance of the sound recorded my the mic

//    sound = FMODCreateSoundFromMicInput();
//    if (!sound) exit;
//    instance = FMODMicStart(sound);
//    FMODInstanceSetVolume(instance,0); //mute to prevent feedback

// when done
//    FMODInstanceStop(instance);
//    FMODRecordStop();
//    FMODSoundFree(sound)
//    sound = 0;
//    instance = 0;

return external_call(global.dll_FMODRecordStart, argument0);

#define FMODMicStop_new
//export double FMODMicStop()
//Stop the recorder

//see FMODMicStart

return external_call(global.dll_FMODRecordStop);

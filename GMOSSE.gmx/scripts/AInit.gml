///AInit()
globalvar GMALP_DLL,
GMALP_Call,GMALP_Init,GMALP_Update,GMALP_Free,GMALP_Version,
GMALP_SourceLoad,GMALP_SourceFree,GMALP_SourceFreeAll,GMALP_SourceGetFormatData,
GMALP_SourceAddLoopPoint,GMALP_SourceGetNumLoopPoints,GMALP_SourceGetLoopPointData,
GMALP_SourceClearLoopPoint,GMALP_SourceGetLength,
GMALP_StreamPlay,GMALP_StreamStop,GMALP_StreamPause,GMALP_StreamResume,GMALP_StreamIsPlaying,
GMALP_StreamGetLength,GMALP_StreamGetPosition,GMALP_StreamGetVolume,GMALP_StreamGetPitch,
GMALP_StreamGetRepeat,GMALP_StreamGetPan,GMALP_StreamGetPitch,GMALP_StreamSetPosition,
GMALP_StreamSetVolume,GMALP_StreamSetPitch,GMALP_StreamSetRepeat,GMALP_StreamSetPan,
GMALP_StreamSetPitch,GMALP_StreamStopAll,GMALP_GetDevices;
GMALP_DLL = "GMALP.dll";
GMALP_Call = dll_cdecl;

if !file_exists(GMALP_DLL) return -1; // File Not Found
if os_browser != browser_not_a_browser return -2; // Running In Browser
if os_type != os_windows return -3; // Running on Android etc without GMALP port

// DLL HANDLE COMMANDS
GMALP_Init = external_define(GMALP_DLL, "AInit", GMALP_Call, ty_real, 0);
GMALP_Update = external_define(GMALP_DLL, "AUpdate", GMALP_Call, ty_real, 1, ty_real);
GMALP_Free = external_define(GMALP_DLL, "AFree", GMALP_Call, ty_real, 0);
GMALP_Version = external_define(GMALP_DLL, "AVersion", GMALP_Call, ty_string, 0);
GMALP_GetDevices = external_define(GMALP_DLL, "AGetSupportedAudioDevices", GMALP_Call, ty_string, 0);

// SOURCE COMMANDS
GMALP_SourceLoad = external_define(GMALP_DLL, "ASourceLoad", GMALP_Call, ty_real, 1, ty_string);
GMALP_SourceFree = external_define(GMALP_DLL, "ASourceFree", GMALP_Call, ty_real, 1, ty_real);
GMALP_SourceFreeAll = external_define(GMALP_DLL, "ASourceFreeAll", GMALP_Call, ty_real, 0);
GMALP_SourceGetFormatData = external_define(GMALP_DLL, "ASourceGetFormatData", GMALP_Call, ty_real, 2, ty_real, ty_real);
GMALP_SourceAddLoopPoint = external_define(GMALP_DLL, "ASourceAddLoopPoint", GMALP_Call, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
GMALP_SourceClearLoopPoint = external_define(GMALP_DLL, "ASourceClearLoopPoint", GMALP_Call, ty_real, 2, ty_real, ty_real);
GMALP_SourceGetLoopPointData = external_define(GMALP_DLL, "ASourceGetLoopPointData", GMALP_Call, ty_real, 3, ty_real, ty_real, ty_real);
GMALP_SourceGetNumLoopPoints = external_define(GMALP_DLL, "ASourceGetNumLoopPoints", GMALP_Call, ty_real, 1, ty_real);
GMALP_SourceGetLength = external_define(GMALP_DLL, "ASourceGetLength", GMALP_Call, ty_real, 1, ty_real);

// STREAM COMMANDS
GMALP_StreamPlay = external_define(GMALP_DLL, "AStreamPlay", GMALP_Call, ty_real, 2, ty_real, ty_real);
GMALP_StreamStop = external_define(GMALP_DLL, "AStreamStop", GMALP_Call, ty_real, 1, ty_real);
GMALP_StreamStopAll = external_define(GMALP_DLL, "AStreamStopAll", GMALP_Call, ty_real, 0);
GMALP_StreamPause = external_define(GMALP_DLL, "AStreamPause", GMALP_Call, ty_real, 1, ty_real);
GMALP_StreamResume = external_define(GMALP_DLL, "AStreamResume", GMALP_Call, ty_real, 1, ty_real);
GMALP_StreamIsPlaying = external_define(GMALP_DLL, "AStreamIsPlaying", GMALP_Call, ty_real, 1, ty_real);
GMALP_StreamIsSeekable = external_define(GMALP_DLL, "AStreamIsSeekable", GMALP_Call, ty_real, 1, ty_real);

GMALP_StreamGetLength = external_define(GMALP_DLL, "AStreamGetLength", GMALP_Call, ty_real, 1, ty_real);
GMALP_StreamGetPosition = external_define(GMALP_DLL, "AStreamGetPosition", GMALP_Call, ty_real, 1, ty_real);
GMALP_StreamGetVolume = external_define(GMALP_DLL, "AStreamGetVolume", GMALP_Call, ty_real, 1, ty_real);
GMALP_StreamGetRepeat = external_define(GMALP_DLL, "AStreamGetRepeat", GMALP_Call, ty_real, 1, ty_real);
GMALP_StreamGetPan = external_define(GMALP_DLL, "AStreamGetPan", GMALP_Call, ty_real, 1, ty_real);
GMALP_StreamGetPitch = external_define(GMALP_DLL, "AStreamGetPitch", GMALP_Call, ty_real, 1, ty_real);

GMALP_StreamSetPosition = external_define(GMALP_DLL, "AStreamSetPosition", GMALP_Call, ty_real, 2, ty_real, ty_real);
GMALP_StreamSetVolume = external_define(GMALP_DLL, "AStreamSetVolume", GMALP_Call, ty_real, 2, ty_real, ty_real);
GMALP_StreamSetRepeat = external_define(GMALP_DLL, "AStreamSetRepeat", GMALP_Call, ty_real, 2, ty_real, ty_real);
GMALP_StreamSetPan = external_define(GMALP_DLL, "AStreamSetPan", GMALP_Call, ty_real, 2, ty_real, ty_real);
GMALP_StreamSetPitch = external_define(GMALP_DLL, "AStreamSetPitch", GMALP_Call, ty_real, 2, ty_real, ty_real);

var e;
e = external_call(GMALP_Init);
return e;



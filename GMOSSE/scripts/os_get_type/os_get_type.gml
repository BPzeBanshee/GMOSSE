///@desc os_get_type() returns a string representing the OS the app was built for
function os_get_type(){
	switch os_type
		{
		case os_windows: return "windows";	// Windows OS
		case os_gxgames: return "gx";		// GX.games
		case os_linux: return "linux";		// Linux
		case os_macosx: return "macosx";	// macOS X
		
		case os_ios: return "ios"; 			// iOS (iPhone, iPad, iPod Touch)
		case os_tvos: return "tvos";		// Apple tvOS
		case os_android: return "android";	// Android
		
		case os_ps4: return "ps4";			// Sony PlayStation 4
		case os_ps5: return "ps5";			// Sony PlayStation 5
		case os_gdk: return "gdk";			// Microsoft GDK (Xbox One and Xbox Series X/S)
		case os_switch: return "switch"; 	// Nintendo Switch
		
		case os_unknown:
		default: return "unknown";			// Unknown OS
		}
}
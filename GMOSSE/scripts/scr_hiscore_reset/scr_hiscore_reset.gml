/// @description scr_hiscore_reset()
function scr_hiscore_reset() {
	// Sets default values for each position in the highscore and name arrays
	// Format: 0,name; 1,level; 2,shipused; 3,score

	// Normal mode
	global.hiscore[1,0] = "BPZ"; global.hiscore[1,1] = 3; global.hiscore[1,2] = 1; global.hiscore[1,3] = 90000;
	global.hiscore[2,0] = "KSR"; global.hiscore[2,1] = 3; global.hiscore[2,2] = 2; global.hiscore[2,3] = 80000;
	global.hiscore[3,0] = "MJC"; global.hiscore[3,1] = 3; global.hiscore[3,2] = 3; global.hiscore[3,3] = 70000;
	global.hiscore[4,0] = "S20"; global.hiscore[4,1] = 2; global.hiscore[4,2] = 4; global.hiscore[4,3] = 60000;
	global.hiscore[5,0] = "GZR"; global.hiscore[5,1] = 2; global.hiscore[5,2] = 5; global.hiscore[5,3] = 50000;
	global.hiscore[6,0] = "ERA"; global.hiscore[6,1] = 2; global.hiscore[6,2] = 4; global.hiscore[6,3] = 40000;
	global.hiscore[7,0] = "GST"; global.hiscore[7,1] = 1; global.hiscore[7,2] = 3; global.hiscore[7,3] = 30000;
	global.hiscore[8,0] = "EMS"; global.hiscore[8,1] = 1; global.hiscore[8,2] = 2; global.hiscore[8,3] = 20000;
	global.hiscore[9,0] = "UDD"; global.hiscore[9,1] = 1; global.hiscore[9,2] = 1; global.hiscore[9,3] = 10000;
	global.hiscore[10,0] = "ZZZ"; global.hiscore[10,1] = 0; global.hiscore[10,2] = 1; global.hiscore[10,3] = 0;



}

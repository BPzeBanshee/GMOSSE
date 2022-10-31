function scr_check_nextstage() {
	/*
	scr_checkstages, by BPzeBanshee
	Purpose: used by obj_trans to determine what number
	to display when displaying 'STAGE (x) START'
	Usage: scr_checkstages()
	*/
	if global.nextroom = rm_tutorial then return "TUTORIAL"; // Tutorial

	// Stage 1
	if global.nextroom = rm_stage1 || global.nextroom = rm_boss1 then return "1";

	// Stage 2
	if global.nextroom = rm_stage2 || global.nextroom = rm_boss2 then return "2";

	if global.nextroom = rm_stage3 then return "3"; // Stage 3
	//global.nextroom = rm_boss3 then return 3;

	// Omake Stages
	if global.nextroom = rm_omake1 then return "O1";
	if global.nextroom = rm_omake2 then return "O2";
	if global.nextroom = rm_omake3 then return "O3";

	// Test Rooms
	if global.nextroom = rm_test1 then return "T1";
	if global.nextroom = rm_test2 then return "T2";
	if global.nextroom = rm_test3 then return "T3";



}

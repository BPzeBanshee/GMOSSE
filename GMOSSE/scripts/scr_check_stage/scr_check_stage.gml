/*
scr_check_stage, by BPzeBanshee
*/
///@desc Returns a string based on given room ID
///@param {Asset.GMRoom} _room
///@return {String}
function scr_check_stage(_room) {
	// Tutorial
	if _room == rm_tutorial then return "TUTORIAL"; 

	// Stage 1
	if _room == rm_stage1 || _room == rm_boss1 then return "1";

	// Stage 2
	if _room == rm_stage2 || _room == rm_boss2 then return "2";

	if _room == rm_stage3 then return "3"; // Stage 3
	//room = rm_boss3 then return "3";

	// Omake Stages
	if _room == rm_omake1 then return "O1";
	if _room == rm_omake2 then return "O2";
	if _room == rm_omake3 then return "O3";

	// Test Rooms
	if _room == rm_test1 then return "T1";
	if _room == rm_test2 then return "T2";
	if _room == rm_test3 then return "T3";
}
/// @description ASourceAddLoopPoint(source_index,loop_start,loop_end,num_loops);
/// @param source_index
/// @param loop_start
/// @param loop_end
/// @param num_loops
function ASourceAddLoopPoint(argument0, argument1, argument2, argument3) {
	// use -1 in num_loops/argument3 for infinite looping
	var e;
	e = external_call(GMALP_SourceAddLoopPoint, argument0, argument1, argument2, argument3);
	return e;





}

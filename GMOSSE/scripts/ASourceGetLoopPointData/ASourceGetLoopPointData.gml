/// @description ASourceGetLoopPointData(source_index,loop_index,datatype);
/// @param source_index
/// @param loop_index
/// @param datatype
function ASourceGetLoopPointData(argument0, argument1, argument2) {
	// datatype 1 = loop start
	// datatype 2 = loop end
	// datatype 3 = number of loops
	var e;
	e = external_call(GMALP_SourceGetLoopPointData, argument0, argument1, argument2);
	return e;





}

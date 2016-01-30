///ASourceClearLoopPoint(source_index,loop_index);
if ASourceGetNumLoopPoints(argument0) = 0 then return -1;
var e;
e = external_call(GMALP_SourceClearLoopPoint, argument0, argument1);
return e;



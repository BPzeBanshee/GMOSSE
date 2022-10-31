/// @description AStreamSetPitch(stream_index,pitch)
/// @param stream_index
/// @param pitch
function AStreamSetPitch(argument0, argument1) {
	var e;
	e = external_call(GMALP_StreamSetPitch, argument0, argument1);
	return e;





}

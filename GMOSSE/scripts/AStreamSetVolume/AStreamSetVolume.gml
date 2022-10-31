/// @description AStreamSetVolume(stream_index,volume)
/// @param stream_index
/// @param volume
function AStreamSetVolume(argument0, argument1) {
	var e;
	e = external_call(GMALP_StreamSetVolume, argument0, argument1);
	return e;





}

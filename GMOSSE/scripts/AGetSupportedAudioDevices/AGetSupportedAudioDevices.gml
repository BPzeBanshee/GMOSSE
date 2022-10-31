/// @description AGetSupportedAudioDevices()
function AGetSupportedAudioDevices() {
	var e;
	e = external_call(GMALP_GetDevices);
	return e;



}

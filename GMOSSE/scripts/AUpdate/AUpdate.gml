/// @description AUpdate()
function AUpdate() {
	var e;
	e = external_call(GMALP_Update, game_get_speed(gamespeed_fps));
	return e;
}

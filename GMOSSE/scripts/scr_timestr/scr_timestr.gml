/*
scr_timestr(), by BPzeBanshee
*/
/// @desc Returns string with format "d/m/y_h/mi/s"
/// @return {String}
function scr_timestr() {
	var dt = date_current_datetime();
	var day = date_get_day(dt);
	var month = date_get_month(dt);
	var year = date_get_year(dt);
	var hour = date_get_hour(dt);
	var minute = date_get_minute(dt);
	var second = date_get_second(dt);
	return string(day)+"-"+string(month)+"-"+string(year)+"_"+string(hour)+"-"+string(minute)+"-"+string(second);
}
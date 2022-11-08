/*
scr_timestr(), by BPzeBanshee
*/
/// @desc Returns string with format "d/m/y_h/mi/s"
/// @return {String}
function scr_timestr() {
	var dt = date_current_datetime();
	var day,month,year,hour,minute,second;
	day = date_get_day(dt);
	month = date_get_month(dt);
	year = date_get_year(dt);
	hour = date_get_hour(dt);
	minute = date_get_minute(dt);
	second = date_get_second(dt);
	return string(day)+"-"+string(month)+"-"+string(year)+"_"+string(hour)+"-"+string(minute)+"-"+string(second);
}
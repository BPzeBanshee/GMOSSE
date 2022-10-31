/// @description scr_timestr()
function scr_timestr() {
	// Returns string with format "d/m/y_h/mi/s"
	var d,m,ye,h,mi,s;
	d = date_get_day(date_current_datetime());
	m = date_get_month(date_current_datetime());
	ye = date_get_year(date_current_datetime());
	h = date_get_hour(date_current_datetime());
	mi = date_get_minute(date_current_datetime());
	s = date_get_second(date_current_datetime());
	return string(d)+"-"+string(m)+"-"+string(ye)+"_"+string(h)+"-"+string(mi)+"-"+string(s);



}

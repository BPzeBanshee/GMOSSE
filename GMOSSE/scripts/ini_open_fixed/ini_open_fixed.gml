function ini_open_fixed(ini_file){
	// Open INI file
	// (Ubuntu has problems with comment lines in INIs)
	if os_type == os_linux
		{
		var inistring = file_to_string(ini_file);
		if inistring != "ERROR" then ini_open_from_string(inistring);
		}
	else ini_open(ini_file);
	return 0;
}
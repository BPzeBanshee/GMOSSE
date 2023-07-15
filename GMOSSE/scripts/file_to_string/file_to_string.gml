/// @desc file_to_string(file) Takes a file at given location and converts the contents into a string
/// @param {string} file location
/// @returns {string} File in string form
function file_to_string(file){
var f = file_text_open_read(file);
if f == -1 then return "ERROR";
var s = "";
var sl = "";
while !file_text_eof(f)
	{
	sl = file_text_read_string(f);
	if !string_starts_with(sl,";") then s += sl+"\n";
	file_text_readln(f);
	}
file_text_close(f);
return s;
}
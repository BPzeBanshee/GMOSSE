///ASourceLoad(file)
if !file_exists(argument0) then return -1;
var e;
e = external_call(GMALP_SourceLoad, argument0);
return e;

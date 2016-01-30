///ASourceGetFormatData(source_index,datatype);
// datatype 0 = number of channels
// datatype 1 = sample rate
var e;
e = external_call(GMALP_SourceGetFormatData, argument0, argument1);
return e;



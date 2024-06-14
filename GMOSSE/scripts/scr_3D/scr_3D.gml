/// @description scr_3D()
function scr_3D() {
	/*
	scr_3D(), by BPzeBanshee

	What it does:
	Adjusts your scale and alpha values
	depending on the variable z declared in your
	object to simulate 3d depth.
	For reference, the formulas are adjusted so
	that normal size is z = 128.

	Moving in the z dimension isn't handled here
	anymore, adjust your z-value yourself.
	
	
	GM2022 Change: no longer manipulates depth variable,
	doing so changes the layer the instance is assigned to,
	usually to a 'managed' layer which isn't accessible via
	the 'layer' variable or any functions.
	//depth = (128 - z);
	*/
	image_xscale = (z / 512) * 4;
	image_yscale = (z / 512) * 4;
	if z > 256 image_alpha = max(0,1 - ((z - 256) / 256));
}
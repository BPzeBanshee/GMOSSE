///scr_3D()
/*
scr_3D(), by BPzeBanshee

What it does:
Adjusts your depth, scale and alpha values
depending on the variable z declared in your
object to simulate 3d depth.
For reference, the formulas are adjusted so
that normal size is z = 128.

Moving in the z dimension isn't handled here
anymore, adjust your z-value yourself.
*/

image_xscale = (z / 512) * 4;
image_yscale = (z / 512) * 4;
depth = (128 - z);
if z > 256 then image_alpha = max(0,1 - ((z - 256) / 256));

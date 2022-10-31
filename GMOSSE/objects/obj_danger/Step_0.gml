// Timeline
timer += 1;
    
// Red scanline
if timer < 90
    {
    if image_alpha > 0.5 then image_alpha -= 0.1 else image_alpha = 1;
    }
    
// Scrolling text
if timer > 10
    {
    chr1 += 1;
    text = string_copy(msg,1,chr1);
    }

// Fade out the lot when time's up
if timer > 90
    {
    if rnd > 0 then rnd -= 0.5;
    if alpha3 <= 0.5 
        {
        image_yscale -= 0.02;
        alpha2 -= 0.02;
        }
    if alpha3 > 0 then alpha3 -= 0.05;
    if image_yscale < 0.02 then instance_destroy();
    }


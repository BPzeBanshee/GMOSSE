// Get inputs
var b1 = global.button1[0];
var up = global.jup[0];
var down = global.jdown[0];
var left = global.jleft[0];
var right = global.jright[0];

// string_copy is what does the scrolling
chr1 += 1;
text = string_copy(msg,1,chr1);

// Dialog behaviour
if room == rm_test1
    {
    if !b1 hook = false;
    if b1 && !hook && string_length(text) == string_length(msg)
        {
        hook = true; 
        chr1 = 0;
        mode += 1;
        }
        
    event_user(0);
    }
    
if room == rm_tutorial
    {
    if !b1 hook = false;
    
    if b1 && !hook 
    && string_length(text) == string_length(msg)
    && (mode < 4 || mode == 5 || mode >= 7)
        {
        hook = true; 
        chr1 = 0;
        if mode == 3
            {
            jup_p = 0;
            jdown_p = 0;
            jleft_p = 0;
            jright_p = 0;
            j1_p = 0;
            j2_p = 0;
            j3_p = 0;
            }
        mode += 1;
        }
        
    if mode == 4
        {
        if up jup_p += 1;
        if down jdown_p += 1;
        if left jleft_p += 1;
        if right jright_p += 1;
        if jup_p > 10 && jdown_p > 10
        && jleft_p > 10 && jright_p > 10
            {
            mode += 1;
            chr1 = 0;
            }
        }
        
    if mode == 6
        {
        if b1 j1_p += 1;
        if j1_p > 20 
            {
            mode += 1;
            chr1 = 0;
            }
        }
	
    event_user(1);
    }
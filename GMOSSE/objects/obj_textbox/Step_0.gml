// string_copy is what does the scrolling
chr1 += 1;
text = string_copy(msg,1,chr1);

// Dialog behaviour
if room == rm_test1
    {
    if !global.button1 then hook = 0;
    if global.button1 && !hook 
    && string_length(text) == string_length(msg)
        {
        hook = 1; 
        chr1 = 0;
        mode += 1;
        }
        
    event_user(0);
    }
    
if room == rm_tutorial
    {
    if !global.button1 then hook = 0;
    
    if global.button1 && !hook 
    && string_length(text) == string_length(msg)
    && (mode < 4 || mode == 5 || mode >= 7)
        {
        hook = 1; 
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
        if global.jup then jup_p += 1;
        if global.jdown then jdown_p += 1;
        if global.jleft then jleft_p += 1;
        if global.jright then jright_p += 1;
        if jup_p > 10 && jdown_p > 10
        && jleft_p > 10 && jright_p > 10
            {
            mode += 1;
            chr1 = 0;
            }
        }
        
    if mode == 6
        {
        if global.button1 then j1_p += 1;
        if j1_p > 20 
            {
            mode += 1;
            chr1 = 0;
            }
        }
        
    event_user(1);
    }


// Timeline
timer += 1;
switch timer
    {
    case 100: 
        {
        rnd = 15;
        if !instance_exists(obj_ctrl_gameover) 
        then scr_snd_play(snd_voice3);
        break;
        }
    case 200:
        {
        if !instance_exists(obj_ctrl_gameover)
        then scr_snd_play(snd_voice2);
        break;
        }
    }

// WARNING Text
if rnd > 0 then rnd -= 0.25; // shaking effect
if timer < 230
    { // alpha
    if fade2 == 0
        {
        if alpha2 < 1 then alpha2 += 0.04 else fade2 = 1;
        }
    else
        {
        if alpha2 > 0 then alpha2 -= 0.04 else fade2 = 0;
        }
    }
    
// Red scanline
if timer < 300
    {
    if fade == 0
        {
        if image_alpha < 1 then image_alpha += 0.1 else fade = 1;
        }
    else
        {
        if image_alpha > 0.5 then image_alpha -= 0.1 else fade = 0;
        }
    }
    
// Scrolling text
if timer > 200
    {
    chr1 += 1;
    text = string_copy(msg,1,chr1);
    }

// Fade out the lot when time's up
if timer > 320
    {
    image_alpha -= 0.01;
    alpha2 -= 0.01;
    alpha3 -= 0.01;
    if image_alpha < 0.01 then instance_destroy();
    }


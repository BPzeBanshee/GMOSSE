/// @description  PATTERN 3: DOOM (placeholder)
/// @param placeholder
// Reposition if necessary
if x != 160 || y != yview+65 step_towards_point(160,yview+65,0.5);//mp_linear_step(160,yview+65,0.5,0);

atk_timer += 1;
if atk_timer == 8
    {
    for (var i=2;i<=6;i+=1) scr_basicshot(x1,y1,global.lay_bullets,obj_bullet2,i,image_angle+(d1*12));
    for (var i=2;i<=6;i+=1) scr_basicshot(x2,y2,global.lay_bullets,obj_bullet2,i,image_angle-(d2*12));
    d1 += 1;
    d2 += 1;
    scr_snd_play(snd_en_shot2,true);
    atk_timer = 0;
    }
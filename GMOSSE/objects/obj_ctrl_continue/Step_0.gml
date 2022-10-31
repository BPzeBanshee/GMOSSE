/* AESTHETICS */
if !has_chosen && alpha < 1
    {
    alpha += 0.05;
    exit;
    }
if has_chosen && alpha > 0
    {
    alpha -= 0.05;
    exit;
    }
    
limiter += 1;
if limiter > 5
    {
    var top = instance_create_depth(random_range(xview,xview+240),yview,depth-1,obj_star);
    top.side = 1;
    var left = instance_create_depth(xview,random_range(yview,yview+320),depth-1,obj_star);
    left.side = 2;
    var bottom = instance_create_depth(random_range(xview,xview+240),random_range(yview+320,yview+325),depth-1,obj_star);
    bottom.side = 3;
    var right = instance_create_depth(random_range(xview+240,xview+245),random_range(yview,yview+320),depth-1,obj_star);
    right.side = 4;
    limiter = 0;
    }
    
/* BEHAVIOUR */
// Scrolling up
if global.jup && !hook
    {
    if selection > 1 then selection -= 1;
    scr_playsnd(snd_click,1);
    hook = 1;
    } 
    
// Scrolling down 
if global.jdown && !hook
    {
    if selection < 2 then selection += 1;
    scr_playsnd(snd_click,1);
    hook = 1;
    }
    
// Selecting an option
if global.button1 && !hook
    {
    has_chosen = 1;
    hook = 1;
    }
    
// Actions based on chosen option
if has_chosen == 1 && alpha <= 0
    {
    with obj_ctrl_music timer = 360;
    
    // Unpause and restore everything to look normal
    scr_unpause();
    visible = false; // don't capture continue screen if Game Overing
    
    // make the stars go away/go back to normal
    with obj_star instance_destroy();
    global.behaviour = behaviour_stored;
    
    // Reboot the music
    with obj_ctrl_music event_user(5); // call again to switch off
    scr_pausemusic(0); // Unpause whatever was playing before Continue
    global.pausable = true;
    
    // Selection-specific stuff
    switch selection
        {
        case 1:
            { // Continue because you're a shit player :3
            lives = 3;
            global.bombs = global.init_bombs;
            global.continues += 1;
            if global.continues < 9 
            then global.myscore = global.continues 
            else global.myscore = 9;
            global.countdown = 0;
            global.chain = 0;
            with obj_ctrl_game respawntimer = 1;
            with obj_hitbox invincible = 180;
            break;
            }
        case 2:
            { // Game over
            instance_create_layer(x,y,layer,obj_ctrl_gameover);
            break;
            }
        }
        
    // End of need for object, now die
    instance_destroy();
    }
    
// Hook reset
if !global.jup && !global.jdown
&& !global.jleft && !global.jright
&& !global.button1 then hook = 0;
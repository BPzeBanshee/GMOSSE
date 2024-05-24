/// @description  DEFINE KEYBOARD KEYS
/* 
This is where the keyboard check stuff happens
the timer check is to stop the user assigning
multiple commands to the same button by accident
(something I've seen in some programs before).
keyboard_key = 0 is when nothing is pressed.
forcing it to 0 is another anti-accident measure.
the exists and id checks is to keep the game
responsive if it cant find a joystick.
*/

switch mode
    {
    case 1: msg = "Press a key for UP"; global.keycode_up = keyboard_key; break;
    case 2: msg = "Press a key for DOWN"; global.keycode_down = keyboard_key; break;
    case 3: msg = "Press a key for LEFT"; global.keycode_left = keyboard_key; break;
    case 4: msg = "Press a key for RIGHT"; global.keycode_right = keyboard_key; break;
    case 5: msg = "Press a key for SHOT"; global.keycode_button1 = keyboard_key; break;
    case 6: msg = "Press a key for BOMB"; global.keycode_button2 = keyboard_key; break;
    case 7: msg = "Press a key for FOCUS"; global.keycode_button3 = keyboard_key; break;
    case 8: msg = "Press a key for PAUSE"; global.keycode_button4 = keyboard_key; break;
    case 9: instance_destroy(); break;
    }
    
timer += 1;
if timer > 30 && keyboard_key != vk_nokey
    {
    mode += 1;
    keyboard_key = vk_nokey;
    timer = 0;
    }
/* 
NOTE: Any child object using something within End Step event will 
override this and result in these lines of code having no effect.
If you must have an object using End Step (ie. multiple turrets
using lengthdir_x/y) then add event_inherited() to its code.
*/
// Flash on hit
if flash_hit > 0 then flash_hit -= 1;
if enemyHP < enemyHP_last && flash_hit == 0
    {
    flash_hit = 2;
    enemyHP_last = enemyHP;
    }

// Flash when health is low
if enemyHP <= (enemyHP_max * 0.25) && enemyHP > 0 then flash_low += 1;
if flash_low == 2 then image_blend = c_white;
if flash_low == 8
    {
    image_blend = c_red;
    flash_low = 0;
    }
    
// Call user event 15 for death when enemyHP is at 0
if enemyHP <= 0 
    {
    image_blend = c_white; 
    event_user(15);
    }
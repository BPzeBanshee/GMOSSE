timer += 1;
if timer == 60
    {
    dps = enemyHP_max - enemyHP;
    enemyHP = enemyHP_max;
    timer = 0;
    }


event_inherited();

/* POSITIONING OF TURRETS */
if made
    {
    if instance_exists(tur[0]) // Top-left
        {
        tur[0].x = x - 18; 
        tur[0].y = y - 18;
        }
    if instance_exists(tur[1]) // Top-right
        {
        tur[1].x = x + 18; 
        tur[1].y = y - 18;
        }
    if instance_exists(tur[2]) // Bottom-left
        {
        tur[2].x = x - 18; 
        tur[2].y = y + 18;
        }
    if instance_exists(tur[3]) // Bottom-right
        {
        tur[3].x = x + 18; 
        tur[3].y = y + 18;
        }
    }
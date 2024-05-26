///@desc Snap to parent position
if instance_exists(parent_id)
    {
    x = (parent_id).x;
    y = (parent_id).y;
    }
else instance_destroy();
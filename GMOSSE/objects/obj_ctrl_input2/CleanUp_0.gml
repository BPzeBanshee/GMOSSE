///@desc CLEAN DS_*
if ds_exists(input,ds_type_list) ds_list_destroy(input);
if ds_exists(replay,ds_type_grid) ds_grid_destroy(replay);
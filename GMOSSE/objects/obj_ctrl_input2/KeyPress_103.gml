///@desc RECORD REPLAY
if (room == rm_menu || room == rm_shipselect)
    {
    recording = !recording;
    show_message("recording set to "+string(recording));
    }
///@desc RECORD REPLAY
if (room == rm_menu || room == rm_shipselect)
    {
    recording = !recording;
    trace("recording set to "+string(recording));
    }
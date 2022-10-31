/// @desc Creates a transition effect, and on effect completion, shifts to a different room
/// @param {Asset.GMRoom} _room						the room to transition to
/// @param {Real} type								1: color fade, 2: sprite animate
/// @param {Constant.Color|Asset.GMSprite} color_sprite	self-explanatory (depends on mode)
/// @param {Real} in_speed							animated sprite speed/alpha increase speed
/// @param {Real} out_speed							animated sprite speed/alpha decrease speed
/// @param {Real} delay								amount of frames to wait until going to next room
function scr_trans(_room,type,color_sprite,in_speed,out_speed,delay) {
	/* 
	scr_trans, by BPzeBanshee
	*/
	if instance_exists(obj_trans) then exit;
	var t = instance_create_depth(xview,yview,-16000,obj_trans);
	t.input_room = _room;
	t.input_mode = type;
	t.input_sprite = color_sprite;
	t.input_speed1 = in_speed;
	t.input_speed2 = out_speed;
	t.input_delay = delay;
	global.nextroom = t.input_room;
}
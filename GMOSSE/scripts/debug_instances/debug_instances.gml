/// @func debug_instances()
/// @desc Displays the overall and per object amounts of instances in a neat Instances debug overlay view.
/// Call anywhere in the project.
/// Credit: glebtsereteli, url: https://gist.github.com/glebtsereteli/467b0b80389c049ab8c0b63cc3eec2a3
function debug_instances() {
	static __ = new (function() constructor {
		objects = array_map(asset_get_ids(asset_object), function(_obj) {
			return {
				ref: _obj,
				name: object_get_name(_obj),
				n: undefined,
			};
		});
		nobj = array_length(objects);
		ninst = undefined;
		view = undefined;
		section = undefined;
		
		refresh = function() {
			ninst = instance_count;
			array_foreach(objects, function(_obj) {
				_obj.n = instance_number(_obj.ref);
			});
			array_sort(objects, function(_a, _b) {
				return sign(_b.n - _a.n);
			});
			if (view != undefined) {
				dbg_view_delete(view);
				dbg_section_delete(section);
			}
			view = dbg_view("Instances", true, 16, 35, 400, 500);
			section = dbg_section($"Total: {instance_count}");
			for (var _i = 0; _i < nobj; _i++) {
				var _obj = objects[_i];
				if (_obj.n == 0) break;
				dbg_watch(ref_create(_obj, "n"), _obj.name);
			}
		};
		refresh();
		call_later(1, time_source_units_frames, function() {
			if (not is_debug_overlay_open()) return;
			if (instance_count == ninst) return;
			refresh();
		}, true);
	})();
}
fx_tint = fx_create("_filter_tintfilter");
fx_set_parameter(fx_tint, "g_TintCol", [1, 1, 1, 1]);
//fx_set_single_layer(fx_tint,true);
layer_set_fx(layer, fx_tint);
c = 255;
fade_in = true;
fade_out = false;
/*
scr_view_vars, by BPzeBanshee

What it does:
Does a few extra lines of code here, so you don't have to.
Kind of a Macro command for using view-relative positions
without it wobbling out of sync with the screen.

Usage:
scr_view_vars()

Call at the beginning of every Draw event
*/

xview = view_xview[0] + x_o;
yview = view_yview[0] + y_o;

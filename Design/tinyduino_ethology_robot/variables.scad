roundness      = 200;
cube_allowance = 0.5;
rad_allowance  = 0.25;
in_to_mm       = 25.4;

peg_r          = 2.5;// + rad_allowance;
peg_h          = 8;// + cube_allowance;

tiny_side    = 50.8;
tiny_h       = 2;
tiny_border  = 2;

servo_horn_r = 10.1; 
servo_horn_h = 2.1;
servo_hub_r = 5;
servo_hub_h = 3.2;
servo_hub_zscale = 3.75;

fitec_wing_x = 32.6 + cube_allowance;
fitec_wing_y = 12.5 + cube_allowance * 2;
fitec_wing_z = 2.4 + cube_allowance;
fitec_base_x = 23.2 + cube_allowance;
fitec_base_y = 12.5 + cube_allowance * 2;
fitec_base_z = 16 + cube_allowance;
fitec_top_x  = 23.2 + cube_allowance;
fitec_top_y  = 12.5 + cube_allowance * 2;
fitec_top_z  = 8.5 + cube_allowance;
fitec_z      = fitec_base_z + fitec_wing_z + fitec_top_z;
fitec_offset = 6.3;//10;

//fitec_wing_x = 56 + cube_allowance;
//fitec_wing_y = 20 + cube_allowance * 2;
//fitec_wing_z = 4 + cube_allowance;
//fitec_base_x = 42 + cube_allowance;
//fitec_base_y = 20 + cube_allowance * 2;
//fitec_base_z = 27.5 + cube_allowance;//16 + cube_allowance;
//fitec_top_x  = 42 + cube_allowance;
//fitec_top_y  = 20 + cube_allowance * 2;
//fitec_top_z  = 8 + cube_allowance;
//fitec_z      = fitec_base_z + fitec_wing_z + fitec_top_z;
//fitec_offset = 10;

motor_deck_c = 2;//peg_h + 2;
motor_deck_y = (fitec_z * 2 - fitec_top_z * 2) + 4;//peg_h * 2;
motor_deck_x = peg_h * 7;//54;//motor_deck_y;
motor_deck_z = fitec_base_y + motor_deck_c;

motor_mount_x = 25;
motor_mount_y = 12;
motor_mount_z = 12;

dc_motor_x = 15;
dc_motor_y = 12;
dc_motor_z = 10;
dc_motor_ro = 3;
dc_motor_ri = 1;
dc_motor_span = 18;

drive_deck_z = 12;

//wheel_r      = 35;
wheel_h      = 8;

wheel_large_r = 30;
wheel_r = 20;
wheel_ri = 14;
wheel_t = 6;
tire_t  = wheel_t + 4;
spoke_r = tire_t * 0.5 + 2;
spoke_l = wheel_r * 4;

kipr_x     = 4.125 * in_to_mm + cube_allowance; //105;
kipr_y     = 4.125 * in_to_mm + cube_allowance; //105;
kipr_z     = 10; // Does this meet clearance for the on/off switch?
kipr_r     = 4;
kipr_ro    = 10;
kipr_floor = 3;
kipr_lip   = 20;
usb_y      = 60;
plug_x     = 6 * 2;
plug_y     = kipr_x - peg_h;

//1/2 inch ball... redo dimensions
//Move casters in, and make a tab on inner wall of deck, front and back
//that accomodates the 10mm screws with their 2mm nuts.
//caster cylinder
caster_r = 15.2 * 0.5;
caster_h = 13.5 * 0.5;
//caster ball
caster_ball_r = 7.6 * 0.5;
//caster mount tabs
caster_mount_ro = 2.8 * 0.35;
caster_mount_ri = 2.8 * 0.35;
caster_mount_xo = 20.3 * 0.5;
caster_mount_xi = 14.7 * 0.5;
caster_mount_h  = 2.8;

switch_x = 20;
switch_y = 10;
switch_z = 6;
switch_mount_offset = 5;
switch_screw_r = 1.5 * 0.5;
switch_screw_h = switch_z + cube_allowance;

tiny_screen_x = 25.8 + cube_allowance;
tiny_screen_y = 25 + cube_allowance;
tiny_screen_z = 5.9;
tiny_mount_xd = 17;
tiny_mount_r = 0.75;
tiny_mount_y_indent = 1.4;
tiny_stack_xy  = 20 + cube_allowance;
//tiny_shield_z  = 3.99;
//tiny_stack_z   = tiny_shield_z * 3;

battery_buff   = 2;
battery_x      = 50 + cube_allowance;//22;
battery_y      = 30 + cube_allowance;//22;
battery_z      = 7 + cube_allowance;//6;

mini_battery_x = 6 + cube_allowance;
mini_battery_y = 12 + cube_allowance;
mini_battery_z = 18 + cube_allowance;

protoboard_xy  = 30 + cube_allowance; //2 * in_to_mm + cube_allowance;
protoboard_z   = 0.6 + cube_allowance; //2 + cube_allowance;

header_w   = 3;
header_9_l  = 24 + cube_allowance;//23.41;//26;
header_12_l = 31.03;//(2.54 * 12) + 0.25;//33;
header_h = 10;

nut_r          = 10;
nut_h          = 3;

ldr_r  = 2.5;
ldr_h  = 15;
ldr_ro = ldr_r + 2;

mini_servo_base_x = 18; 
mini_servo_base_y = 8; 
mini_servo_base_z = 11; 
mini_servo_wing_x = 26; 
mini_servo_wing_y = 8; 
mini_servo_wing_z = 1; 
mini_servo_top_x = 18; 
mini_servo_top_y = 8; 
mini_servo_top_z = 4;
mini_servo_offset = 4;
mini_servo_z = mini_servo_base_z + mini_servo_wing_z + mini_servo_top_z;

mini_deck_c = 2;//peg_h + 2;
mini_deck_y = mini_servo_z * 2;
mini_deck_x = peg_h * 7;
mini_deck_z = mini_servo_base_y + mini_deck_c;

wireling_xy     = 10;
wireling_x      = 8;
wireling_y      = 12;
wireling_z      = 3;
border_xy       = 4;
wireling_hole_r = 0.6;
wireling_hole_d = 7;
wireling_screw  = 20;

wheels_w   = 20;
wheels_r   = 20;
shell_x    = 64;
//shell_y    = fitec_z * 2 - fitec_top_z * 2 + 4 + peg_h * 2;
shell_y    = fitec_z * 2 - fitec_top_z * 2 + 0 + peg_h * 2;
shell_z    = 60;
tread_shell_x = shell_x + motor_deck_z;
tread_shell_z = 56;
top_z      = 4 + peg_h;
rear_col_w = peg_h;
pcb_z = 2 + cube_allowance;
pcb_x = 50 + cube_allowance;
pcb_y = 50 + cube_allowance;
pcb_r = 3 + rad_allowance;
pcb_inset = 2 - cube_allowance;
pcb_deck_z = pcb_z + peg_h * 2;
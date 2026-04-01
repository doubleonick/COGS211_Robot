include<foundational_modules.scad>
include<grip_mount.scad>
/************************************************************/
roundness      = 200;
cube_allowance = 0.5;
rad_allowance  = 0.25;
in_to_mm       = 25.4;

peg_r          = 2.5;// + rad_allowance;
peg_h          = 8;// + cube_allowance;

kipr_x     = 140;//105;
kipr_y     = 127;//105;
kipr_z     = 10; // Does this meet clearance for the on/off switch?
kipr_r     = 10;
kipr_floor = 3;
kipr_lip   = 40;
usb_y      = 60;
plug_x     = 6 * 2;
plug_y     = kipr_x - peg_h;

tiny_side    = 50.8;
tiny_h       = 2;
tiny_border  = 2;
//emax_h      = emax_base_h + emax_wing_h + emax_top_h;
//emax_offset = 7;
servo_horn_r = 10.1; 
servo_horn_h = 2.1;
servo_hub_r = 5;
servo_hub_h = 3.2;
servo_hub_zscale = 3.75;

geek_x = 40;
geek_y = 24;
geek_z = 24 + 4;

fitec_wing_x = 56 + cube_allowance;
fitec_wing_y = 20 + cube_allowance;
fitec_wing_z = 2 + cube_allowance;
fitec_base_x = 41 + cube_allowance;//40 + cube_allowance;
fitec_base_y = 20 + cube_allowance;
fitec_base_z = 29.5 + cube_allowance;//16 + cube_allowance;
fitec_top_x  = 40 + cube_allowance;
fitec_top_y  = 20 + cube_allowance;
fitec_top_z  = 8 + cube_allowance;
fitec_z      = fitec_base_z + fitec_wing_z + fitec_top_z;
fitec_offset = 10;

wheel_r      = 73/2;//35;
wheel_h      = 8;


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

caster_z = 10 + kipr_r;

switch_x = 20;
switch_y = 10;
switch_z = 6;
switch_mount_offset = 5;
switch_screw_r = 1.5 * 0.5;
switch_screw_h = switch_z + cube_allowance;

tiny_stack_xy  = 20 + cube_allowance;
tiny_shield_z  = 3.99;
tiny_stack_z   = tiny_shield_z * 3;
battery_buff   = 2;

protoboard_xy  = 30 + cube_allowance; //2 * in_to_mm + cube_allowance;
protoboard_z   = 0.6 + cube_allowance; //2 + cube_allowance;

header_w   = 3;
header_9_l  = 24 + cube_allowance;//23.41;//26;
header_12_l = 31.03;//(2.54 * 12) + 0.25;//33;
header_h = 10;

wireling_xy     = 10;
wireling_x      = 8;
wireling_y      = 12;
wireling_z      = 4;
border_xy       = 4;
wireling_hole_r = 1;

nut_r          = 7.5;
nut_z          = 6 + cube_allowance;
bolt_shaft_r   = 4 + rad_allowance * 2;
bolt_shaft_z   = 10;//20;
bolt_head_r    = 10;

ldr_r  = 2.5;
ldr_h  = 15;
ldr_ro = ldr_r + 2;

battery_turnigy_x = 105 + cube_allowance;//74 + cube_allowance;
battery_turnigy_y = 16 + cube_allowance;//28 + cube_allowance;
battery_turnigy_z = 34 + cube_allowance;//45 + cube_allowance;

battery_zeee_x = 79.375 + cube_allowance;
battery_zeee_y = 25.4 + cube_allowance;
battery_zeee_z = 33.3375 + cube_allowance;

battery_spektrum_x = 70 + cube_allowance;
battery_spektrum_y = 21 + cube_allowance;
battery_spektrum_z = 46 + cube_allowance;

battery_x = 74 + cube_allowance;
battery_y = 28 + cube_allowance;
battery_z = 45 + cube_allowance;

uni_battery_x = 105 + cube_allowance;
uni_battery_y = 29 + cube_allowance;
uni_battery_z = 47 + cube_allowance;

plug_buffer = 14;//70;
frame_x     = 120 + plug_buffer;// + nut_z;
frame_y     = 8;
frame_z     = nut_r * 3 + 4;

/************************************************************/
/************************************************************/
module fitec_cutout(solo)
{
    
    wire_z = 50;//25;
    screw_offset = 3;
    
    translate([0, 0, fitec_base_z + fitec_wing_z * 0.5])
    {   
        cube_base(fitec_wing_x, fitec_wing_y, fitec_wing_z);
        translate([0, 0, (fitec_wing_z + fitec_top_z) * 0.5])
        cube_base(fitec_top_x, fitec_top_y, fitec_top_z);
        translate([0, 0, -(fitec_wing_z + fitec_base_z) * 0.5])
        cube_base(fitec_base_x, fitec_base_y, fitec_base_z);
        translate([fitec_wing_x/2 - screw_offset, 5, fitec_wing_z])
        cylinder_base(2, fitec_top_z + fitec_wing_z * 4, roundness);
        translate([-(fitec_wing_x/2 - screw_offset), 5, fitec_wing_z])
        cylinder_base(2, fitec_top_z + fitec_wing_z * 4, roundness);
        translate([fitec_wing_x/2 - screw_offset, -5, fitec_wing_z])
        cylinder_base(2, fitec_top_z + fitec_wing_z * 4, roundness);
        translate([-(fitec_wing_x/2 - screw_offset), -5, fitec_wing_z])
        cylinder_base(2, fitec_top_z + fitec_wing_z * 4, roundness);
        translate([fitec_wing_x/2 - screw_offset, 5, -fitec_top_z])
        cylinder_base(1, fitec_base_z, roundness);
        translate([-(fitec_wing_x/2 - screw_offset), 5, -fitec_top_z])
        cylinder_base(1, fitec_base_z, roundness);
        translate([fitec_wing_x/2 - screw_offset, -5, -fitec_top_z])
        cylinder_base(1, fitec_base_z, roundness);
        translate([-(fitec_wing_x/2 - screw_offset), -5, -fitec_top_z])
        cylinder_base(1, fitec_base_z, roundness);

    }   
   
    translate([fitec_wing_x - fitec_base_x + 1, 0, wire_z * 0.1])
    cube_base(fitec_wing_x + 8 + peg_h + cube_allowance, 6 + cube_allowance, wire_z);
    
    if(solo == 0)
    {
        //Cable space can be subtracted out on either side... channel for sliding wire down.
        translate([0, 0, -fitec_top_z/2-cube_allowance - fitec_wing_z/8])
        cube_base(fitec_wing_x, 4, fitec_base_z * 2.5 + fitec_wing_z/2 - cube_allowance/4);
    }
}
/************************************************************/
module wheel_mounted(r_scale, h_scale)
{
    rotate([0, -90, 0])
    cylinder_base(wheel_r * r_scale, wheel_h * h_scale, roundness);
}
/************************************************************/
module wheel_base()
{
    for(x = [-1, 1])
    {
        translate([((kipr_x + peg_h * 2 + plug_x) * 0.5 + fitec_top_z + fitec_wing_z + wheel_h) * x, fitec_offset, wheel_r])
        wheel_mounted(1, 1);
    }
}
/************************************************************/
module mount_points()
{
    for(x = [-8:8])
    {
        translate([peg_h * x, (kipr_y + peg_h * 1)* 0.5, peg_h * 1.5])
        cylinder_base(peg_r, peg_h, 150);
        translate([peg_h * x, -(kipr_y + peg_h * 1)* 0.5, peg_h * 1.5])
        cylinder_base(peg_r, peg_h, 150);
    }
    //Front and Back Deck
    for(r = [-2, 0])
    {
        for(x = [-7:7])
        {
            for(z = [-3.5:0.5])
            {           
                rotate([0, 0, 90 * r])
                //rotate([90, 0, 0])
                translate([peg_h * x, (kipr_y + peg_h * 0.5)* 0.5, peg_h * 0.25 + peg_h * z])
                rotate([90, 0, 0])
                cylinder_base(peg_r, peg_h * 2 + cube_allowance, roundness);
            }
        }
    }
    //Sides Deck
    for(x = [-8, -7, -6, -5, -4, 6, 7, 8])
    {
        for(z = [-3.5:0.5])
        {
            rotate([0, 0, 90])
            translate([peg_h * x, (kipr_x + peg_h * 1)* 0.5, peg_h * 0.25 + peg_h * z])
            rotate([90, 0, 0])
            cylinder_base(peg_r, peg_h * 2.5 + cube_allowance, roundness);
        }
    }
    mirror([1, 0, 0])
    {
        for(x = [-8, -7, -6, -5, -4, 6, 7, 8])
        {
            for(z = [-3.5:0.5])
            {
                rotate([0, 0, 90])
                translate([peg_h * x, (kipr_x + peg_h * 1)* 0.5, peg_h * 0.25 + peg_h * z])
                rotate([90, 0, 0])
                cylinder_base(peg_r, peg_h * 2.5 + cube_allowance, roundness);
            }
        }
    }
}
/************************************************************/
module deck_base()
{
    wire_gap_y1 = 20;
    wire_gap_y2 = 30;
    deck_z = 56;
    //Top of deck
    translate([0, 0, -(kipr_z + kipr_floor - cube_allowance * 2)])
    difference()
    {
        cube_rounded(kipr_x + peg_h * 2 + plug_x, kipr_y + peg_h * 2, deck_z, kipr_r);
        translate([0, fitec_offset, 0])
        cube_base(kipr_x + plug_x - peg_h * 4, fitec_wing_x + peg_h * 5, deck_z + cube_allowance);
        
        translate([0, fitec_offset, 0])//peg_h * 0.75])
            cube_base(kipr_x + kipr_lip * 2, fitec_wing_x + peg_h * 1, deck_z);
        
        //Make sure servos can slide in
        difference()
        {
            cube_rounded(kipr_x + plug_x, kipr_y, deck_z + cube_allowance, kipr_r);
            translate([0, fitec_offset, 0])//peg_h * 0.75])
            cube_base(kipr_x + kipr_lip * 2, fitec_wing_x + peg_h * 5, deck_z);//peg_h * 6);
        }
        
        //Servo and battery rail slots
        for(x = [-1, 1])
        {
            translate([(kipr_x + plug_x - peg_h) * 0.5 * x, fitec_offset, 0])
            cube_base(peg_h + cube_allowance, fitec_wing_x + peg_h * 3, deck_z + cube_allowance);
        }
    }
    
}
/************************************************************/
module peg()
{
    cylinder_base(peg_r, peg_h, roundness);
}

/************************************************************/
module servo_unit_frame()
{
    difference()
    {
        cube_rounded(fitec_wing_x + peg_h * 1, fitec_base_y + peg_h * 3, fitec_base_z, peg_h);

    }
}
/************************************************************/
module semi_circle_cutouts(cutout_scale_x, cutout_scale_y)
{
    rotate([90, 0, 0])
    translate([0, 0, (fitec_base_y - peg_h * 0.5) * z])
    {
        scale(cutout_scale_x)
        translate([peg_h * 2.5, 0, 0])
        color("red")
//        scale(cutout_scale_x)
        difference()
        {
            cylinder_base((fitec_wing_x - peg_h * 4) * 0.5, peg_h * 2, roundness);
            translate([(fitec_wing_x - peg_h * 4) * 0.5, 0, 0])
            cube_base((fitec_wing_x - peg_h * 4), (fitec_wing_x - peg_h * 4), peg_h * 2 + cube_allowance);
        }
        scale(cutout_scale_x)
        translate([-peg_h * 2.5, 0, 0])
        color("cyan")
//        scale(cutout_scale_x)
        difference()
        {
            cylinder_base((fitec_wing_x - peg_h * 4) * 0.5, peg_h * 2, roundness);
            translate([-(fitec_wing_x - peg_h * 4) * 0.5, 0, 0])
            cube_base((fitec_wing_x - peg_h * 4), (fitec_wing_x - peg_h * 4), peg_h * 2 + cube_allowance);
        }
        scale(cutout_scale_y)
        translate([0, peg_h * 1.5, 0])
        color("green")
//        scale(cutout_scale_y)
        difference()
        {
            cylinder_base((fitec_wing_x - peg_h * 4) * 0.5, peg_h * 2, roundness);
            translate([0, (fitec_wing_x - peg_h * 4) * 0.5, 0])
            cube_base((fitec_wing_x - peg_h * 4), (fitec_wing_x - peg_h * 4), peg_h * 2 + cube_allowance);
        }
        scale(cutout_scale_y)
        translate([0 , -peg_h * 1.5, 0])
        color("orange")
        
        difference()
        {
            cylinder_base((fitec_wing_x - peg_h * 4) * 0.5, peg_h * 2, roundness);
            translate([0, -(fitec_wing_x - peg_h * 4) * 0.5, 0])
            cube_base((fitec_wing_x - peg_h * 4), (fitec_wing_x - peg_h * 4), peg_h * 2 + cube_allowance);
        }
    }
}
/************************************************************/
module servo_unit_frame_open()//wire_end)
{
    wire_y = 8;
    center_x = fitec_wing_x + cube_allowance;
    cutout_scale_y = [1, 0.75, 1];
    cutout_scale_x = [0.75, 1, 1];
//    center_x = fitec_base_x + (fitec_wing_x - fitec_base_x) * 0.75;
    difference()
    {
        servo_unit_frame();
        //ceter cutout
        cube_rounded(center_x, fitec_base_y + peg_h/2 + cube_allowance, fitec_z, peg_h);
        //wire notch
//        if(wire_end == "x_side")
//        {
            translate([(fitec_wing_x - peg_h/2)/2, 0, fitec_base_z * 0.05])
            cube_base(peg_h * 1.5 + cube_allowance, wire_y, fitec_base_z * 0.9 + cube_allowance);
//        }
//        else if(wire_end == "y_side")
//        {
            translate([0, (fitec_base_y + peg_h * 1.5)/2, fitec_base_z * 0.05])
            cube_base(wire_y, peg_h * 1.5 + cube_allowance, fitec_base_z * 0.9 + cube_allowance);
//        }
        
//        rotate([90, 0, 0])
//        translate([0, 0, (fitec_base_y + peg_h * 1.5)/2])
//        cylinder_base((fitec_wing_x - peg_h * 4) * 0.5, peg_h * 2, roundness);
        
        
        //Fulcrum screws
        rotate([0, 90, 0])
        translate([0, 0, -center_x * 0.5])
        fulcrum_screws();
        mirror([1, 0, 0])
        rotate([0, 90, 0])
        translate([0, 0, -center_x * 0.5])
        fulcrum_screws();
        
//        rotate([90, 0, 0])
//        translate([0, 0, (fitec_base_y + peg_h * 2) * 0.5])
//        fulcrum_screws();
//        mirror([0, 1, 0])
//        rotate([90, 0, 0])
//        translate([0, 0, (fitec_base_y + peg_h * 2) * 0.5])
//        fulcrum_screws();
        //CUTOUTS TO ELIMINATE MATERIAL... SEMI-CIRCULAR
        for(z = [-1, 1])
        {
            semi_circle_cutouts(cutout_scale_x, cutout_scale_y);
        }
    }
}
/************************************************************/
module servo_unit()
{
    difference()
    {
        servo_unit_frame();
        translate([0, 0, -(fitec_base_z/2 - fitec_wing_z)])
        fitec_cutout();
//        translate([0, peg_h * 0.5, (-fitec_wing_z)])
//        cube_base(fitec_base_x, fitec_base_y + peg_h + cube_allowance, fitec_base_z);
    }
}
/**********************************************************/
module insert_base()
{    
    wall_thickness = 6;
    cutout_r = kipr_y/2 - peg_h * 2;
    stand_off_z = 50;

    difference()
    {
        translate([0, 0, stand_off_z/2])
        cube_base(kipr_x, kipr_y, peg_h + stand_off_z);

        translate([0, 0, stand_off_z/2])
        cube_rounded(kipr_x - 8, kipr_y - 8, stand_off_z, 10);

        translate([0, (kipr_y + cube_allowance)/2, stand_off_z/2])
        scale([1, 0.65, 1])
        cylinder_base(cutout_r, peg_h + stand_off_z, roundness);

        translate([0, -(kipr_y + cube_allowance)/2, stand_off_z/2])
        scale([1, 0.65, 1])
        cylinder_base(cutout_r, peg_h + stand_off_z, roundness);

        translate([(kipr_x + cube_allowance)/2, 0, stand_off_z/2])
        scale([0.65, 1, 1])
        cylinder_base(cutout_r, peg_h + stand_off_z, roundness);

        translate([-(kipr_x + cube_allowance)/2, 0, stand_off_z/2])
        scale([0.65, 1, 1])
        cylinder_base(cutout_r, peg_h + stand_off_z, roundness);
    }
}
/************************************************************/
module servo_with_M3_insert_geek()
{
    wire_y = 8;
    center_x = fitec_wing_x + cube_allowance;
    
    
    //24 x 24 (+ 4) x 40
//    servo_with_M3_mounts();
    
    difference()
    {
        //ceter cutout
        color("cyan")
        cube_rounded(center_x, fitec_base_y + peg_h/2, fitec_base_z, peg_h);
        scale([1, 1, (1 + cube_allowance)/1])
        servo_M3_holes();
        translate([0, 0, (fitec_base_z - geek_z) * 0.5])
        cube_base(geek_x, geek_y, geek_z);
        
        translate([0, (fitec_base_y + peg_h * 2)/2, 0])
        cube_base(wire_y, peg_h * 1.5 + cube_allowance, fitec_base_z + cube_allowance);
    }
    rotate([0, 0, 90])
    for(x = [-1:1])
    {
        translate([peg_h * x, 0, -(geek_z - peg_h * 0.5) * 0.5])
        scale([1, 1, 0.5])
        color("red")
        technic_beam_odd(5);
    }
    
}
/************************************************************/
/* SWITCH CASING */
switch_ox = 30 + 8;
switch_oy = 21 + 8;
switch_oz = 20;
switch_ix = 30 + cube_allowance;
switch_iy = 21 + cube_allowance;
switch_iz = switch_oz + cube_allowance;//40 + cube_allowance;
//switch_z  = 50;
switch_r = 5;

module switch_casing()
{
    difference()
    {
        cube_rounded(switch_ox, switch_oy, switch_oz, switch_r);
        cube_base(switch_ix, switch_iy, switch_iz);
    }
}

/* SWITCH CASING */

/************************************************************/
module battery_spektrum()
{
    wire_r = 8;
    
    cube_base(battery_spektrum_x, battery_spektrum_y, battery_spektrum_z * 1.01);
    translate([battery_spektrum_x * 0.5, 0, 0])
    cylinder_base(wire_r, battery_spektrum_z * 1.01, roundness);
}
/************************************************************/
/*Battery Casing*/
module battery_casing_base(rail_scale)
{  
//    rail_scale = 1; 
   
    union()
    {
        rotate([90, 0, 0])
        cube_rounded(battery_x + 4, uni_battery_z, uni_battery_y + 6, peg_h);
        rotate([0, 90, 0])
        {
            scale(rail_scale)
            cube_base(uni_battery_z, uni_battery_y + 16, peg_h);
            for(y = [-1, 1])
            {      
//                scale(1/rail_scale)
                translate([0, (uni_battery_y + 16 + 8)/2 * y, 0])
                rotate([90, 0, 0])
                scale(rail_scale)
                cube_rounded(uni_battery_z, peg_h * 2, 8, peg_h);
            }
        }
    }   
    
}
/************************************************************/
module battery_casing()
{  
    difference()
    {
        cube_rounded_full(battery_x + 6, battery_y + 6, battery_z * 1, peg_h);
        translate([3, 0, -3])
        cube_base(battery_x + 3, battery_y, battery_z * 1.01);
    }
}

/************************************************************/
module nut()
{
    cylinder_base(nut_r, nut_z, 6);
    cylinder_base(bolt_shaft_r, bolt_shaft_z * 5, roundness);
}
/************************************************************/
module nut_parametric(or, ir, nz, bz)
{
    cylinder_base(or, nz, 6);
    cylinder_base(ir, bz, roundness);
}
/************************************************************/
module giga_battery_switch_insert()
{
    rotate([0, 0, 180])
    translate([-plug_buffer/2, 0, 0])
    difference()
    {
        translate([-40.15 - 1.8, 14.9 * 2 + 5, -3.75])
        displayCase();
        translate([0, -0, 14])
        cube_base(120, 90, 20);
    }
    
    difference()
    {
        translate([0, 0, nut_r])
        cube_rounded(frame_x + bolt_shaft_z * 2, 90, frame_z, peg_h);
        translate([0, 0, nut_r])
        cube_rounded(frame_x, 90 - frame_y, frame_z + cube_allowance, peg_h);
        
        //NUTS
        //Battery side Nut
        translate([-(frame_x + bolt_shaft_z * 2) * 0.5 + (nut_z + cube_allowance/2), 0, nut_r * 1.5])
        rotate([0, 90, 0])
        rotate([0, 0, 360/12])
        nut();
        
        //Display side Nut
        translate([(frame_x + bolt_shaft_z * 2) * 0.5 - (nut_z + cube_allowance/2), 0, nut_r * 1.5])
        rotate([0, 90, 0])
        rotate([0, 0, 360/12])
        nut();
        
        translate([0, 0, frame_z * 0.75])
        cube_base(120, 90, 20);
        translate([0, 0, -frame_z * 0.75])
        cube_base(120, 90, 20);
    }
      
    translate([-(frame_x + nut_z * 2 - switch_ox * 2.5) * 0.5, (battery_z + switch_oy * 0.5 - (switch_ox - switch_ix - switch_r * 0.65)), (switch_r - cube_allowance * 1.5)])
    switch_casing();
}
/************************************************************/
module switch_mount_holes()
{
    translate([switch_mount_offset, switch_y * 0.5, 0])
    cylinder_base(switch_screw_r, peg_h + 2 + cube_allowance, 150);
    translate([-switch_mount_offset, switch_y * 0.5, 0])
    cylinder_base(switch_screw_r, peg_h + 2 + cube_allowance, 150);
}
/************************************************************/
module switch_mounts()
{
    for(x = [-3:3])
    {
        translate([switch_x * x, -switch_y * 1.5 - (kipr_y - peg_r * 5) * 0.5, -peg_h * 3.7])
        scale([1, 1, 3])
        switch_mount_holes();
    }
    mirror([0, 1, 0])
    {
        for(x = [-3:3])
        {
            translate([switch_x * x, -switch_y * 1.5 - (kipr_y - peg_r * 5) * 0.5, -peg_h * 3.7])
            scale([1, 1, 3])
            switch_mount_holes();
        }
    }
}
/************************************************************/
batt_monitor_ix = 48;
batt_monitor_iy = 26;
batt_monitor_iz = 20;
batt_monitor_ox = batt_monitor_ix + 4;
batt_monitor_oy = batt_monitor_iy + 4;
batt_monitor_oz = batt_monitor_iz;
batt_monitor_r  = 5;

module battery_monitor_insert()
{
    translate([(frame_x + nut_z * 2 - batt_monitor_ox) * 0.5, (battery_z + batt_monitor_oy * 0.5 - (batt_monitor_ox - batt_monitor_ix - batt_monitor_r * 0.65)), batt_monitor_r - cube_allowance * 1.5])
    difference()
    {
        cube_rounded(batt_monitor_ox, batt_monitor_oy, batt_monitor_oz, batt_monitor_r);
        cube_base(batt_monitor_ix, batt_monitor_iy, batt_monitor_iz + cube_allowance);
    }
}
/************************************************************/
module electronics_battery_servos()
{
    rail_floor = 15;
    batt_case_z = (frame_y + batt_monitor_oy + battery_z * 1.25) * 2 - (fitec_top_z + fitec_wing_z) * 2 - (fitec_base_z) * 2;
    for(x = [-1, 1])
    {
        difference()
        {
            union()
            {
//                translate([0, 0, (fitec_wing_x + peg_h * 1) * 0.5])
//                translate([(frame_x * 0.5 + fitec_wing_z * 0.75) * x, 0, 0])
//                rotate([0, 0, 90 * x])
//                rotate([90, 0, 0])
//                servo_unit();
                                
                translate([0, 0, (fitec_wing_x + peg_h * 1) * 0.50])
                rotate([0, 0, 90])
                rotate([90, 0, 0])
                cube_rounded(fitec_wing_x + peg_h * 1, fitec_base_y + cube_allowance * 2 + rail_floor + peg_h, batt_case_z, peg_h);
            }

            //Axle holes for connecting to servos
            for(x = [-1, 1])
            {
                rotate([90, 0, 0])
                translate([(batt_case_z/2 - peg_h/2) * x, (fitec_wing_x + peg_h * 1) * 0.50, 0])
                {
                    translate([(fitec_base_z * 0.5 - peg_h * 0.5) * 0, -(fitec_base_y - peg_h * 0.5), 0])
                    axle(peg_h * 10);
                    mirror([0, 1, 0])

                    translate([(fitec_base_z * 0.5 - peg_h * 0.5) * 0, -(fitec_base_y - peg_h * 0.5), 0])
                    axle(peg_h * 10);
                }
            }
    
//            //Screw holes for the fulcrum installation
//            translate([(fulcrum_rb * 0.75 + cube_allowance * 2.5) * x, -fitec_offset, (fitec_wing_x + peg_h * 1) * 0.5 - 15])
//            fulcrum_screws();
            //vent holes for battery
            for(xi = [-2:2])
            {
                translate([peg_h * 2.5 * xi, 0, (fitec_wing_x + cube_allowance) * 0.75 + peg_h])
                cube_rounded(peg_h * 1.5, fitec_base_x, peg_h * 3, peg_h * 1.5);
            }
        }
    }
    
}
/************************************************************/
//BATTERY CASING
//rotate([0, 0, 90])
//battery_casing_base(1);
//HULL
caster_offset = 8;
//module servo_frame_base()
//{
//    difference()
//    {
//        union()
//        {
//            translate([0, 0, kipr_z + kipr_floor])
//            difference()
//            {
//                union()
//                {
//                    //MOVE THE BAR IN THE BACK UP SO THAT THE BATTERY MODULE
//                    //MAY BE INSTALLED PROPERLY
//                    deck_base();
//                    translate([0, 0, -(kipr_z + kipr_floor) * 3.0 - kipr_r * 0.5 + caster_offset])
//                    caster();
//                }
////                mount_points();
////                switch_mounts();
//            }
//        }
//    }
//}
/************************************************************/
module battery_w_M3()
{
    rail_floor = 15;
    batt_case_z = (frame_y + batt_monitor_oy + battery_z * 1.25) * 2 - (fitec_top_z + fitec_wing_z) * 2 - (fitec_base_z) * 2;
    for(x = [-1, 1])
    {
        difference()
        {
            union()
            {
                                
                translate([0, 0, (fitec_wing_x + peg_h * 1) * 0.50])
                rotate([0, 0, 90])
                rotate([90, 0, 0])
                cube_rounded(fitec_wing_x, fitec_wing_x + peg_h, batt_case_z, peg_h);
            }

            //vent holes for battery            
            for(xi = [-2:2])
            {
                translate([peg_h * 2.5 * xi, 0, peg_h * 4])
                scale([1, 1, 4])
                cube_rounded(peg_h * 1.5, fitec_base_x, peg_h * 3, peg_h * 1.5);
            }
            
        }
    }
    
}
/************************************************************/
module battery_deck_M3_spektrum()
{
    switch_x = 4;
    switch_y = 12;
    switch_z = 12;
    corner_r = 4;
    
    batt_case_z = (frame_y + batt_monitor_oy + battery_z * 1.25) * 2 - (fitec_top_z + fitec_wing_z) * 2 - (fitec_base_z) * 2;
    
    color("blue")
    difference()
    {
        rotate([90, 0, 0])
        translate([0, 0, -(fitec_wing_x + peg_h) * 0.50])
        scale([0.8, 1, 1])
        battery_w_M3();
        
        //Pilot holes for heat insert screws
        rotate([0, 90, 0])
        rotate([0, 0, 90])
        translate([0, -peg_h * 0.75, 0])
        {
            translate([(fitec_wing_x - peg_h) * 0.5, -(peg_h * 2), 0])
            scale([1, 1, 30])
            peg();
            mirror([0, 1, 0])
            translate([(fitec_wing_x - peg_h) * 0.5, -(peg_h * 2), 0])
            scale([1, 1, 30])
            peg();
            
            mirror([1, 0, 0])
            {
                translate([(fitec_wing_x - peg_h) * 0.5, -(peg_h * 2), 0])
                scale([1, 1, 30])
                peg();
                mirror([0, 1, 0])
                translate([(fitec_wing_x - peg_h) * 0.5, -(peg_h * 2), 0])
                scale([1, 1, 30])
                peg();
            }
        }
        
        //Cavity for the battery
//        rotate([90, 0, 0])
        for(y = [-1, 1])
        {
            translate([-4, 2 * y + battery_spektrum_y * 0.5 * y, fitec_base_x - battery_spektrum_z * 1.01/2 - peg_h * 1.65])

                battery_spektrum();
        }
    }
    for(x = [-1, 1])
    {
        translate([(batt_case_z - switch_y * 4) * 0.5 * x, (fitec_wing_x + peg_h + switch_y + switch_x * 2) * 0.5, battery_spektrum_z - switch_z * 2])
            color("white")
            round_power_switch();
    }
}
/************************************************************/
module axle(length)
{
    axle_x = peg_r * 2 - rad_allowance;
    axle_y = peg_h/3 - rad_allowance;
    axle_z = length;
    axle_r = peg_h/6;
    
    cube_rounded_full(axle_x, axle_y, axle_z, axle_r);
    cube_rounded_full(axle_y, axle_x, axle_z, axle_r);
}
/************************************************************/
module axle_half_beam_1x2()
{
    difference()
    {
        cube_rounded(peg_h, peg_h * 2, peg_h/2, peg_h);
        for(y = [-0.5, 0.5])
        {
            translate([0, peg_h * y, 0])
            axle(peg_h * 3);
        }
    }
}
/************************************************************/
module tread_axle()
{
    scale([3, 3, 1])
    difference()
    {
        import("C:/Users/nilivingston/Documents/CAD/COGS320_2026/TK_Tread_Wheel.stl");
        cylinder_base((peg_r + cube_allowance), 20, roundness);
    }
    translate([0, 0, 0.37])
    difference()
        {
            cylinder_base((peg_r + cube_allowance) * 3, 9.25, roundness);
            cylinder_base(peg_r + cube_allowance, 20, roundness);
        }
    difference()
    {
        import("C:/Users/nilivingston/Documents/CAD/COGS320_2026/TK_Tread_Wheel.stl");
        difference()
        {
            cylinder_base(45, 20, roundness);
            cylinder_base(peg_r + cube_allowance, 20, roundness);
        }
    }
}

/************************************************************/
module technic_beam_even(peg_count)//PROBABLY CAN PARAMETERIZE THIS
{
    cube_rounded(peg_h, peg_h * peg_count, peg_h, peg_h);
}
/************************************************************/
module technic_beam_odd(peg_count)//PROBABLY CAN PARAMETERIZE THIS
{
    cube_rounded(peg_h, peg_h * peg_count, peg_h, peg_h);
}
/************************************************************/
module large_button_switch()
{
    switch_x = 4;
    switch_y = 12;
    switch_z = 12;
    corner_r = 4;
    
    difference()
    {
        cube_rounded(switch_x + 2, switch_y + 4, switch_z + 2, corner_r);
        translate([1, 0, 1])
        cube_base(switch_x, switch_y, switch_z);
    }
}
/************************************************************/
module round_power_switch()
{
    switch_brim_r = 23/2 + rad_allowance;
    switch_shaft_r = 17.1/2 + rad_allowance;
    switch_notch_r = 20.8/2 - switch_shaft_r + rad_allowance;
    switch_notch_z = 6.5 + cube_allowance;
    switch_notch_w = 4;
    switch_shaft_z = 14.5 + 8.2 + cube_allowance;
    
    difference()
    {
        rotate([0, 0, 22.5])
        cylinder_base(switch_brim_r, switch_shaft_z, 8);
        cylinder_base(switch_shaft_r, switch_shaft_z + cube_allowance, roundness);
    
        translate([switch_shaft_r + switch_notch_r/2 - rad_allowance, 0, switch_shaft_z * 0.5 - switch_notch_z * 0.5])
        cube_base(switch_notch_r, switch_notch_w, switch_notch_z);
    }
//    rotate([90, 0, 90])
//    translate([0, 0, -(switch_brim_r + peg_h * 0.5 - cube_allowance * 1.8)])
//    technic_beam_odd(3);
}
/************************************************************/
button_r = 16/2 + rad_allowance;
button_z = 5;
button_nut_r = 22/2;
button_nut_z = 2 + rad_allowance;
button_wall_r = button_nut_r + 2;
button_sheath_z = peg_h * 3 - (button_z + button_nut_z);

module bump_button_mount()
{ 
    difference()
    {
        cube_rounded(button_wall_r * 2, button_wall_r * 2, button_z + button_nut_z, peg_h);
        
        cylinder_base(button_r, button_z + button_nut_z + cube_allowance, roundness);
        translate([0, 0, (button_z + cube_allowance) * 0.5])
        cylinder_base(button_nut_r, button_nut_z, 6);
    }
    translate([0, 0, button_sheath_z * 0.50 + (button_z + button_nut_z) * 0.5])
    difference()
    {
        cube_rounded(button_wall_r * 2, button_wall_r * 2, button_sheath_z, peg_h);
        cylinder_base(button_nut_r + rad_allowance, button_sheath_z + cube_allowance, roundness);
    }
}
/************************************************************/
module button_mount_full()
{
    color("yellow")
    translate([0, peg_h, 0])
    rotate([90, 0, 0])
    bump_button_mount();
    for(x = 1)//[-1, 1])
    {
        color("orange")
        translate([(peg_h * 2 + 1) * x, 0.0, -peg_h])
        //scale([3, 1, 1])
        {
            rotate([0, 90, 0])
            technic_beam_odd(3);
            
            rotate([0, 90, 0])
            translate([-peg_h * 1, 0, 0])
            technic_beam_odd(3);

            rotate([0, 90, 0])
            translate([-peg_h * 2, 0, 0])
            technic_beam_odd(3);
        }
        
        color("purple")
        translate([-(peg_h * 2 + 1) * x, 0.0, -peg_h])
        //scale([3, 1, 1])
        {
            rotate([0, 90, 0])
            technic_beam_odd(3);
            
            rotate([0, 90, 0])
            translate([-peg_h * 1, 0, 0])
            technic_beam_odd(3);

            rotate([0, 90, 0])
            translate([-peg_h * 2, 0, 0])
            technic_beam_odd(3);
        }
    }
}
/************************************************************/
module bump_switch_rack()
{
    //Mount two momentary large button switches on a horizontal
    //rack.  The rack will also hold the TPU bumper.abs
    //A separate structure will mount two servos that will open and close this door, which should NOT lock into the side walls.
    for(z = [-2:2])
    {
        translate([cube_allowance * 0.75, 0, peg_h * z])
        rotate([0, 90, 0])
        technic_beam_odd(11);
    }
    for(y = [-1, 1])
    {
//        translate([0, (peg_h * 7.5 + 10) * y, peg_h * -1])
        translate([0, (peg_h * 8.5 - button_wall_r) * y, peg_h * -1])
        rotate([0, 90, 0])
        bump_button_mount();
    }
     
}

/************************************************************/
module servo_M3_holes()
{
    screw_head_r = 4 + rad_allowance;
    translate([(fitec_wing_x - peg_h) * 0.5, -(peg_h * 2), 0])
    {
        translate([0, 0, peg_h * 0.1])
        scale([screw_head_r/peg_r, screw_head_r/peg_r, 3.75])
        peg();
        translate([0, 0, -14.5])
        scale([1.5/peg_r, 1.5/peg_r, 1/peg_h])
        peg();
    }
    mirror([0, 1, 0])
    translate([(fitec_wing_x - peg_h) * 0.5, -(peg_h * 2), 0])
    {
        translate([0, 0, peg_h * 0.1])
        scale([screw_head_r/peg_r, screw_head_r/peg_r, 3.75])
        peg();
        translate([0, 0, -14.5])
        scale([1.5/peg_r, 1.5/peg_r, 1/peg_h])
        peg();
    }
    
    mirror([1, 0, 0])
    {
        translate([(fitec_wing_x - peg_h) * 0.5, -(peg_h * 2), 0])
        {
            translate([0, 0, peg_h * 0.1])
            scale([screw_head_r/peg_r, screw_head_r/peg_r, 3.75])
            peg();
            translate([0, 0, -14.5])
            scale([1.5/peg_r, 1.5/peg_r, 1/peg_h])
            peg();
        }
        mirror([0, 1, 0])
        translate([(fitec_wing_x - peg_h) * 0.5, -(peg_h * 2), 0])
        {
            translate([0, 0, peg_h * 0.1])
            scale([screw_head_r/peg_r, screw_head_r/peg_r, 3.75])
            peg();
            translate([0, 0, -14.5])
            scale([1.5/peg_r, 1.5/peg_r, 1/peg_h])
            peg();
        }
    }
}
/************************************************************/
module servo_with_M3_mounts()//wire_end)
{
    
    
    difference()
    {
//        servo_unit();
        servo_unit_frame_open();//wire_end);
        servo_M3_holes();
    }
}
/************************************************************/
module servo_with_M3_insert_fitec()
{
//    wire_y = 8;
    center_x = fitec_wing_x + cube_allowance;
    
    
//    servo_with_M3_mounts();
    
    difference()
    {
        //ceter cutout
        color("blue")
        cube_rounded(center_x, fitec_base_y + peg_h/2, fitec_base_z, peg_h);
        scale([1, 1, (1 + cube_allowance)/1])
        servo_M3_holes();
        translate([0, 0, -(fitec_base_z + fitec_wing_z * 2) * 0.5])
        color("grey")
        fitec_cutout();
    }
}
/************************************************************/
module fulcrum_screws()
{
    screw_r = 2;//0.9;
    screw_z = 15;
    screw_head_r = 4;

    for(x = [-1, 1])
    {
        for(y = [-1, 1])
        {
            translate([screw_head_r * 1.75 * x, screw_head_r * 1.75 * y, 0])
            cylinder_base(screw_r, screw_z, roundness);
        }
    }
}
/************************************************************/
fulcrum_rb = (kipr_x + peg_h * 2 + plug_x) / 2;
fulcrum_rt = fulcrum_rb;//(frame_x + bolt_shaft_z * 2 + 17)/2;
fulcrum_z  = 105 + peg_h;

/************************************************************/
/************************************************************/
frame_adapter_x = fitec_base_y + peg_h + cube_allowance * 3;
frame_adapter_y = fitec_base_y + peg_h/2 + cube_allowance;
frame_adapter_z = 3;
//WALL FOR THE TOP OF THE CHASSIS
module frame_adapter_top(end_caps_v, end_caps_h, beam_num, beam_length, beam_offset_x, beam_offset_y)
{

    
    //Beam wall
    translate([peg_h * (round(beam_num/2) - 0.5) - frame_adapter_z - beam_offset_x, beam_length - beam_offset_y, 0])
    {
        if(end_caps_v == true)
        {
            translate([0, 0, (frame_adapter_x + peg_h) * 0.5])
            for(x = [-round((beam_num-3)/2):round((beam_num-3)/2)])
            {
                translate([peg_h * x, 0, 0])
                technic_beam_odd(beam_length);
            }
            translate([0, 0, (frame_adapter_x + peg_h) * 0.5])
            for(x = [-round((beam_num-1)/2),round((beam_num-1)/2)])
            {
                translate([peg_h * x, 0, 0])
                rotate([0, 90, 0])
                technic_beam_odd(beam_length);
            }
        }
        else
        {
            translate([0, 0, (frame_adapter_x + peg_h) * 0.5])
            for(x = [-round((beam_num-1)/2):round((beam_num-1)/2)])
            {
                translate([peg_h * x, 0, 0])
                technic_beam_odd(beam_length);
            }
        }
    }
    //Optional end caps
    translate([peg_h * (round(beam_num/2) - 0.5) - frame_adapter_z - beam_offset_x, beam_length - beam_offset_y, 0])
    if(end_caps_h == true)
    {
        rotate([0, 90, 90])
        translate([-(frame_adapter_x + peg_h) * 0.5, 0, 0])
        difference()
        {
            scale([1, 1, beam_length + 1])
            technic_beam_odd(beam_num);
            rotate([0, 90, 0])
            cube_rounded(peg_h * beam_length - 3, peg_h * 0.75 + (peg_h * beam_num), peg_h + cube_allowance, peg_h);
        }
    }   
}
/************************************************************/
//WALL FOR THE SIDE OF THE CHASSIS
module frame_adapter_side(end_caps_v, end_caps_h, beam_num_aft, beam_num_fore, beam_offset_y)
{
    beam_length = 5;
    beam_num    = 9;
    //Screw plate
    rotate([0, 90, 0])
    translate([0, 0, -frame_adapter_z/2])
    difference()
    {
        cube_base(frame_adapter_x, frame_adapter_y, frame_adapter_z);
        fulcrum_screws();
    }
    rotate([0, 90, 0])
    translate([0, 0, (peg_h * beam_num) - frame_adapter_z * 1.5])difference()
    {
        cube_base(frame_adapter_x, frame_adapter_y, frame_adapter_z);
        fulcrum_screws();
    }
    
    //Beam wall
    translate([peg_h * (round(beam_num/2) - 0.5) - frame_adapter_z, 0, 0])
    {
        translate([0, 0, (frame_adapter_x + peg_h) * 0.5])
        for(y = [-1,1])
        {
            rotate([0, 0, 90])
            translate([((beam_length-1) * peg_h)/2 * y, 0, 0])
            technic_beam_odd(beam_num-2);
        }
        if(end_caps_v == true)
        {
            translate([0, 0, (frame_adapter_x + peg_h) * 0.5])
            for(x = [-round((beam_num-1)/2),round((beam_num-1)/2)])
            {
                translate([peg_h * x, 0, 0])
                rotate([0, 90, 0])
                technic_beam_odd(beam_length);
            }
        }
    }
    //Optional end caps
    translate([peg_h * (round((beam_num + beam_num_aft - beam_num_fore)/2) - 1.75) - frame_adapter_z, 0, 0])
    if(end_caps_h == true)
    {
        rotate([0, 90, 90])
        translate([-(frame_adapter_x + peg_h) * 0.5, -(beam_num), 0])
        difference()
        {
            scale([1, 1, beam_length + 1])
            technic_beam_even(beam_num + beam_num_aft + beam_num_fore);
            rotate([0, 90, 0])
            cube_rounded(peg_h * beam_length - 3, peg_h * 0.75 + (peg_h * (beam_num + beam_num_aft + beam_num_fore)), peg_h + cube_allowance, peg_h);
        }
        
    }
    if(beam_num_aft > 0)
    {
        //Aft beams
        color("cyan")
        translate([((beam_num_aft/2 - 0.5) * peg_h) + frame_adapter_z/4 + (beam_num * peg_h), 0, (frame_adapter_x + peg_h) * 0.5])
        for(x = [-round((beam_num_aft-1)/2):round((beam_num_aft-1)/2)])
        {
            translate([peg_h * x, 0, 0])
            technic_beam_odd(beam_length);
        }
    }
    if(beam_num_fore > 0)
    {
        //Fore beams
        color("purple")
        translate([-(beam_num_fore/2 * peg_h + frame_adapter_z), 0, (frame_adapter_x + peg_h) * 0.5])
        for(x = [-round((beam_num_fore-1)/2):round((beam_num_fore-1)/2)])
        {
            translate([peg_h * x, 0, 0])
            technic_beam_odd(beam_length);
        }
    }
}
/************************************************************/
motor_span = 9;
end_caps_h = true;
end_caps_v = true;
beam_num = 7;//11;
beam_length = 13;//25;//motor_span * 3;
beam_offset_x = peg_h * 0;
beam_offset_y = peg_h * 0;//8;

beam_num_aft = 4;//4;
beam_num_fore = 10;//6;//14;

electronics_frame_ox = 145;// + peg_h * 2;
electronics_frame_oy = peg_h * 3.5;//nut_r * 4;//peg_h * 7;
electronics_frame_oz = peg_h * 10;//80;
electronics_frame_ix = electronics_frame_ox - peg_h * 4;//6;
electronics_frame_iy = electronics_frame_oy - 4;
electronics_frame_iz = electronics_frame_oz + cube_allowance;
electronics_fulcrum_ox = electronics_frame_ox + peg_h * 2;

/************************************************************/
module front_wall()
{
    difference()
    {
        cube_rounded(electronics_fulcrum_ox/5, peg_h * 2, peg_h * 7, peg_h);
        translate([0, peg_h * 0.75, peg_h])
        cube_rounded(electronics_fulcrum_ox/5 - peg_h * 2, peg_h * 1.5, peg_h * 7, peg_h);
        translate([0, - peg_h * 0.5, 0])
        cube_base(peg_h * 17, peg_h + cube_allowance, peg_h * 5);
        for(x = [-1, 1])
        {
            for(z = [-3:3])
            {
                translate([(electronics_fulcrum_ox - peg_h) * 0.5 * x, 0, peg_h * z])
                rotate([90, 0, 0])
                scale([1, 1, 2])
                peg();
            }
        }
        for(x = [-8:8])
        {
            for(z = [-3,3])
            {
                translate([peg_h * x, 0, peg_h * z])
                rotate([90, 0, 0])
                scale([1, 1, 2])
                peg();
            }
        }
        
        for(x = [-1, 1])
        {
            translate([(electronics_fulcrum_ox - peg_h + rad_allowance) * 0.5 * x, - peg_h * 0.5, 0])
            color("blue")
            scale([1, 2, 1])
            cylinder_base(peg_h * 0.5, peg_h * 7, roundness);
        }
    }
    
    for(x = [-1, 1])
    {
        translate([peg_h * 5.5 * 0, -peg_h * 1.5, -peg_h * 3])
        cube_rounded_full(peg_h * 4, peg_h * 1.5, peg_h, peg_h);
    }
    
}
/************************************************************/
module axle_wheel_base()
{
    /*
    The servo axle comes out of a peg hole 3 pegs up from the bottom of the 
    servo mount.  Taking the wheel down to a radius of 3 peg heights puts said wheel exactly in line with the bottom of the frame.
    Any tire should go around this, and will determine the clearance of the
    robot.
    */
    base_radius = peg_h * 3;
    color("blue")
    difference()
    {
        tread_axle();
        difference()
        {
            cylinder_base(50, 20, roundness);
            //Chop off the tread nibs
            cylinder_base(base_radius, 20 + cube_allowance, roundness);
        }
        //Chop off one side of the wheel
        translate([0, 0, -9])
        cylinder_base(50, 10, roundness);
    }

}
/************************************************************/
module axle_wheel_tire()
{
    base_radius = peg_h * 3;
    tire_r = base_radius + peg_r *2;
    tire_h = peg_h;
    
    difference()
    {
        scale([1, 1, tire_h/tire_r])
        sphere_base(tire_r, roundness);
        cylinder_base(base_radius, tire_h * 2, roundness);

    }
}

/************************************************************/
module contact_bar()
{
    translate([peg_h * 7, 0, 0])
    front_wall();
    translate([-peg_h * 7, 0, 0])
    front_wall();
    rotate([0, 90, 90])
    translate([peg_h * 3, 0, peg_h * 0.5])
    technic_beam_odd(11);
}
/************************************************************/
module ir_mount()
{
    sharp_x = 10;
    sharp_y = 12;
    sharp_z = 44.2;
    
    cube_rounded_full(sharp_x, sharp_y, sharp_z, 2);
}
/************************************************************/
module ldr_mount()
{
    ldr_x = 0.31 * 25.4;
    ldr_y = 0.11 * 25.4;
    ldr_z = 0.56 * 25.4;
    //0.56 x 0.31 x 0.11 inches
    cube_rounded_full(ldr_x, ldr_y, ldr_z, 2);
}

battery_deck_M3_spektrum();
batt_case_z = (frame_y + batt_monitor_oy + battery_z * 1.25) * 2 - (fitec_top_z + fitec_wing_z) * 2 - (fitec_base_z) * 2;
for(x = [-1, 1])
{
    translate([(batt_case_z + peg_h) * 0.5 * x, 0, -peg_h * 0.75])
    rotate([90, 0, 90])
    {
        color([1, 1, 0, 0.1])
        servo_with_M3_mounts(); 
        color([0, 1, 0])
        servo_with_M3_insert_geek();
        //WHEEL AND TIRE
        translate([0, 0, (geek_z * 0.5 + peg_h + wheel_h) * x])
        color([0.2, 0.2, 0.2])
        {
            axle_wheel_base();
            axle_wheel_tire();
        }
    }
}
//SIDES TO GO OVER THE SERVO MOUNTS
beam_num_switch = 5 + 4;
beam_num_servo  = 7;
beam_num_servo_to_aft = beam_num_switch + beam_num_servo;
beam_num_side_to_side = 17;
/*FULLY INTEGRATED FRAME.... */
difference()
{
    cube_rounded((beam_num_side_to_side + 4) * peg_h, (beam_num_servo + 2 + (beam_num_switch * 2)) * peg_h, (beam_num_servo + 0.5) * peg_h, peg_h);
    cube_rounded((beam_num_side_to_side + 2) * peg_h, (beam_num_servo + (beam_num_switch * 2)) * peg_h, (beam_num_servo + 0.5) * peg_h + cube_allowance, peg_h);
}
//Castors
translate([0, 0, -(beam_num_servo + 0.5) * peg_h * 0.42])
color([1, 1, 1])
difference()
{
    cube_rounded_full((beam_num_side_to_side + 4) * peg_h, (beam_num_servo + 2 + (beam_num_switch * 2)) * peg_h, peg_h * 2, peg_h);
    cube_rounded((beam_num_side_to_side + 2) * peg_h, (beam_num_servo + (beam_num_switch * 2)) * peg_h, (beam_num_servo + 0.5) * peg_h + cube_allowance, peg_h);
    cube_base((beam_num_side_to_side + 4) * peg_h, (beam_num_servo * 3) * peg_h, (beam_num_servo + 0.5) * peg_h + cube_allowance * 2);
    cube_base((beam_num_side_to_side) * peg_h, (beam_num_servo + (beam_num_switch * 2.5) + cube_allowance) * peg_h, (beam_num_servo + 0.5) * peg_h + cube_allowance);
}

for(y = [-1, 1])
{
    translate([0, ((beam_num_servo + 2 + (beam_num_switch * 1.5)) * peg_h) * 0.5 * y, 0])
    {
        rotate([0, 0, -90 * y])
            color([0.75, 0.5, 0, 0.75])
            bump_switch_rack();
        translate([0, peg_h * 3.25 * y, 0])
        if(y == -1)
        {
            rotate([0, 0, 180])
            color("red")
            contact_bar();
        }
        else
        {
            color("red")
            contact_bar();
        }
        for(x = [-1, 1])
        {
            translate([peg_h * x + (beam_num_side_to_side * peg_h * 0.5 * x), peg_h * 3 * y, 0])
            {        
                if(y == 1)
                {
                    rotate([0, 0, -45*x])
                    color([0, 0.75, 0.25])
                    ldr_mount();
                }
                else
                {
                    rotate([0, 0, 45*x])
                    color([0, 0.75, 0.25])
                    ldr_mount();
                }
                translate([peg_h * x, 0, 0])
                color([0.75, 0.25, 0])
                ir_mount();
            }
        }
    
    }
}

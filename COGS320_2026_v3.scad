include<foundational_modules.scad>
include<grip_mount.scad>
//include<figurines.scad>

//include<variables.scad>
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



////Size：18.02*7.91*16.8  mm
//emax_base_l  = 18.02 + cube_allowance;
//emax_base_w  = 16.8 + cube_allowance;
//emax_base_h  = 7.91 + cube_allowance;
//emax_wing_l = 26 + cube_allowance;
//emax_wing_w = 3 + cube_allowance;
//emax_wing_h = 7.91 + cube_allowance;
////emax_base_l = 22 + cube_allowance;
////emax_base_w = 12 + cube_allowance;
////emax_base_h = 8 + cube_allowance;//16 + cube_allowance;
//emax_top_l  = emax_base_l;
//emax_top_w  = emax_base_w;
//emax_top_h  = 4 + cube_allowance;
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

//fitec_wing_x = 55.5 + cube_allowance;
//fitec_wing_y = 20 + cube_allowance;
//fitec_wing_z = 4 + cube_allowance;
//fitec_base_x = 42 + cube_allowance;
//fitec_base_y = 20 + cube_allowance;
//fitec_base_z = 27.5 + cube_allowance;//16 + cube_allowance;
//fitec_top_x  = 42 + cube_allowance;
//fitec_top_y  = 20 + cube_allowance;
//fitec_top_z  = 8 + cube_allowance;
//fitec_z      = fitec_base_z + fitec_wing_z + fitec_top_z;
//fitec_offset = 10;
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

//kipr_x     = 62;//105;
//kipr_y     = 93 ;//105;
//kipr_z     = 10; // Does this meet clearance for the on/off switch?
//kipr_r     = 10;
//kipr_floor = 3;
//kipr_lip   = 20;
//usb_y      = 60;
//plug_x     = 6 * 2;
//plug_y     = kipr_x - peg_h;

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
//battery_x      = 76;//42;//22;
//battery_y      = 46;//32;//22;
//battery_z      = 26;//8;//6;

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

//case_r         = emax_base_l * 2 - peg_h * 2 + tiny_stack_xy + battery_buff;
//case_ratio      = 0.8;//emax_wing_l/case_r;
//case_z         = (emax_base_l + battery_y * 0.5 - battery_buff * 4.25)/(case_r * 2);
//shell_r         = sqrt(pow((case_r - tiny_stack_xy/2 - battery_buff), 2));

//frame_xy       = case_r - cube_allowance/2;// - battery_buff - emax_top_h * 2;
//base_xy        = frame_xy - tiny_stack_xy - battery_buff + (peg_h * 2);

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

module unoMountPosts()
{
//    import("C:/Users/nilivingston/Documents/IRRL/COGS211/Design/Giga Model/files/arduino-mount-solid.stl");
    
    import("C:/Users/nilivingston/Documents/IRRL/COGS211/Design/Giga Model/files/arduino-mount-minimal.stl");
}

module displayCaseCover()
{
    import("C:/Users/nilivingston/Documents/IRRL/COGS211/Design/Giga Model/files/Display_Case_Cover.stl");
}
/************************************************************/
module displayCase()
{
    import("C:/Users/nilivingston/Documents/IRRL/COGS211/Design/Giga Model/files/Display_case.stl");

}
/************************************************************/
module staged_decks()
{
    import("C:/Users/nilivingston/Documents/IRRL/COGS211/Design/Giga Model/files/COGS211_ER_staged_decks_2025b.stl");
}
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
module peg_grid(num_rows, num_cols, z_scale)
{
    //a =   test ? TrueValue : FalseValue ;
    max_x = num_rows%2 == 0 ? num_rows * 0.5 : (num_rows - 1) * 0.5;
    max_y = num_cols%2 == 0 ? num_cols * 0.5 : (num_cols - 1) * 0.5;
    
    //min_x = max_x * -1;
    //min_y = max_y * -1;
    x_range = num_rows%2 == 0 ? [-(max_x - 0.5):(max_x - 0.5)] : [-max_x:max_x];
    y_range = num_rows%2 == 0 ? [-(max_y - 0.5):(max_y - 0.5)] : [-max_y:max_y];
    
    for(x = x_range)
    {
        for(y = y_range)
        {
            translate([peg_h * x, peg_h * y, 0])
            scale([1, 1, z_scale])
            peg();
        }
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
module battery_zeee()
{
    wire_r = 8;
    
    cube_base(battery_zeee_x, battery_zeee_y, battery_zeee_z * 1.01);
    translate([battery_zeee_x * 0.5, 0, 0])
    cylinder_base(wire_r, battery_zeee_z * 1.01, roundness);
}
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

/*Battery Casing*/
////RESUME WORK ON BUMP
//bump_or = 60;
//bump_ir = bump_or - 3;
//bump_os = [1, 40/120, 1];
//bump_is = [1.035, 40/120, 1];
//bump_h  = 20;

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
//electronics_battery_servos();
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
module uno_adapter()
{
    translate([0, 0, -4.25])
    {
        translate([7, 0, 0])
        difference()
        {
            cube_base(65, 65, 3);
            cube_base(52, 50, 3 + cube_allowance);
        }
        translate([0, 0, -1.5])
        unoMountPosts();
    }
}
/************************************************************/
//module servos_and_battery()
//{
//    import("C:/Users/nilivingston/Documents/IRRL/COGS211/Design/STL/COGS211_ER_servo_and_battery_v2_2026.stl");
//}
//servos_and_battery();
/************************************************************/
module servos_battery_base()
{
    import("C:/Users/nilivingston/Documents/IRRL/COGS211/Design/Giga Model/files/COGS211_ER_batter_servo_base_v9_2026.stl");
}
//servos_battery_base();
/************************************************************/
//module servos_battery_rails()
//{
//    rail_floor = peg_h;//15;
//    
//    tab_block_x = fitec_wing_x + peg_h * 1 + rail_floor * 2;
//    tab_block_y = fitec_base_y + cube_allowance * 2 + rail_floor;
//    tab_block_z = (frame_y + batt_monitor_oy + battery_z * 1.25) * 2 + fitec_top_z - (fitec_base_z) - rail_floor * 2;
//    
//    bolt_r = 4 + rad_allowance;//4mm for M4, plus wiggle room.
//    bolt_z = tab_block_z + cube_allowance;
////    rail_y     = 20;
//    
//    translate([0, 0, (fitec_wing_x + peg_h * 1) * 0.5])
//    rotate([0, 0, 90])
//    rotate([90, 0, 0])
//    difference()
//    {
//        cube_rounded(tab_block_x, tab_block_y, tab_block_z, peg_h);
//        //Lengthwize cutout
//        cube_base(tab_block_x - rail_floor * 2, tab_block_y, tab_block_z + cube_allowance);
//        //Widthwize cutout
//        cube_base(tab_block_x, 
//                  tab_block_y,              
//                  tab_block_z + cube_allowance - rail_floor * 2);
//        for(x = [-1, 1])
//        {
//            for(y = [-1, 1])
//            {
//                translate([(tab_block_x * 0.5 - bolt_r * 1.5) * x, (tab_block_y * 0.5 - bolt_r * 1.5) * y, 0])
//                cylinder_base(bolt_r, bolt_z, roundness);
//            }
//        }
//    }
//    
//}
////servos_battery_rails();
/************************************************************/
module pixy_mount()
{
    pixy_x = 38.25;
    pixy_y = 42;
    pixy_z = 3;
    mount_hole_r = 1.5;
    mount_y = peg_h;
    nut_or = 5.5/2 + rad_allowance;
    nut_ir = mount_hole_r;
    nut_z = 1.5 + cube_allowance;
    
    //translate([-pixy_x/2, pixy_y/2, 0])
    difference()
    {
      //  translate([pixy_x/2, -pixy_y/2, 0])
        cube_rounded(pixy_x/3, mount_y, pixy_z, peg_r);
        translate([-3, 0, pixy_z/2 - nut_z/2])
        rotate([0, 0, 30])
        nut_parametric(nut_or, nut_ir, nut_z, pixy_z * 2 + cube_allowance);
        translate([3, 0, pixy_z/2 - nut_z/2])
        rotate([0, 0, 30])
        nut_parametric(nut_or, nut_ir, nut_z, pixy_z * 2 + cube_allowance);
    }
//    translate([0, peg_h * 1.5, (peg_h - pixy_z) * 0.5])
//    difference()
//    {
//        cube_rounded(peg_h * 2, peg_h * 2, peg_h, peg_r);
//        for(x = [-0.5, 0.5])
//        {
//            //Perpendicular pegs
//            translate([peg_h * x, -peg_h * 0.5, 0])
//            peg();
//            //Parallel pegs
//            translate([peg_h * x, peg_h * 0.5, 0])
//            rotate([90, 0, 0])
//            peg();
//        }
//    }
}
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
module battery_deck_M3_Zeee()
{
    difference()
    {
        rotate([90, 0, 0])
        translate([0, 0, -(fitec_wing_x + peg_h * 1) * 0.50])
        
        battery_w_M3();
        
        //Pilot holes for heat insert screws
        rotate([0, 90, 0])
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
        translate([0,0, fitec_base_x - battery_zeee_z * 1.01/2 - peg_h])

        battery_zeee();
    }
}
/************************************************************/
module battery_deck_M3_spektrum()
{
    switch_x = 4;
    switch_y = 12;
    switch_z = 12;
    corner_r = 4;
    
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
    //SWITCHES... NEED FINAL SWITCH MODEL CHOSEN
    color("blue")
    rotate([0, -90, 90])
    translate([switch_y * 3 + peg_h * 1.25, fitec_wing_x - (peg_h * 2 + 2), battery_spektrum_y])
    round_power_switch();
    //switch_casing();
    mirror([1, 0, 0])
    color("blue")
    rotate([0, -90, 90])
    translate([switch_y * 3, fitec_wing_x + 1, (battery_spektrum_y)])
    round_power_switch();
}
/************************************************************/
module camera_to_ez_tilt()
{
    difference()
    {
        cube_base(notch_x + 4, notch_y, notch_z + notch_base_z + 2);
        translate([0, 0, (cube_allowance/2)])
        notch();
    }
    rotate([0, 0, 90])
    translate([0, (notch_x + 4 + peg_h) * 0.5, -(notch_z + notch_base_z + 2) + 4.5])
    pixy_mount();
}
/************************************************************/
module ez_servo_to_pegs()
{
    chton();
    translate([0, 0, peg_h/2 + notch_base_z + notch_z/2])
//    difference()
    {
        union()
        {
            cube_rounded(peg_h * 2, peg_h * 2, peg_h, peg_h);
            
            translate([0, - peg_h * 1, 0])
            cube_base(peg_h * 2, peg_h, peg_h, peg_h);  
//            translate([0, peg_h * 2, 0])
//            {
//                cube_rounded(peg_h, peg_h * 2, peg_h, peg_h);
//                translate([0, -peg_h, 0])
//                cube_base(peg_h, peg_h, peg_h, peg_h);
//            }
        }
        rotate([90, 0, 0])
        translate([0, -peg_h, peg_h * 1.5])
        difference()
        {
            
            cube_rounded(peg_h * 3, peg_h * 3, peg_h, peg_h); 
            
     
            for(y = [-1:1])
            {
                for(x = [-1:1])
                {
                    translate([peg_h * x, peg_h * y, 0])
                    peg();
                }
            }
        }
    }
}
/************************************************************/
module tread_horn()
{
    translate([0, 0, 3])
    import("C:/Users/nilivingston/Documents/CAD/COGS320_2026/TK_Horn_Prototype.stl");
    difference()
    {
        union()
        {
            scale([2, 2, 1])
            import("C:/Users/nilivingston/Documents/CAD/COGS320_2026/TK_Tread_Wheel.stl");
            cylinder_base(6, 10, roundness);
        }
        cylinder_base(peg_r, 20, roundness);
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
module electronics_module_tread_base()
{
    import("C:/Users/nilivingston/Documents/CAD/COGS320_2026/COGS320_2026_electronics_module_v1.stl");
    rail_floor = 15;
    //translate([0, 0, (fitec_wing_x + peg_h * 1) * 0.5])
    //                rotate([0, 0, 90])
    rotate([0, 90, 0])
    translate([-peg_h * 1.25, peg_h * 6.5 + fitec_wing_y - 2.25, 0])
    color("red")
    difference()
    {
        cube_rounded(fitec_wing_x + peg_h * 1, peg_h * 13, (frame_y + batt_monitor_oy + battery_z * 1.25) * 2 - (fitec_top_z + fitec_wing_z) * 2 - (fitec_base_z) * 0, peg_h);
        cube_rounded(fitec_wing_x + peg_h * 1, peg_h * 13, (frame_y + batt_monitor_oy + battery_z * 1.25) * 2 - (fitec_top_z + fitec_wing_z) * 2 - (peg_h) * 2, peg_h);
    }
}
/************************************************************/
module tread_beam(has_holes)
{
    difference()
    {
        cube_rounded(peg_h, peg_h * 15, peg_h, peg_h);
        if(has_holes)
        {
            for(y = [-7:7])
            {
                translate([0, peg_h * y, 0])
                peg();
            }
        }
    }
}
/************************************************************/
module technic_beam_even(peg_count)//PROBABLY CAN PARAMETERIZE THIS
{
    difference()
    {
        cube_rounded(peg_h, peg_h * peg_count, peg_h, peg_h);
        
        for(y = [-peg_count/2:peg_count/2])
        {
            translate([0, peg_h * 0.5 + peg_h * y, 0])
            scale([1, 1, 1.1])
            peg();
        }
    }
}
/************************************************************/
module technic_beam_odd(peg_count)//PROBABLY CAN PARAMETERIZE THIS
{
    difference()
    {
        cube_rounded(peg_h, peg_h * peg_count, peg_h, peg_h);
        
        for(y = [-round(peg_count/2):round(peg_count/2)])
        {
            translate([0, peg_h * y, 0])
            scale([1, 1, 1.1])
            peg();
        }
    }
}
/************************************************************/
module technic_beam_14()//PROBABLY CAN PARAMETERIZE THIS
{
    difference()
    {
        cube_rounded(peg_h, peg_h * 14, peg_h, peg_h);
        
        for(y = [-7:7])
        {
            translate([0, peg_h * 0.5 + peg_h * y, 0])
            peg();
        }
    }
}
/************************************************************/
module technic_beam_3()//PROBABLY CAN PARAMETERIZE THIS
{
    difference()
    {
        cube_rounded(peg_h, peg_h * 3, peg_h, peg_h);
        
        for(y = [-1:1])
        {
            translate([0, peg_h * y, 0])
            peg();
        }
    }
}
/************************************************************/
module chute()
{
    rotate([0, 90, 0])
    technic_beam_14();

    rotate([0, 90, 0])
    translate([-peg_h * 1, 0, 0])
    technic_beam_14();

    rotate([0, 90, 0])
    translate([-peg_h * 2, 0, 0])
    technic_beam_14();

    translate([peg_h * 7, 0, 0])
    {
        rotate([0, 90, 0])
        technic_beam_14();
        
        rotate([0, 90, 0])
        translate([-peg_h * 1, 0, 0])
        technic_beam_14();

        rotate([0, 90, 0])
        translate([-peg_h * 2, 0, 0])
        technic_beam_14();
    }

    for(z = [-2:3])
    {
        rotate([0, 90, 0])
        translate([-peg_h * 2, peg_h * 5.5, peg_h * 3 + peg_h * z])
        technic_beam_3();
    }
}
/************************************************************/
module tread_clamp()
{
    clamp_w = 20 + cube_allowance;
    technic_beam_odd(5);
    translate([0, peg_h, clamp_w/2 + peg_h/2])
    cylinder_base(peg_r, clamp_w + peg_h * 2, roundness);
    translate([0, -peg_h/2, clamp_w + peg_h])
    technic_beam_even(4);
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
module wall_arm_base()
{
    translate([peg_h * 0.75 - 0.25, 0, 0])
    difference()
    {
        cube_base(notch_x + 4, notch_y, notch_z + notch_base_z + 2);
        translate([0, 0, (cube_allowance/2)])
        notch();
    }
//    //original design
//    translate([0, peg_h * 15/2, -(notch_z + notch_base_z + 2 + peg_h) * 0.5])
//    technic_beam_odd(17);
    //beam wedge design
    translate([0, peg_h * 6/2, -(notch_z + notch_base_z + 2 + peg_h) * 0.5])
    rotate([0, 90, 0])
    for(x = [0:2])
    {
        translate([peg_h * x, 0, 0])
//        scale([1, 1, 3])
        technic_beam_even(8);
    }
}
/************************************************************/
module wall_arm_wedge()
{
    difference()
    {
        wall_arm_base(); 
        translate([peg_h * 1.4, peg_h * 3, -peg_h * 2 + 1])
        rotate([0, 0, 5])
        color("white")
        cube_base(peg_h * 3, sqrt(((peg_h * 3) * (peg_h * 3)) + ((peg_h * 8) * (peg_h * 8))), peg_h * 3.1);
    }
}
/************************************************************/
module wall_servo_to_peg()
{
    chton();
    translate([0, peg_h * 2.5, (notch_z + notch_base_z + 2 + peg_h) * 0.5])
    technic_beam_odd(7);
}
/************************************************************/
module technic_wall_cap()
{
//    for(x = [1])
//    {
//        for(z = [1])
//        {
//            difference()
//            {
//                union()
//                {
//                    rotate([90, 0, 90])
//                    translate([peg_h * 8.0 * x, peg_h * 3.5, peg_h * 9 * z])
//                    color("yellow")
//                    technic_beam_even(8);
//                    
//                    rotate([90, 0, 90])
//                    translate([peg_h * 8.0 * x, peg_h * 7, peg_h * 9 * z])
//                    scale([1.1, 1.1, 1])
//                    peg();
//                    rotate([90, 0, 90])
//                    translate([peg_h * 8.0 * x, peg_h * -0, peg_h * 9 * z])
//                    scale([1.1, 1.1, 1])
//                    peg();
//                }
//                rotate([90, 0, 90])
//                    translate([peg_h * 8.0 * x, peg_h * 7, peg_h * 9 * z])
//                    color("orange")
//                    axle(peg_h + cube_allowance);
//                    rotate([90, 0, 90])
//                    translate([peg_h * 8.0 * x, peg_h * -0, peg_h * 9 * z])
//                    color("orange")
//                    axle(peg_h + cube_allowance);
//            }
//        }
//    }
    
    translate([-(peg_h * 9.0), -(peg_h * 8), -(peg_h * 3.5)])
        import("C:/Users/nilivingston/Documents/CAD/COGS320_2026/COGS320_2026_technic_wall_cap_v1.stl");
}
/************************************************************/
module servo_with_axle_mounts()
{
    difference()
    {
        servo_unit();
        rotate([0, 90, 0])
        {
            translate([(fitec_base_z * 0.5 - peg_h * 0.5), -(fitec_base_y - peg_h * 0.5), 0])
            axle(peg_h * 10);
            mirror([0, 1, 0])

            translate([(fitec_base_z * 0.5 - peg_h * 0.5), -(fitec_base_y - peg_h * 0.5), 0])
            axle(peg_h * 10);
        }
        
        translate([(fitec_wing_x - peg_h) * 0.5, -(peg_h * 2), 0])
        axle(peg_h * 10);
        mirror([0, 1, 0])
        translate([(fitec_wing_x - peg_h) * 0.5, -(peg_h * 2), 0])
        axle(peg_h * 10);
        
        mirror([1, 0, 0])
        {
            translate([(fitec_wing_x - peg_h) * 0.5, -(peg_h * 2), 0])
            axle(peg_h * 10);
            mirror([0, 1, 0])
            translate([(fitec_wing_x - peg_h) * 0.5, -(peg_h * 2), 0])
            axle(peg_h * 10);
        }
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
module servo_with_M3_insert_geek()
{
    wire_y = 8;
    center_x = fitec_wing_x + cube_allowance;
    geek_x = 40;
    geek_y = 24;
    geek_z = 24 + 4;
    
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
module fulcrum()
{
    //cube_rounded(frame_x + bolt_shaft_z * 2, 90, frame_z, peg_h);
//    translate([0, 0, -fulcrum_z * 0.25 + 2])
    translate([-(fulcrum_rb * 0.75 + cube_allowance * 0), 0, -(fulcrum_z * 0.5 + fulcrum_z/40)])
    difference()
    {
        scale([0.25, 0.25, 1])
        cone_base(fulcrum_rb, fulcrum_rb, fulcrum_z/20, roundness);
        fulcrum_screws();
    }    
    difference()
    {
        scale([1, 0.5, 1])
        cone_base(fulcrum_rb - 0.5, fulcrum_rt, fulcrum_z, roundness);
//        translate([0, 0, peg_h/2])
        cube_rounded(fulcrum_rb * 2 - plug_x - 2 + cube_allowance, fulcrum_rb * 2, fulcrum_z + cube_allowance, peg_h);// - peg_h + cube_allowance);
//        translate([0, 0, -fulcrum_z/2 + peg_h/2])
//        cube_base(fulcrum_rb * 2 - plug_x - 2 - peg_h * 2 + cube_allowance, fulcrum_rb * 2, peg_h + cube_allowance);
        
        //NUTS
        translate([0, 0, fulcrum_z/2 - bolt_head_r * 2.15])
        {
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
            
            translate([0, 0, nut_r * 1.5])
            difference()
            {
                rotate([0, 90, 0])
                cylinder_base(bolt_head_r, frame_x * 2, roundness);
                cube_base(frame_x + nut_z * 4 + 10, bolt_head_r * 2, bolt_head_r * 2);
            }
        }
    
//        //Pegs for mounting
//        for(x = [-1, 1])
//        {
//            for(y = [-1, 1])
//            {
//                translate([(fulcrum_rb - peg_h) * x, peg_h * y, -fulcrum_z/2 + peg_h/2 - cube_allowance/2])
//                peg();
//            }
//        }
        fulcrum_screws();
        
        translate([fulcrum_rb, 0, 0])
        cube_base(30, fulcrum_rt, fulcrum_z + cube_allowance);
    }
    
//    translate([0, 0, -fulcrum_z/2 - peg_h/2])
//    cube_rounded(fulcrum_rb * 2, fulcrum_rb/2, peg_h, peg_h);
}
/************************************************************/
/************************************************************/
//for(x = [-1, 1])
//{
//    union()
//    {
//        translate([0, 0, (fitec_wing_x + peg_h * 1) * 0.5])
//        translate([(frame_x * 0.5 + fitec_wing_z * 0.75) * x, 0, 0])
//        rotate([0, 0, 90 * x])
//        rotate([90, 0, 0])
//        servo_with_axle_mounts();
//    }
//}
//translate([0, 50, 0])
//battery_deck_M3_Zeee();
frame_adapter_x = fitec_base_y + peg_h + cube_allowance * 3;
frame_adapter_y = fitec_base_y + peg_h/2 + cube_allowance;
frame_adapter_z = 3;
//WALL FOR THE TOP OF THE CHASSIS
module frame_adapter_top(end_caps_v, end_caps_h, beam_num, beam_length, beam_offset_x, beam_offset_y)
{
//    //Screw plate
//    rotate([0, 90, 0])
//    translate([0, 0, -frame_adapter_z])//(fitec_wing_x + peg_h + frame_adapter_z) * 0.5])
//    difference()
//    {
//        translate([0, 0, frame_adapter_x * 0.5])
//        cube_base(frame_adapter_x, frame_adapter_y, frame_adapter_x);
//        color("cyan")
//        rotate([90, 0, 0])
//        translate([frame_adapter_z * 0.5, frame_adapter_y * 0.5 + frame_adapter_z * 2, 0])
//        cube_rounded(frame_adapter_x +  frame_adapter_z, frame_adapter_x + frame_adapter_z, frame_adapter_x - frame_adapter_z, peg_h);
//        fulcrum_screws();
//    }
    
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
//            translate([0, 0, (frame_adapter_x + peg_h) * 0.5])
//            for(x = [-round((beam_num-3)/2):round((beam_num-3)/2)])
//            {
//                translate([peg_h * x, 0, 0])
//                technic_beam_odd(beam_length);
//            }
            translate([0, 0, (frame_adapter_x + peg_h) * 0.5])
            for(x = [-round((beam_num-1)/2),round((beam_num-1)/2)])
            {
                translate([peg_h * x, 0, 0])
                rotate([0, 90, 0])
                technic_beam_odd(beam_length);
            }
        }
//        else
//        {
//            translate([0, 0, (frame_adapter_x + peg_h) * 0.5])
//            for(x = [-round((beam_num-1)/2):round((beam_num-1)/2)])
//            {
//                translate([peg_h * x, 0, 0])
//                technic_beam_odd(beam_length);
//            }
//        }
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
        
//        //DANGEROUS... SPECIAL CASE... NOT GENERAL!!!
//        rotate([0, 90, 90])
//        translate([-(frame_adapter_x + peg_h) * 0.5, -peg_h * (beam_num_aft * 1.5 + 0.5), 0])
//        difference()
//        {
//            scale([1, 1, beam_length + 1])
//            technic_beam_even(beam_num_aft);
//            rotate([0, 90, 0])
//            cube_rounded(peg_h * beam_length - 3, peg_h * 0.75 + (peg_h * beam_num), peg_h + cube_allowance, peg_h);
//        }
//        
//        //DANGEROUS... SPECIAL CASE... NOT GENERAL!!!
//        rotate([0, 90, 90])
//        translate([-(frame_adapter_x + peg_h) * 0.5, peg_h * beam_num_fore * 1, 0])
//        difference()
//        {
//            scale([1, 1, beam_length + 1])
//            technic_beam_even(beam_num_fore + 1);
//            rotate([0, 90, 0])
//            cube_rounded(peg_h * beam_length - 3, peg_h * 0.75 + (peg_h * beam_num), peg_h + cube_allowance, peg_h);
//        }
        
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
   //SERVO BATTERY DECK MODULARIZED
module uno_electronics_block()
{
    //servo_battery_deck();
    ////SERVOS, BATTERY, ARDUINO, SWITCH
    //rotate([-90, 0, 0])
    //translate([0, -fitec_offset * 2, -(fitec_wing_x + peg_h * 1) * 0.5])
    //                
    //difference()
    //{
    //    union()
    //    {
    //        translate([0, fitec_offset, 0])
    //        servo_battery_deck();
    //    }
    //}
    //
    rotate([90, 0, 0])
    translate([0, fitec_offset + peg_h * 0.65 + peg_h * 0.25 - cube_allowance/2, -(3 + peg_h * 0.45)])
    {
        translate([-fitec_base_z * 2 - fitec_top_z * 0.5 - cube_allowance* 1.25, fitec_offset + peg_h * 0.65, fitec_base_y * 0.5 + switch_iy + peg_h * 0.5])
        rotate([90, 0, 0])
        switch_casing();
        translate([fitec_z - fitec_top_z, -peg_h * 0.9,  fitec_base_y * 0.5 + peg_h * 0.5 + peg_h])
        uno_adapter();
    }

    translate([12 + 9.25, -peg_h * 1.2 + cube_allowance * 1.25, -3])
    rotate([90, 0, 0])
    battery_monitor_insert();
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

module electronics_fulcrum()
{
    color("purple")
    difference()
    {
        cube_rounded(electronics_fulcrum_ox, electronics_frame_oy, electronics_frame_oz - peg_h * 2, peg_h);
        cube_base(electronics_frame_ox, electronics_frame_oy, electronics_frame_iz);
        
        for(x = [-1, 1])
        {
//            for(y = [-2:2])
//            {
//                translate([(electronics_frame_ox + peg_h) * 0.5 * x, peg_h * y, 0])
//                scale([1, 1, (electronics_frame_oz + cube_allowance)/peg_h])
//                peg();
//            }

            for(z = [-5:4])
            {
                translate([0, (peg_h * 1 * x), peg_h * 0.5 + peg_h * z])
                rotate([0, 90, 0])
                scale([1, 1, electronics_fulcrum_ox/peg_h])
                peg();
            }
        }
        
        //NUTS
        translate([0, 0, fulcrum_z/2 - bolt_head_r * 2.15])
        {
            //Battery side Nut
            translate([-((electronics_frame_ox * 0.5 + nut_z * 0.5 - (electronics_frame_ox - electronics_frame_ix)/2)), 0, -electronics_frame_oz * 0.5 + bolt_shaft_r])
            rotate([0, 90, 0])
            rotate([0, 0, 360/12])
            nut();
            
            //Display side Nut
            translate([(electronics_frame_ox * 0.5 + nut_z * 0.5 - (electronics_frame_ox - electronics_frame_ix)/2), 0, -electronics_frame_oz * 0.5 + bolt_shaft_r])
            rotate([0, 90, 0])
            rotate([0, 0, 360/12])
            nut();
            
            translate([0, 0, nut_r * 1.5])
            difference()
            {
                rotate([0, 90, 0])
                cylinder_base(bolt_head_r, frame_x * 2, roundness);
                cube_base(frame_x + nut_z * 4 + 10, bolt_head_r * 2, bolt_head_r * 2);
            }
        }
    }
}
/************************************************************/
module electronics_frame()
{
    color("green")
    difference()
    {
        cube_rounded(electronics_frame_ox - cube_allowance, electronics_frame_oy, electronics_frame_oz, peg_h);
        cube_base(electronics_frame_ix, electronics_frame_oy + cube_allowance, electronics_frame_iz);
        
        //NUTS
        translate([0, 0, fulcrum_z/2 - bolt_head_r * 2.15])
        {
            //Battery side Nut
            translate([-((electronics_frame_ox * 0.5 + nut_z * 0.5 - (electronics_frame_ox - electronics_frame_ix)/2)), 0, -electronics_frame_oz * 0.5 + bolt_shaft_r])
            rotate([0, 90, 0])
            nut();
            
            //Display side Nut
            translate([(electronics_frame_ox * 0.5 + nut_z * 0.5 - (electronics_frame_ox - electronics_frame_ix)/2), 0, -electronics_frame_oz * 0.5 + bolt_shaft_r])
            rotate([0, 90, 0])
            nut();
            
            translate([0, 0, nut_r * 1.5])
            difference()
            {
                rotate([0, 90, 0])
                cylinder_base(bolt_head_r, frame_x * 2, roundness);
                cube_base(frame_x + nut_z * 4 + 10, bolt_head_r * 2, bolt_head_r * 2);
            }
        }

    }

    color("orange")
    translate([0, (electronics_frame_oy - frame_y) * 0.5, 2])
    {
        rotate([90, 0, 0])
        difference()
        {
            translate([-40.15 - 1.8, 14.9 * 2 + 5, -3.75])
            displayCase();
            translate([0, -0, 12])
            cube_base(120, 90, 25);
        }
    }

//    color("red")
//    translate([27, 20, 20])
//    {
//        rotate([90, 0, 0])
//        translate([switch_ox * 0.25, switch_iz * 0.5, -(3 + peg_h + cube_allowance/2)])
//        {
//            translate([-(electronics_frame_ox * 0.5), -(electronics_frame_oy * 2 + switch_oy), (switch_iy + peg_h * 0.5)])
//            switch_casing();
//        }
//    }
}
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
//    color("red")
//    translate([0, 0, 7])
//    difference()
//    {
//        cylinder_base(36, 6, roundness);
//        cylinder_base(30, 6 + cube_allowance, roundness);
//    }
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
        
//        difference()
//        {
//            cylinder_base(tire_r, 2, roundness);
//            cylinder_base(tire_r-1, 2, roundness);
//        }
    
	/*
        for(zr = [-2:2])
        {
            color("brown")
            rotate([30, 0, 72*zr])
            difference()
            {
                cube_base((tire_r + 2) * 2, peg_h, 2);
                cube_base((tire_r-1) * 2, peg_h, 2);
            }
            color("pink")
            rotate([-30, 0, 36 + 72*zr])
            difference()
            {
                cube_base((tire_r + 2) * 2, peg_h, 2);
                cube_base((tire_r-1) * 2, peg_h, 2);
            }
        }
	*/
    }
}
/************************************************************/
module out_wall()
{
    for(x = [-1:1])
    {
        translate([peg_h * x, 0, 0])
        technic_beam_even(12);
    }
    rotate([0, 0, 90])
    translate([peg_h * 5.5, 0, peg_h])
    technic_beam_odd(3);
    rotate([0, 0, 90])
    translate([-peg_h * 6   , 0, 0])
    rotate([0, 90, 0])
    scale([1, 1, 2])
    technic_beam_odd(3);
}
/************************************************************/
//front_wall();//FRONT (a.k.a. BUMP WALL) WALL
module bump_wall()
{
    bridge_wall_oy = electronics_frame_oy;// - peg_h * 3;
    //ADD 9 PEG (X) BY 8 PEG (Z) FRAME/PEG BOARD
    difference()
    {
        cube_rounded(electronics_fulcrum_ox, peg_h * 2, peg_h, peg_h);
        cube_rounded(electronics_fulcrum_ox - peg_h * 2, peg_h/2, peg_h + cube_allowance, peg_r);
    }
    for(x = [-1, 1])
    {
        //HINGES
//        translate([peg_h * 6 * x, peg_h * 1.5, 0])
//        rotate([0, 0, 90])
//        technic_beam_odd(3);
        
        translate([peg_h * 6 * x, peg_h * 1, peg_h])
        rotate([0, 90, 0])
        {
            translate([0, -peg_h * 0.5, 0])
            cube_base(peg_h, peg_h * 3, peg_h);
            translate([0, peg_h, 0])
            technic_beam_even(2);
        }
//        //WALL CONNECTIONS
//        translate([peg_h * 9.5 * x, peg_h * 2.5, 0])
//        technic_beam_odd(3);
    }
    
    for(x = [-4:2:4])
    {
        translate([peg_h * x, peg_h * 3, 0])
        technic_beam_even(4);
    }
    rotate([0, 0, 90])
    translate([peg_h * 4.5, 0, 0])
    technic_beam_odd(9);
    rotate([0, 0, 90])
    translate([peg_h * 1.5, 0, 0])
    technic_beam_odd(19);
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
//difference()
//{
//    cube_rounded(peg_h * 3, peg_h, 56, peg_h);
//    for(x = [-1:1])
//    {
//        translate([peg_h * x, 0, 0])
//        scale([1, 1, 8])
//        peg();
//    }
//}

////NEW STRIPPED DOWN ELECTRONICS FRAME
//difference()
//{
//    electronics_frame();
//    
//    for(x = [-2:2])
//    {
//        rotate([90, 0, 0])
//        translate([peg_h * 3 * x, 0, (electronics_frame_oy) * 0.5 - cube_allowance])
//        cube_rounded(peg_h * 2, peg_h * 9, peg_h, peg_h);
//    }
//    
//}

//electronics_fulcrum();
//color("yellow")
//frame_adapter();
//cube_rounded_full(peg_h * 3, peg_h * 3, peg_h * 7, peg_h);
//for(rz = [0:3])
//{
//    rotate([90, 0, (90 * rz)])
//    translate([peg_h, 0, 0])
//    rotate([0, 90, 0])
//    technic_beam_odd(7);
//}
//translate([-frame_adapter_x * 2.25 + 1, 0, 0])
//color("yellow")

//motor_span = number of peg holes it takes to cover the longest
//dimension of the servo case.


//fulcrum();
//color("grey")
//rotate([90, 0, 90])
//translate([-peg_h * (beam_num - 1.5) * 2, -(peg_h * 0.5 + 1), peg_h * 7.25])
//frame_adapter_top(end_caps_v, end_caps_h, beam_num, 5, beam_offset_x, beam_offset_y);
//mirror([1, 0, 0])
//color("grey")
//rotate([90, 0, 90])
//translate([-peg_h * (beam_num - 1.5) * 2, -(peg_h * 0.5 + 1), peg_h * 7.25])
//frame_adapter_top(end_caps_v, end_caps_h, beam_num, 5, beam_offset_x, beam_offset_y);

//beam_num_aft = 4;
//color("cyan")
//rotate([90, 0, 90])
//translate([peg_h * (beam_num_aft - 1) * 2, -(peg_h * 0.5 + 1), peg_h * 7.25])
//frame_adapter_top(end_caps_v, end_caps_h, beam_num_aft, 5, beam_offset_x, beam_offset_y);
//mirror([1, 0, 0])
//color("cyan")
//rotate([90, 0, 90])
//translate([peg_h * (beam_num_aft - 1) * 2, -(peg_h * 0.5 + 1), peg_h * 7.25])
//frame_adapter_top(end_caps_v, end_caps_h, beam_num_aft, 5, beam_offset_x, beam_offset_y);

//color("grey")
//translate([0, peg_h * 0.25, 0])
//frame_adapter_top(end_caps_v, end_caps_h, beam_num, 7, beam_offset_x, beam_offset_y);
//
//color("cyan")
//translate([peg_h * 10, peg_h * 2.25, 0])
//frame_adapter_top(end_caps_v, end_caps_h, 2, beam_length + 6, beam_offset_x, beam_offset_y);



//color("black")
//fitec_cutout();
//frame_adapter(end_caps_v, end_caps_h, beam_num, beam_length, beam_offset_x, beam_offset_y);

//batt_case_z = (frame_y + batt_monitor_oy + battery_z * 1.25) * 2 - (fitec_top_z + fitec_wing_z) * 2 - (fitec_base_z) * 2;
//
//color("blue")
//servo_with_M3_mounts();
////servo_with_M3_mounts("x_side");
//translate([0, 0, -(frame_adapter_x + batt_case_z)])
//color("red")
////servo_with_M3_mounts("y_side");
//servo_with_M3_mounts();

//servo_M3_holes();
//rotate([0, 90, 0])
//translate([0, 0, 70])
//{
////    servo_with_M3_mounts();
////    translate([0, 50, 0])
//    servo_with_M3_insert_fitec();
//    servo_with_M3_insert_geek();
//}
//battery_w_M3();

//SERVO AND BATTERY MOUNTS... SINGLE BATTERY ONLY, SPEKTRUM 6.6V 2200mAh
//rotate([90, 0, 0])

battery_deck_M3_spektrum();
//battery_w_M3();
batt_case_z = (frame_y + batt_monitor_oy + battery_z * 1.25) * 2 - (fitec_top_z + fitec_wing_z) * 2 - (fitec_base_z) * 2;
//for(x = [-1, 1])
//{
//    translate([(batt_case_z + peg_h) * 0.5 * x, 0, -peg_h * 0.75])
//    rotate([90, 0, 90])
//    color([1, 1, 0, 0.1])
//    servo_with_M3_mounts();    
//}
//SIDES TO GO OVER THE SERVO MOUNTS
beam_num_switch = 5 + 4;
beam_num_servo  = 7;
beam_num_servo_to_aft = beam_num_switch + beam_num_servo;
beam_num_side_to_side = 17;
/*FULLY INTEGRATED FRAME.... */
//translate([(batt_case_z + peg_h) * 0.5, 0, -peg_h * 0.75])
//rotate([90, 0, 90])
//translate([-4 * peg_h, 0, 0])
//color("yellow")
//frame_adapter_side(true, true, beam_num_switch, 0, 0);
//translate([-(batt_case_z + peg_h) * 0.5, 0, -peg_h * 0.75])
//rotate([-90, 0, 90])
//translate([-4 * peg_h, 0, 0])
//color("yellow")
//frame_adapter_side(true, true, beam_num_switch, 0, 0);
//round_power_switch();
//rotate([-90, 0, 0])
//translate([0, -(peg_h * 2.5), peg_h * (beam_num + beam_num_switch - 3)])
//color("red")
//bump_wall();
//mirror([0, 1, 0])
//rotate([-90, 0, 0])
//translate([0, -(peg_h * 2.5), peg_h * (beam_num + beam_num_switch - 3)])
//color("red")
//bump_wall();
/*....FULLY INTEGRATED FRAME */

////THIS IS THE AFT WALL... WHAT IT NEEDS TO BE IS A PARTIAL WALL WITH THE 
////STRUCTURES FOR BUMPERS
////rotate([90, 0, 0])
////translate([peg_r - (peg_h * beam_num_side_to_side) * 0.5, -(peg_h * 0.65), -peg_h * (0.5 + beam_num + beam_num_aft)])
////{
////    color("orange")
////    translate([-(peg_r - (peg_h * beam_num_side_to_side) * 0.5), peg_h * 0.625, peg_h * 2 + 3])
////    difference()
////    {
////        cube_rounded((beam_num_side_to_side + 1.5) * peg_h, peg_h * (beam_num_servo - 1), peg_h, peg_h);
////        cube_rounded((beam_num_side_to_side - 0.5) * peg_h, peg_h * beam_num, peg_h + cube_allowance, peg_h);
////    }
////    color("maroon")
////    frame_adapter_top(false, end_caps_h, beam_num_side_to_side, 5, beam_offset_x, beam_offset_y);
////}



//translate([0, peg_h * (beam_num/2 + beam_num_aft), peg_h * 0.5])
//contact_bar();
//
//translate([0, -(peg_h * 10.5), peg_h * 4.5])
//{
//    rotate([90, 0, 0])
//    electronics_fulcrum();
////    rotate([90, 0, 0])
////    electronics_frame();
//}

//out_wall();
//WHEEL AND TIRE
//axle_wheel_base();
//axle_wheel_tire();



//wall_servo_to_peg();
//chton();
//large_button_switch();

//rotate([0, 0, 90])
//translate([-(peg_h * 2.45), 0, 0])
//color("yellow")
//bump_switch_rack();
//translate([0, peg_h, 0])
//rotate([90, 0, 0])
//bump_button_mount();

//tread_clamp();
//axle_half_beam_1x2();
//axle(peg_h * 5);
//axle(peg_h * 17);
//Wall should be axle connected
//translate([0, -peg_h * 7, 0])
//wall_arm_wedge();
//mirror([0, 1, 0])   
//translate([0, -peg_h * 7, 0])
//wall_arm_wedge();

/*
//COGS320 chutes and camera tower
translate([peg_h * 0.5 + peg_h * 1.5, 0, 0])
chute();

translate([-peg_h * 7.5 - peg_h * 1.5, 0, 0])
chute();

for(x = [-1:1])
{
    translate([peg_h * x, -peg_h * 5.5, peg_h])
    scale([1, 1, 3])
    technic_beam_3();
}
translate([0, -peg_h * 6.5, peg_h])
difference()
{
    cylinder_base(peg_h * 2.5, peg_h * 3, roundness);
    translate([0, peg_h * 2.5, 0])
    cube_base(peg_h * 5, peg_h * 5, peg_h * 3 + cube_allowance);
    for(x = [-1:1])
    {
        translate([peg_h * x, 0, 0])
        scale([1, 1, 3])
        peg();
    }
}
*/

//color("orange")
//translate([-peg_h * 8, 0, 0])
//scale([3, 1, 1])
//{
//    rotate([0, 90, 0])
//    technic_beam_odd(5);
//
//    rotate([0, 90, 0])
//    translate([-peg_h * 1, 0, 0])
//    technic_beam_odd(5);
//
//    rotate([0, 90, 0])
//    translate([-peg_h * 2, 0, 0])
//    technic_beam_odd(5);
//}

//color("yellow")
//translate([-(peg_h * 8.5 - button_wall_r), peg_h * 2.5, (button_wall_r + peg_h * 0.5)/2])
//rotate([90, 0, 0])
//bump_button_mount();
//
//color("yellow")
//translate([(peg_h * 8.5 - button_wall_r), peg_h * 2.5, (button_wall_r + peg_h * 0.5)/2])
//rotate([90, 0, 0])
//bump_button_mount();

//for(z = [-2:2])
//{
//    rotate([0, 0 ,90])
//    translate([peg_h * 17, 0, peg_h * z])
//    color("purple")
//    technic_beam_odd(21);
//}
/*
difference()
{
    import("C:/Users/nilivingston/Documents/CAD/COGS320_2026/COGS320_2026_electronics_module_tread_base_v1.stl");

    for(x = [-1, 1])
    {
        for(z = [-2:5])
        {
            translate([(fitec_wing_x + peg_h + fitec_base_z * 0.5 + cube_allowance * 0.75) * x, peg_h * 9, peg_h * z])
            rotate([0, 90, 0])
            tread_beam(false);
        }
    }
}

for(x = [-1, 1])
{
    for(z = [-2:5])
    {
        translate([(fitec_wing_x + peg_h + fitec_base_z * 0.5 + cube_allowance * 0.75) * x, peg_h * 9, peg_h * z])
        rotate([0, 90, 0])
        tread_beam(true);
        
        
        
    }
}
*/
//import("C:/Users/nilivingston/Documents/CAD/COGS320_2026/COGS320_2026_electronics_module_tread_base_v1.stl");
//for(z = [0:7])
//{
////    for(x = [-1, 1])
////    {
////        translate([peg_h * 10 * x, 0, peg_h * z])
////        rotate([0, 90, 0])
////        color("blue")
////        technic_beam_odd(15);
////    }
//    //Put in posts with axle holes top and bottom for interfacing
//    //with the walls.
//    //How to deal with the servos?  Depends on the servos.
//    //How to deal with the electronics?
//    for(y = [1])
//    {
//        translate([0, peg_h * 16/2 * y, peg_h * z])
//        rotate([0, 90, 90])
//        color("orange")
//        technic_beam_even(18);
//    }
//}
//for(x = [-1, 1])
//{
//    for(z = [-1, 1])
//    {
//        rotate([90, 0, 90])
//        translate([peg_h * 8.0 * x, peg_h * 3.5, peg_h * 10 * z])
//        color("cyan")
//        technic_beam_even(8);
         
//        rotate([90, 0, 90])
//        translate([peg_h * 7.0 * x, peg_h * 3.5, peg_h * 10 * z])
//        color("blue")
//        technic_beam_even(8);
//    }
//}

//tower_xi = 260;
//tower_yi = 240 - bum_r;
//tower_x = tower_xi + peg_h * 2;
//tower_y = tower_yi + peg_h * 2;
//tower_z = 140;
//tower_corner_or = 50;
//tower_corner_ir = 110;
//figurine_z = 14 + 60 + 24;
//
//translate([0, peg_h * 5, -peg_h/2 + (tower_z - peg_h * 2.5)])
//difference()
//{
//    cube_rounded(peg_h * 5, peg_h * 5, peg_h, peg_h);
//    for(y = [-2:2])
//    {
//        for(x = [-2:2])
//        {
//            translate([peg_h * x, peg_h * y, 0])
//            peg();
//        }
//    }
//}           
//eps = 0.01;
//$fn = 200;
//hook_r = peg_h * 2.5;
//rotate([-90, 0, -90])
//translate([-peg_h * 7.5, -tower_z * 0.5 + peg_h * 2.5, 0])
//{
////    rotate([90, 0, 0])
////    cube_base(peg_h * 5, peg_h, tower_z);
////    translate([eps, 60, 0])
////        rotate_extrude(angle=270, convexity=10)
////            translate([40, 0]) circle(hook_r);
//    translate([-30, 0, 0])
//    rotate_extrude(angle=135, convexity=10)
//        translate([50, 0]) circle(hook_r);
//    translate([20, eps, 0])
//        rotate([90, 0, 0]) cylinder(r=hook_r, h=70+eps);
//}

//difference()
//{
//    cube_rounded_full(tower_x, tower_y, tower_z, tower_corner_or);
//    cube_base(tower_xi, tower_yi, tower_z + cube_allowance);
//}

////TREAD HORN
//tread_horn();
//scale([2.25, 2.25, 1])
//translate([-7, 5, 0])
//import("C:/Users/nilivingston/Documents/CAD/COGS320_2026/normal_tire.stl");



//
//for(rz = [0:10:360])
//{
//    rotate([0, 0, rz])
//    translate([34, 0, 10 - 3])
//    rotate([10, 0, 0])
//    scale([0.5, 1, 1])
//    cube_rounded_full(peg_r, peg_r, 6, peg_r);
//    
//    rotate([0, 0, rz + 5])
//    translate([34, 0, 10 - 3])
//    rotate([-30, 0, 0])
//    scale([0.5, 1, 1])
//    cube_rounded_full(peg_r, peg_r, 6, peg_r);
//}


//translate([0, fitec_offset, 0])
//servos_battery_rails();

//servo_frame_base();
//cowcatcher_tip_r = 30;
//cowcatcher_tip_z = 30;
//cowcatcher_top_r = 100;
//cowcatcher_z = 80 * 0.875;
//cowcatcher_f = 8;

//rotate([0, 0, 45])
//cube_rounded_full(cowcatcher_tip_r * 2, cowcatcher_tip_r * 2, cowcatcher_tip_z, cowcatcher_tip_r);
//difference()
//{
//    union()
//    {
//        cone_base(cowcatcher_tip_r, cowcatcher_top_r, cowcatcher_z, cowcatcher_f);
//        translate([0, 0, - cowcatcher_z * 0.5])
//        sphere_base(cowcatcher_tip_r, cowcatcher_f);
//    }
//    translate([0, cowcatcher_top_r, - cowcatcher_tip_z * 0.5])
//    cube_base(cowcatcher_top_r * 2, cowcatcher_top_r * 2, cowcatcher_z + cowcatcher_tip_r);
//}
//fulcrum_screws();
//fulcrum();

//SERVO IMPORTS
//import("C:/Users/nilivingston/Documents/CAD/card_deck_robot-tank_bot/Servo_Parts/files/AdapterHorn-type1.stl");
//translate([-40, 0, 0])
//import("C:/Users/nilivingston/Documents/CAD/card_deck_robot-tank_bot/Servo_Parts/files/AdapterHorn-type2.stl");
//import("C:/Users/nilivingston/Documents/CAD/card_deck_robot-tank_bot/Servo_Parts/files/ServoBracketFrameless.stl");


//scale([2, 2, 1])
//import("C:/Users/nilivingston/Documents/CAD/COGS320_2026/TK_Tread_Wheel.stl");

//for(r = [0.5:5.5])
//{
//    rotate([0, 0, 30 * r])
//    translate([105, 0, 0])
////    rotate([0, 0, -60 * r])
//    color("green")
//    difference()
//    {
//        fig_full(true);
//    //    translate([20, 0, 0])
//    //    cube_base(40, 55, 110);
//    }
//}
//
//for(r = [-2:-1])
//{
//    rotate([0, 0, 30 * r])
//    translate([105, 0, 0])
////    rotate([0, 0, -60 * r])
//    color("cyan")
//    difference()
//    {
//        fig_full(false);
//    //    translate([-20, 0, 0])
//    //    cube_base(40, 55, 110);
//    }
//}

//
//translate([-bum_r * 3.35, 0, 0])
//for(x = [0.75])
//{
//    for(y = 1)//[-1:1])
//    {
//        translate([bum_r * 2.4 * x, bum_r * 2.4 * y, 0])
//        color("green")
//        fig_full(true);
//        
//    }
//}
//translate([bum_r * 3.35, 0, 0])
//for(x = [-0.75])
//{
//    translate([bum_r * 2.4 * x, bum_r * 2.4, 0])
//    color("cyan")
//    fig_full(false);
//       
//}
//translate([0, 0, -(tower_z * 0.5 - peg_h * 2)])
//cube_rounded(peg_h * 3, peg_h * 3, tower_z - peg_h * 4, peg_h);
//translate([0, 0, -(tower_z - peg_h * 4)])
//cube_rounded_full(peg_h * 3, peg_h * 3, peg_h * 3, peg_h);
//difference()
//{
//    union()
//    {
//        scale([1, 3/2, 1])
//        translate([-bum_r * 3.35, 0, 0])
//        difference()
//        {
//            cylinder_base(bum_r * 3.35, figurine_z, 120);
//            cylinder_base(bum_r * 3.35 - peg_h, figurine_z + cube_allowance, 120);
//        }
//
//        mirror([1, 0, 0])
//        scale([1, 3/2, 1])
//        translate([-bum_r * 3.35, 0, 0])
//        difference()
//        {
//            cylinder_base(bum_r * 3.35, figurine_z, 120);
//            cylinder_base(bum_r * 3.35 - peg_h, figurine_z + cube_allowance, 120);
//        }
//    }
//
//    translate([0, bum_r * 3.35 * 1.5, 0])
//    cube_base(bum_r * 3.35 * 4, 50, figurine_z + cube_allowance);
//    translate([0, bum_r * 3.35 * 1, 0])
//    cube_base(100, bum_r * 3.35, figurine_z + cube_allowance);
//}
//
//translate([0, bum_r * 1.5, (tower_z - figurine_z) * 0.5])
//scale([1, 3, 1])
//cylinder_base(peg_h * 2, tower_z, 120);
//
//difference()
//{
//    cube_rounded_full(tower_x, tower_y, tower_z, tower_corner_or);
//    cube_base(tower_xi, tower_yi, tower_z + cube_allowance);
//}
//GRIPPER MOUNT
//camera_to_ez_tilt();
//ez_servo_to_pegs();
//notch();
//chton();
//translate([0, 0, peg_h/2 + notch_base_z + notch_z/2])
//difference()
//{
//    cube_rounded(peg_h * 2, peg_h * 2, peg_h, peg_h);
//    for(x = [-0.5, 0.5])
//    {
//        for(y = [-0.5, 0.5])
//        {
//            translate([peg_h * x, peg_h * y, peg_h * 0.0])
//            peg();
//        }
//    }
//}

//servo_base();
//wheel_base();
//translate([-fitec_base_z * 2 - fitec_top_z * 0.5 - cube_allowance* 1.25, fitec_offset + peg_h * 0.65, fitec_base_y * 0.5 + switch_iy + peg_h * 0.5])
//rotate([90, 0, 0])
//switch_casing();
//translate([fitec_z - fitec_top_z, -peg_h * 0.9,  fitec_base_y * 0.5 + peg_h * 0.5 + peg_h])
//uno_adapter();

//difference()
//{
//    union()
//    {
//        deck_base();
//        translate([0, 0, -(kipr_z + kipr_floor) * 3.0 - kipr_r * 0.5 + caster_offset])
//        caster();
//    }
//    mount_points();
//    switch_mounts();
//}
////translate([0, -peg_h * 0.88, (frame_y + batt_monitor_oy + battery_z * 1.25 + cube_allowance * 2.5 + peg_h * 0.53)])
//translate([0, fitec_offset, 0])
//electronics_battery_servos();
////SERVO MODULE
//translate([0, fitec_offset, 0])
//color("purple")
//difference()
//{
//    translate([0, -peg_h * 0.88, (frame_y + batt_monitor_oy + battery_z * 1.25 + cube_allowance * 2.5 + peg_h * 0.53)])
//    electronics_battery_servos();
//    rotate([0, 0, 90])
////    translate([0, 0, -5.0])
//    battery_casing_base(1.08);
////    translate([75, 0, 0])
////    cube_base(150, 150, 70);
////    translate([0, 35, 0])
////    cube_base(150, 70, 70);
//}

//translate([0, fitec_offset, 0])
//rotate([0, 0, 90])
//translate([0, 0, -3.0])
//battery_casing_base(1.1);

//giga_assembly();
//translate([0, 50, 0])
//servo_frame_base();

//servos_and_battery();
//translate([0, 0, battery_spektrum_z/2 + kipr_floor])

////ARDUINO UNO ADAPTER + SWITCH CASING
//rotate([90, 0, 0])
//translate([0, battery_spektrum_y * 0.5 + 1.5, battery_spektrum_x * 0.5 + peg_h * 0.5 - 1.5])
//uno_adapter();
//translate([battery_y * 2, 0, 0])
//rotate([0, -90, 90])
//rotate([0, 0, 90])
////translate([0, 0, frame_x * 0.5])
//translate([-(peg_h), -fitec_base_y * 2 + peg_h * 0.5, fitec_base_x * 0.7 + cube_allowance * 1.75])
//switch_casing();


include <foundational_modules.scad>;
roundness      = 200;
cube_allowance = 0.5;
rad_allowance  = 0.25;
in_to_mm       = 25.4;

peg_r          = 2.5;// + rad_allowance;
peg_h          = 8;// + cube_allowance;

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

fitec_wing_x = 55.5 + cube_allowance;
fitec_wing_y = 20 + cube_allowance;
fitec_wing_z = 4 + cube_allowance;
fitec_base_x = 42 + cube_allowance;
fitec_base_y = 20 + cube_allowance;
fitec_base_z = 27.5 + cube_allowance;//16 + cube_allowance;
fitec_top_x  = 42 + cube_allowance;
fitec_top_y  = 20 + cube_allowance;
fitec_top_z  = 8 + cube_allowance;
fitec_z      = fitec_base_z + fitec_wing_z + fitec_top_z;
fitec_offset = 10;

wheel_r      = 35;
wheel_h      = 8;

kipr_x     = 62;//105;
kipr_y     = 93 ;//105;
kipr_z     = 10; // Does this meet clearance for the on/off switch?
kipr_r     = 10;
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

tiny_stack_xy  = 20 + cube_allowance;
tiny_shield_z  = 3.99;
tiny_stack_z   = tiny_shield_z * 3;
battery_buff   = 2;
battery_x      = 42;//22;
battery_y      = 32;//22;
battery_z      = 8;//6;

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

nut_r          = 10;
nut_h          = 3;

ldr_r  = 2.5;
ldr_h  = 15;
ldr_ro = ldr_r + 2;
/***************************************************************************/
/***************************************************************************/
module fitec_cutout(solo)
{
    
    wire_z = 25;
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
   
    translate([0, 0, wire_z/2])
    cube_base(fitec_wing_x + 8 + peg_h + cube_allowance, 6 + cube_allowance, wire_z);
    
    if(solo == 0)
    {
        //Cable space can be subtracted out on either side... channel for sliding wire down.
        translate([0, 0, -fitec_top_z/2-cube_allowance - fitec_wing_z/8])
        cube_base(fitec_wing_x, 4, fitec_base_z * 2.5 + fitec_wing_z/2 - cube_allowance/4);
    }
}
/***************************************************************************/
module wheel_mounted(r_scale, h_scale)
{
    rotate([0, -90, 0])
    cylinder_base(wheel_r * r_scale, wheel_h * h_scale, roundness);
}
/***************************************************************************/

module servo_base()
{
    //Servos and wheels
    for(i = [-1, 1])
    {
        rotate([0, 0, 0])
        translate([((kipr_x + peg_h * 3) * 0.5 + fitec_top_z) * i, fitec_offset * 0, -(fitec_base_y + kipr_z + kipr_floor) * 0.50])
        wheel_mounted(1, 1);//fitec_cutout();
    }

}
/***************************************************************************/

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
/***************************************************************************/


module mount_points()
{
    for(x = [-8:8])
    {
        translate([peg_h * x, (kipr_y + peg_h * 1)* 0.5, peg_h * 0.5])
        cylinder_base(peg_r, peg_h, 150);
        translate([peg_h * x, -(kipr_y + peg_h * 1)* 0.5, peg_h * 0.5])
        cylinder_base(peg_r, peg_h, 150);
    }
    //Front and Back Deck
    for(r = [-2, 0])
    {
        for(x = [-7:7])
        {
            for(z = [-3.5:-1.5])
            {
                if((z == -2.5 && x % 3 == 0) || z == -3.5 || z == -1.5){
                    rotate([0, 0, 90 * r])
                    //rotate([90, 0, 0])
                    translate([peg_h * x, (kipr_y + peg_h * 0.5)* 0.5, peg_h * 0.25 + peg_h * z])
                    rotate([90, 0, 0])
                    cylinder_base(peg_r, peg_h * 2 + cube_allowance, roundness);
                }
                else
                {
                    rotate([0, 0, 90 * r])
                    translate([peg_h * x, (kipr_y + peg_h * 0.5)* 0.5, peg_h * 0.25 + peg_h * z])
                    cube_base(peg_h, peg_h * 4 + cube_allowance, peg_h);
                }
            }
        }
    }
    //Sides Deck
    for(x = [-8, -7, -6, -5, -4, 6, 7, 8])
    {
        for(z = [-3.5:-1.5])
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
            for(z = [-3.5:-1.5])
            {
                rotate([0, 0, 90])
                translate([peg_h * x, (kipr_x + peg_h * 1)* 0.5, peg_h * 0.25 + peg_h * z])
                rotate([90, 0, 0])
                cylinder_base(peg_r, peg_h * 2.5 + cube_allowance, roundness);
            }
        }
    }
}
/***************************************************************************/
module deck_base()
{
    //Top of deck
    difference()
    {
        cube_rounded(kipr_x + peg_h * 2 + plug_x, kipr_y + peg_h * 2, kipr_z + kipr_floor, kipr_r);
//        cube_base(kipr_x - 0, kipr_y - kipr_lip, kipr_z + kipr_floor);
//        translate([0, 0, kipr_floor * 0.5])
//        cube_base(kipr_x + plug_x * 0, kipr_y + cube_allowance, kipr_z);
//        translate([0, 0, kipr_floor * 0.5])
        cube_base(kipr_x + cube_allowance, kipr_y + cube_allowance, kipr_z + kipr_floor + 0.01);
//        //USB for new KIPR controller
        rotate([90, 0, 0])
        translate([peg_h, 10, kipr_floor * 0.5 - peg_h * 0.75])
        cylinder_base(usb_y * 0.5, kipr_y + peg_h + 0.01, 150);
        
        //Wire pass throughs... make only as wide as the tabs for the servos
        for(x = [-1, 1])
        {
            translate([((kipr_x + peg_h * 2 - fitec_wing_z * 1.5) * 0.5) * x, 0, -((kipr_floor - peg_h * 0.5) * 0.50 + cube_allowance)])
            cube_base(fitec_wing_z * 2, kipr_y - peg_h * 2, kipr_floor + peg_h * 1.5);

        }
    }

    //Bottom of deck
    //Lower bottom deck one row of pegs (peg_h), make sure casters are in line with
    //this lowered bottom.
    difference()
    {
        translate([0, 0, -(kipr_z + kipr_floor + fitec_base_y) * 0.5 + cube_allowance * 0.5 - peg_h * 0.5])
        difference()
        {
            cube_rounded(kipr_x + peg_h * 2 + plug_x, kipr_y + peg_h * 2, fitec_wing_y + peg_h - cube_allowance, kipr_r);
            cube_rounded(kipr_x - kipr_lip, kipr_y - kipr_lip, fitec_wing_y + peg_h, kipr_r);
            //cube_rounded(kipr_x - peg_h, kipr_y - peg_h * 2.5, fitec_wing_y + peg_h, kipr_r);
            //Make sure servos can slide in
            translate([0, fitec_offset, -peg_h - kipr_floor * 0.75])
            cube_base(kipr_x + kipr_lip * 2, fitec_wing_x, peg_h);
        }
        for(i = [-1, 1])
        {
            rotate([0, 0, 90 * i])
            rotate([90, 0, 0])
            translate([fitec_offset * i, -(fitec_base_y + kipr_z + kipr_floor) * 0.5, (kipr_x + peg_h * 2) * 0.5 - fitec_base_z - fitec_wing_z - kipr_r * 0.25])
            fitec_cutout();
            translate([(kipr_x + fitec_wing_z + cube_allowance * 4) * 0.5 * i, 0, -peg_h * 2.5])
            cube_base(fitec_wing_z, kipr_y - peg_h * 2, peg_h * 4);
        }
        
        
    }
    //Caster mounts
    translate([0, (kipr_y * 0.5 - peg_h * 0.5 - caster_r), -(kipr_z + peg_h * 3 - kipr_floor + cube_allowance)])
    difference()
    {
        union()
        {
            translate([0, 1, 4.5])
            {
                translate([0, -6, -(4.5 + cube_allowance)])
                cylinder_base(caster_mount_xo + 2, 5, 150);
                translate([0, 0, -(4.5 + cube_allowance)])
                cube_base((caster_mount_xo + 2) * 2, 6, 5);
//                translate([0, 0, 2.0 + cube_allowance])
//                cone_base(caster_mount_xo + 2, 0, 10, 150);
            }

        }
        for(x = [-1, 1])
        {
            translate([caster_mount_xi * x, -6, 0])
            cylinder_base(caster_mount_ri, 10, 150);
//            translate([caster_mount_xi * x, 0, 10])
//            cylinder_base(3, 10, 6);
        }
    }
    mirror([0, 1, 0])
    {
        translate([0, (kipr_y * 0.5 - peg_h * 0.5 - caster_r), -(kipr_z + peg_h * 3 - kipr_floor + cube_allowance)])
        difference()
        {
            union()
            {
                translate([0, 1, 4.5])
                {
                    translate([0, -6, -(4.5 + cube_allowance)])
                    cylinder_base(caster_mount_xo + 2, 5, 150);
                    translate([0, 0, -(4.5 + cube_allowance)])
                    cube_base((caster_mount_xo + 2) * 2, 6, 5);
//                    translate([0, 0, 2.0 + cube_allowance])
//                    cone_base(caster_mount_xo + 2, 0, 10, 150);
                }
            }
            for(x = [-1, 1])
            {
                translate([caster_mount_xi * x, -6, 0])
                cylinder_base(caster_mount_ri, 10, 150);
            }
        }
    }

}
/***************************************************************************/
module complete_chassis()
{
    difference()
    {   //Front and back part of upper deck: one row of peg holes.
        //Front and back walls: every other row has some peg holes, some wire through spaces for plugs
        //Side walls: peg holes are unchanged.
        //USB option both sides
        //Side walls top has slots between controller and inner wall for wires.
        deck_base();
        mount_points();
        
    }
}
/***************************************************************************/

module peg()
{
    cylinder_base(peg_r, peg_h, roundness);
}

//rotate([180, 0, 0])
//complete_chassis();

module servo_unit()
{
    difference()
    {
        translate([0, 0, (fitec_z - fitec_top_z - cube_allowance) * 0.5])
        cube_rounded(peg_h * 10, fitec_base_y + 8 + peg_h, fitec_z - fitec_top_z - cube_allowance, peg_h);
        fitec_cutout();
//        translate([0, 0, (fitec_z - fitec_top_z) * 0.5 - peg_h/2])
//        cube_base(fitec_wing_x + 9 + peg_h, fitec_base_y + 9 + peg_h, fitec_z - fitec_top_z - cube_allowance - peg_h);
        
//        for(y = [-1, 1])
//        {
//            for(x = [-1,1])
//            {
//                translate([((fitec_wing_x + 8) * 0.5) * x, peg_h * y, 0])
//                scale([1, 1, 10])
//                peg();
//            }
//            
//        }
        
    //    for(y = [-2, 2])
    //    {
    //        for(x = [-4:4])
    //        {
    //            translate([peg_h * x, peg_h * y, 0])
    //            scale([1, 1, 10])
    //            peg();
    //        }
    //        
    //    }
    }
}

module servo_deck()
{
    servo_unit();
    mirror([0, 0, 1])
    servo_unit(); 
}

module tire()
{
    tire_ir = 64/2;
    tire_or = 76/2;
    tire_ih = 5.5;
    tire_oh = 8;
    hub_r   = 60/2;
    hub_h   = tire_oh + cube_allowance;

    difference()
    {
        cylinder_base(tire_or, tire_oh, roundness);
        cylinder_base(tire_ir, tire_ih, roundness);
        cylinder_base(hub_r, hub_h, roundness);
    }

    difference()
    {
        cylinder_base(tire_or, tire_oh, roundness);
        cylinder_base(tire_ir, hub_h, roundness);
    }


    difference()
    {
        for(zo = [0:35])
        {
            rotate([0, 0, 10 * zo])
            union()
            {
                for(z = [-1:2:1])
                {
                    for(x = [-1])
                    {
                        translate([tire_or/2, 0, 2 * z])
                        rotate([45 * x, 0, 0])
                        cube_base(tire_or + 2, 3.75, tir_oh);
                    }
                }

                for(z = [-2:2:2])
                {
                    for(x = [1])
                    {
                        translate([tire_or/2, 0, 2 * z])
                        rotate([45 * x, 0, 0])
                        cube_base(tire_or + 2, 3.75, tir_oh);
                    }
                }
            }
        }
        
        cylinder_base(tire_ir, hub_h + 4, roundness);
        
        translate([0, 0, hub_h - cube_allowance/2])
        cylinder_base(tire_or + tire_oh + rad_allowance, hub_h, roundness);
        translate([0, 0, -(hub_h - cube_allowance/2)])
        cylinder_base(tire_or + tire_oh + rad_allowance, hub_h, roundness);
    }
}

module bump(bump_or, bump_ir, bump_os, bump_is, bump_h)
{
    difference()
    {
        scale(bump_os)
        cylinder_base(bump_or, bump_h, roundness);
        scale(bump_is)
        cylinder_base(bump_ir, bump_h + cube_allowance, roundness);
        
//        translate([0, bump_or * 20/120, 0])
//        cube_base(bump_or * 2, bump_or * 40/120, bump_h + cube_allowance);
        //Chop end
//        translate([bump_or * 0.5, -bump_or * 0.25, 0])
//        cube_base(bump_or, bump_or * 0.5 + cube_allowance, bump_h + cube_allowance);
        translate([0, (bump_or * bump_is[1]) * 0.5, 0])
        cube_base(bump_or * 2, bump_or * bump_is[1] +              cube_allowance, bump_h + cube_allowance);
    
        translate([-bump_or * 0.55 - 1, bump_or * 0, 0])
//        rotate([0, 0, 45])
        scale([0.5, 1, 1])
        cube_base(bump_or * 2, bump_or * 2, bump_h + cube_allowance);
//        mirror([1, 0, 0])
//        translate([-1, bump_or * 1, 0])
//        rotate([0, 0, 45])
//        scale([1, 0.45, 1])
//        cube_base(bump_or * 2, bump_or * 2, bump_h + cube_allowance);
    }
//    translate([- peg_h * 0.5, (-40/120 * bump_or + peg_h * 0.5 + 1), - peg_h * 0.25])
    translate([0, -(bump_ir * bump_is[1] - peg_h * 0.25), 0])
    rotate([90, 90, 0])
    difference()
    {
        cube_rounded(peg_h * 2, peg_h, peg_h * 0.5, peg_h);
        for(x = [-0.5:0.5])
        {
            translate([peg_h * x - peg_h * 0.0, 0, 0])
            scale([1, 1, (peg_h + cube_allowance)/peg_h])
            peg();
        }  
        
    }
    
}

module bump_center()
{
    bump_or = 60 + 3 + peg_h;
    bump_ir = bump_or - 3;
    bump_os = [1, 40/120, 1];
    bump_is = [1.035, 40/120, 1];
    bump_h  = 20;
    
    bump_cor = 10;
    bump_cir = bump_cor - 3;


    difference()
    {
        scale(bump_os)
        cylinder_base(bump_or, bump_h, roundness);
        scale(bump_is)
        cylinder_base(bump_ir, bump_h + cube_allowance, roundness);
        
        translate([0, bump_or * 20/120, 0])
        cube_base(bump_or * 2, bump_or * 40/120, bump_h + cube_allowance);
        //Chop ends
        cube_base(bump_or * 2.5, bump_or * 0.5 + cube_allowance, bump_h + cube_allowance);
    }
    
    

//    translate([peg_h * -1, (-40/120 * bump_or + peg_h * 0.5 + 1), -(bump_h - peg_h)/2])
    translate([0, (-40/120 * bump_or + peg_h * 0.5 + 1), -peg_h * 1.75])
    rotate([90, 90, 0])
    difference()
    {   
        translate([0, 0, -peg_h * 0.75])
        cube_rounded(peg_h * 3, peg_h, peg_h * 2.5, peg_h);
        for(x = [-1:1])
        {
            translate([peg_h * x - peg_h * 0.0, 0, -peg_h * 0.75])
            scale([1, 1, (peg_h * 2.5 + cube_allowance)/peg_h])
            peg();
        }  
        
    }
    
    rotate([0, -90, 180])
    translate([-bump_or * 0.51 , 67, 0])
    rotate([0, 0, 125])
    difference()
    {
        scale(bump_os)
        cylinder_base(bump_or + 2, bump_h, roundness);
        scale(bump_is)
        cylinder_base(bump_ir, bump_h + cube_allowance, roundness);
        
        translate([0, bump_or * 20/120 + 3, 0])
        cube_base(bump_or * 2 + 4, (bump_or + 2) * 40/120, bump_h + cube_allowance);
//        bump();
        translate([peg_h * 0.85, -peg_h * 0.75, 0])
        cube_base(bump_or * 1.95, (bump_or + 2) * 0.5 + cube_allowance, bump_h + cube_allowance);

    }
    
//    translate([0, -(peg_h * 2.65 - cube_allowance), peg_h])
//    difference()
//    {
//        scale([1, (bump_cor + peg_h)/bump_cor, 0.5])
//        sphere_base(bump_cor, roundness);
//        scale([1, (bump_cor + peg_h)/bump_cor, 0.5])
//        sphere_base(bump_cir, roundness);
//        
//        translate([0, (peg_h * 2.65 - cube_allowance), -peg_h])
//        translate([0, -(bump_cor) , bump_cor * 0.5])
//        cube_base(bump_cor * 2, (bump_cor + peg_h * 2), bump_cor * 0.65);
//        
//        translate([0, (peg_h * 2.65 - cube_allowance), - peg_h])
//        difference()
//        {   
//            cylinder_base(bump_or + 10, bump_h * 2, roundness);
//            scale(bump_os)
//            cylinder_base(bump_or, bump_h * 2, roundness);
//        }
//    }
        
}


module bump_center_b()
{
    bump_or = 60 + 3 + peg_h;
    bump_ir = bump_or - 3;
    bump_os = [1, 40/120, 1];
    bump_is = [1.035, 40/120, 1];
    bump_h  = 20;
    
    bump_cor = 10;
    bump_cir = bump_cor - 3;


    difference()
    {
        scale(bump_os)
        cylinder_base(bump_or, bump_h, roundness);
        scale(bump_is)
        cylinder_base(bump_ir, bump_h + cube_allowance, roundness);
        
        translate([0, bump_or * 20/120, 0])
        cube_base(bump_or * 2, bump_or * 40/120, bump_h + cube_allowance);
        //Chop ends
        cube_base(bump_or * 2.5, bump_or * 0.5 + cube_allowance, bump_h + cube_allowance);
    }
    
    

//    translate([peg_h * -1, (-40/120 * bump_or + peg_h * 0.5 + 1), -(bump_h - peg_h)/2])
    translate([0, (-40/120 * bump_or + peg_h * 0.5 + 1), -peg_h * 1.75])
    rotate([90, 90, 0])
    difference()
    {   
        translate([0, 0, -peg_h * 0.75])
        cube_rounded(peg_h * 3, peg_h, peg_h * 2.5, peg_h);
        for(x = [-1:1])
        {
            translate([peg_h * x - peg_h * 0.0, 0, -peg_h * 0.75])
            scale([1, 1, (peg_h * 2.5 + cube_allowance)/peg_h])
            peg();
        }  
        
    }
    
    rotate([0, -90, 180])
    translate([-bump_or * 0.59 , 61, 0])
    rotate([0, 0, 133])
    difference()
    {
        scale(bump_os)
        cylinder_base(bump_or + 2, bump_h, roundness);
        scale(bump_is)
        cylinder_base(bump_ir, bump_h + cube_allowance, roundness);
        
        translate([0, bump_or * 20/120 + 5, 0])
        cube_base(bump_or * 2 + 4, (bump_or + 2) * 40/120, bump_h + cube_allowance);
//        bump();
        translate([peg_h * 0.80, -peg_h * 0.75, 0])
        cube_base(bump_or * 1.95, (bump_or + 2) * 0.5 + cube_allowance, bump_h + cube_allowance);

    }
    
//    translate([0, -(peg_h * 2.65 - cube_allowance), peg_h])
//    difference()
//    {
//        scale([1, (bump_cor + peg_h)/bump_cor, 0.5])
//        sphere_base(bump_cor, roundness);
//        scale([1, (bump_cor + peg_h)/bump_cor, 0.5])
//        sphere_base(bump_cir, roundness);
//        
//        translate([0, (peg_h * 2.65 - cube_allowance), -peg_h])
//        translate([0, -(bump_cor) , bump_cor * 0.5])
//        cube_base(bump_cor * 2, (bump_cor + peg_h * 2), bump_cor * 0.65);
//        
//        translate([0, (peg_h * 2.65 - cube_allowance), - peg_h])
//        difference()
//        {   
//            cylinder_base(bump_or + 10, bump_h * 2, roundness);
//            scale(bump_os)
//            cylinder_base(bump_or, bump_h * 2, roundness);
//        }
//    }
        
}

bump_or = 60;
bump_ir = bump_or - 3;
bump_os = [1, 40/120, 1];
bump_is = [1.035, 40/120, 1];
bump_h  = 20;


//translate([-peg_h * 2, 0, 0])
bump(bump_or, bump_ir, bump_os, bump_is, bump_h);//bump();
//translate([peg_h * 2, 0, 0])
//rotate([180, 180, 0])
//mirror([0, 1, 0])
//bump(bump_or, bump_ir, bump_os, bump_is, bump_h);//bump();

//bump_center();
//color("red")
//bump_center_b();
//translate([0, 0, fitec_z * 0.5])
//tire();

//bump_or = 60;
//    bump_ir = bump_or - 3;
//    bump_os = [1, 40/120, 1];
//    bump_is = [1.035, 40/120, 1];
//    bump_h  = 20;

//bump_or = 30;
//bump_ir = bump_or - 2;
//bump_os = [1, 100/120, 1];
//bump_is = [1, 100/120, 1];
//bump_h  = fitec_z;

//translate([0, -(peg_h * 2), 0])
//bump(bump_or, bump_ir, bump_os, bump_is, bump_h);
//translate([0, fitec_wing_x - bump_ir * 0.5 - peg_h, 0])
//mirror([0, 1, 0])
//bump(bump_or, bump_ir, bump_os, bump_is, bump_h);
//
//difference()
//{
//    rotate([90, 0, 0])
//    //translate([-fitec_offset, 0, 0])
//    servo_deck();
//
//    peg_grid(9, 5, 10);
//    rotate([0, 90, 0])
//    peg_grid(3, 5, 20);
//}

//peg_grid(6, 4);
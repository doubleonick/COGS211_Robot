include<foundational_modules.scad>
include<variables.scad>
/***************************************************************************/

kipr_x     = 140;//105;
kipr_y     = 127;//105;
kipr_z     = 10; // Does this meet clearance for the on/off switch?
kipr_r     = 10;
kipr_floor = 3;
kipr_lip   = 20;
usb_y      = 60;
plug_x     = 6 * 2;
plug_y     = kipr_x - peg_h;

module fitec_cutout(base_x, base_y, base_z, wing_x, wing_y, wing_z, top_x, top_y, top_z, solo)
{
    translate([0, 0, base_z + wing_z * 0.5])
    {   
//        //Channel for wire
//        translate([0, fitec_wing_y * 0.25, 0])
//        scale([(kipr_y * 0.5 - peg_h * 2)/fitec_wing_y, 0.5, 1])
//        cube_base(fitec_wing_x, fitec_wing_y, fitec_wing_z);
        //Fitec Wing
        cube_base(wing_x, wing_y, wing_z);
        translate([0, 0, (wing_z + top_z) * 0.5])
        cube_base(top_x, top_y, top_z);
        translate([0, 0, -(wing_z + base_z) * 0.5])
        cube_base(base_x, base_y, base_z);
        translate([wing_x/2 - 2, 0, wing_z])
        cylinder_base(2, wing_z, roundness);
        translate([-(wing_x/2 - 2), 0, wing_z])
        cylinder_base(2, wing_z, roundness);
        translate([wing_x/2 - 2, 0, 0])
        cylinder_base(1, base_z, roundness);
        translate([-(wing_x/2 - 2), 0, 0])
        cylinder_base(1, base_z, roundness);


    }    
    if(solo == 0)
    {
        //Cable space can be subtracted out on either side... channel for sliding wire down.
        translate([0, 0, base_z * 0.5 - 4])
        cube_base(wing_x * 2 - peg_h * 4, base_y, base_z * 1);
    }
}

/***************************************************************************/


/***************************************************************************/
/***************************************************************************/
module peg()
{
    cylinder_base(peg_r, peg_h, roundness);
}
/***************************************************************************/ 
module tiny_screen_module()
{
    //Tiny Screen module
    difference()
    {
        //Core frame and lip for TinyScreen mounting (need switch access)
        cube_base(motor_deck_x - peg_h * 4, battery_y, peg_h * 1);
        
        //Allow stack adapter to sit in a hollow (bottom)
        translate([0, 5, 0])
        {
//            cube_rounded(tiny_screen_x - 3, tiny_screen_y - 6, peg_h + cube_allowance, peg_r);
            cube_rounded(tiny_stack_xy - 6, tiny_stack_xy - 6, peg_h + cube_allowance, peg_r);
                    
            for(x = [-1, 1])
            {
                for(y = [-1, 1])
                {
                    translate([tiny_mount_xd * 0.5 * x, tiny_mount_xd * 0.50 * y, (motor_deck_y - peg_h * 1.25) * 0.0])
                    cylinder_base(tiny_mount_r, peg_h  + tiny_screen_z * 2 + cube_allowance, roundness);
                }
                
            }
        }
        
    }
    
}
/***************************************************************************/
module electronics_deck()
{
    //translate([0, 0, motor_deck_z * 0.75 + peg_h * 1])
    
    difference()
    {
//        cube_rounded_full(motor_deck_x, motor_deck_y, peg_h * 2, peg_r);
                cube_rounded_full(battery_x + peg_h * 2, battery_y + peg_h * 2, battery_z + peg_h, peg_r);

//        cube_rounded_full(battery_x + peg_h, battery_y + peg_h * 2, battery_z + peg_h, peg_r);
        cube_rounded(motor_deck_x - peg_h * 2, motor_deck_y - peg_h * 2, peg_h * 2 + cube_allowance, peg_r);
        
        //battery pack access
        translate([-peg_h * 0.5, 0, peg_h * 0.5])
        cube_base(battery_x + peg_r * 2 + cube_allowance, battery_y + peg_r * 2 + cube_allowance, peg_h + cube_allowance);
        
        //Wire Through Holes
        translate([peg_h * 1.5, 0, peg_h * 0.5])
        cube_base(peg_h * 2, motor_deck_y + cube_allowance, peg_h);
        
        //Interface pegs
        for(x = [-1, 1])
        {
            for(y = [-1:1])
            {
                for(z = [-0.5, 0.5])
                {
                    translate([(motor_deck_x - peg_h) * 0.50 * x, peg_h * y, peg_h * z])
                    rotate([0, 90, 0])
                    cylinder_base(peg_r, peg_h + cube_allowance, roundness);            
                }
            }
        }
        //Interface pegs
        for(x = [-2:2])
        {
            for(y = [-1,1])
            {
                for(z = [-0.5, 0.5])
                {
                    translate([peg_h * x, (motor_deck_y - peg_h) * 0.50 * y, peg_h * z])
                    rotate([90, 0, 0])
                    cylinder_base(peg_r, peg_h + cube_allowance, roundness);
                }               
            }
        }
        
        //MODULE JOINS
        for(theta_x = [90])
        {
            //Pegs for joining modules
            rotate([theta_x, 0, 0])
            for(x = [-1, 1])
            {
                for(y = [-1, 1])
                {
                    rotate([-theta_x, 0, 0])
                    translate([(motor_deck_x * 0.5 - peg_r - 2) * x, (motor_deck_y * 0.5 - peg_r - 2) * y, 0])
                    cylinder_base(peg_r, peg_h * 2 + cube_allowance, roundness);
                    
                }
                
            }
        }
    }
    translate([0, 0, -peg_h * 0.5])
    tiny_screen_module();
}

module electronics_insert()
{

 //   translate([0, 0, (kipr_z + kipr_floor + 0.01 + peg_h)/2])
    {
        difference()
        {
            tiny_screen_module();
    //        for(y = [-2])
    //        {
    //            for(x = [-1:1])
    //            {
    //                translate([peg_h * x, peg_h * y, 0])
    //                peg();
    //            }
    //        }
        }
        difference()
        {
            cube_rounded(fitec_wing_x + 4, battery_x + (wheel_gap + wheel_h) * 2, peg_h, peg_h);
            cube_base(motor_deck_x - peg_h * 4, battery_y, peg_h + 1);
            
    //        //wheel well... seems not to do anything, but also seems to be in the right place.
    //        rotate([90, 0, 0])
    //        translate([-fitec_offset, -((fitec_base_y + 2)/2 + battery_z + 4 + peg_h/2), 0])
    //        cylinder_base(21, wheel_z, roundness);
            rotate([90, 0, 0])
            translate([-fitec_offset, -((fitec_base_y + 2)/2 + battery_z + 4 + peg_h/2), (fitec_z - fitec_top_z/2 + 2) + wheel_gap ])
            cylinder_base(20 + cube_allowance, 7 + cube_allowance * 2, roundness);
            mirror([0, 1, 0])
            {
                rotate([90, 0, 0])
                translate([-fitec_offset, -((fitec_base_y + 2)/2 + battery_z + 4 + peg_h/2), (fitec_z - fitec_top_z/2 + 2) + wheel_gap ])
                cylinder_base(20 + cube_allowance, 7 + cube_allowance * 2, roundness);
            }
            
            for(y = [-4, -3, -2, 3, 4])
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

wall_thickness = 6;

difference()
{
    cube_base(kipr_x, kipr_y, peg_h);

    translate([0, (kipr_y + cube_allowance)/2, 0])
    cylinder_base(kipr_y/2 - peg_h * 4, (kipr_z + kipr_floor + 0.01), roundness);
    translate([0, -(kipr_y + cube_allowance)/2, 0])
    cylinder_base(kipr_y/2 - peg_h * 4, (kipr_z + kipr_floor + 0.01), roundness);

    translate([(kipr_x + cube_allowance)/2, 0, 0])
    cylinder_base(kipr_y/2 - peg_h * 4, (kipr_z + kipr_floor + 0.01), roundness);
    translate([-(kipr_x + cube_allowance)/2, 0, 0])
    cylinder_base(kipr_y/2 - peg_h * 4, (kipr_z + kipr_floor + 0.01), roundness);
    
    cube_base(motor_deck_x - peg_h * 4, battery_y, peg_h + cube_allowance);
    
    rotate([0, 0, 90])
    translate([0, (battery_y/2 + battery_z + wall_thickness), 0])
    cube_rounded(battery_x + wall_thickness, battery_z + wall_thickness, battery_y + wall_thickness, peg_h);
    
    for(x = [2:4])
    {
        for(y = [-4:4])
        {
            translate([peg_h * x, peg_h * y, 0])
            scale([1, 1, 1.1])
            peg();
        }
    }

    for(x = [5:8])
    {
        for(y = [-7, -6, -5, 5, 6, 7])
        {
            translate([peg_h * x, peg_h * y, 0])
            scale([1, 1, 1.1])
            peg();
        }
    }
    
    for(x = [-8:-5])
    {
        for(y = [-7, -6, -5, 5, 6, 7])
        {
            translate([peg_h * x, peg_h * y, 0])
            scale([1, 1, 1.1])
            peg();
        }
    }
}


translate([0, 0, (battery_y + wall_thickness - peg_h)/2])
rotate([0, 0, 90])
translate([0, (battery_y/2 + battery_z + wall_thickness), 0])
difference()
{
    cube_rounded(battery_x + wall_thickness, battery_z + wall_thickness, battery_y + wall_thickness, peg_h);
    translate([0, 0, wall_thickness/2])
    cube_base(battery_x, battery_z, battery_y);
}

electronics_insert();
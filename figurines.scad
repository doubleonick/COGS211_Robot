include<foundational_modules.scad>

//nb_scale = 0.65;//[0.30, 0.30, 0.25];
notch_scale = 0.75;

head_r = 14;
body_h = 60;//80;
bum_r  = 24;

hat_brim_r = 24;//17;
hat_brim_h = 6;//7;
hat_top_r  = 0;
hat_top_h  = body_h;

beard_r    = 17;
beard_z    = body_h * 0.7;

nose_r  = head_r * 0.85;
nose_rz = nose_r * 0.6;

heel_r = 10;
toe_r  = 16;
foot_l = 22;

//shoulder_r  = 10;
//upper_arm_r = 6;
//upper_arm_l = body_h * 0.25;
//
//elbow_r  = 10;
//lower_arm_r = 6;
//lower_arm_l = body_h * 0.25;
//
//hand_r = elbow_r * 1.25;
//hand_rx = hand_r * 0.8;
//hand_rz = lower_arm_r + cube_allowance;
//
//thumb_r = hand_r * 0.34;
//thumb_rx = thumb_r * 0.8;
//thumb_rz = hand_rz;

peg_r = 4;
peg_h = 20;

nut_or = 7.5;//8;
nut_ir = 4;
nut_z  = 6 + cube_allowance;

bolt_head_r = 8.75 + rad_allowance;
bolt_head_z = 8 + cube_allowance;
bolt_shaft_f_r = 4 + rad_allowance * 2;
bolt_shaft_f_z = 60;
shaft_fudge_z = 20;


module peg()
{
    cylinder_base(peg_r, peg_h, roundness);
}

module nut_and_bolt()
{
    //Shaft
    translate([0, 0, shaft_fudge_z * 0.5])
    cylinder_base(bolt_shaft_f_r, bolt_shaft_f_z  + shaft_fudge_z, roundness);
    translate([0, 0, (bolt_shaft_f_z - nut_z) * 0.5])
    cylinder_base(nut_or, nut_z, 6);
    translate([0, 0, -(bolt_shaft_f_z + bolt_head_z) * 0.5])
    cylinder_base(bolt_head_r, bolt_head_z, roundness);
}

module beard()
{
    difference()
    {
        union()
        {
            sphere_base(beard_r, roundness);
//            translate([0, beard_r * 0.86, -beard_z * 0.45])
//            rotate([33, 0, 0])
//            scale([0.95, 0.75, 1])
//            difference()
//            {
//                cone_base(0, beard_r, beard_z, roundness);
//                translate([0, -5, 0])
//                cone_base(0, beard_r, beard_z, roundness);
//            }
        }
//        translate([0, 0, (beard_r * 2)])
////        scale([1 + rad_allowance, 1 + rad_allowance, 1])
//        hat();
        
        sphere_base(head_r + rad_allowance, roundness);
        
        translate([0, head_r, 0])
        scale(1 + rad_allowance)
        nose();
        scale([1, 1 + cube_allowance, 1 + rad_allowance])
        ears();
        translate([0, 0, ((bolt_shaft_f_z + hat_top_h) * 0.5 - nut_z - beard_r * 2) * -1])
//        scale([1.01, 1 + rad_allowance, 1])
        body();

//        translate([0, 0, -shaft_fudge_z + cube_allowance])
//        nut_and_bolt();   
    }
    
}

module hair_negatives()
{
    translate([0, 0, (beard_r * 2)])
    hat();
    
    sphere_base(head_r + rad_allowance, roundness);
    
    translate([0, head_r, 0])
    scale(1 + rad_allowance)
    nose();
    scale([1, 1 + cube_allowance, 1 + rad_allowance])
    ears();
    translate([0, 0, -shaft_fudge_z + cube_allowance])
    nut_and_bolt();
}

braid_link_r = 2.75;
braid_link_z = 8;

module bow()
{
    bow_knot_r   = 4;
    bow_z        = 6;
    
    scale([1, 0.75, 1])
    sphere_base(bow_knot_r, roundness);

    rotate([0, 105, 0])
    translate([0, 0, -bow_z])
    scale([1, 0.25, 1])
    cone_base(bow_knot_r, bow_knot_r * 0.5, bow_z, roundness);
    rotate([0, 15, 0])
    translate([-bow_z * 1.5, 0, 0])
    scale([0.25, 0.25, 1])
    sphere_base(bow_knot_r, roundness);
    
    rotate([0, -105, 0])
    translate([0, 0, -bow_z])
    scale([1, 0.25, 1])
    cone_base(bow_knot_r, bow_knot_r * 0.5, bow_z, roundness);
    rotate([0, -15, 0])
    translate([bow_z * 1.5, 0, 0])
    scale([0.25, 0.25, 1])
    sphere_base(bow_knot_r, roundness);
    
    rotate([0, 30, 0])
    translate([0, 0, -bow_z * 1])
    cube_rounded_full(bow_knot_r * 1.25, bow_z * 0.25, bow_z * 2, bow_z * 0.25);
    
    rotate([0, -30, 0])
    translate([0, 0, -bow_z * 1])
    cube_rounded_full(bow_knot_r * 1.25, bow_z * 0.25, bow_z * 2, bow_z * 0.25);
}

module braid_link_a()
{
    
        
        translate([0, 0, -braid_link_z * 2.25])
//        for(z = [-2:2:2])
//        {
            translate([0, -beard_r, braid_link_z])// * z])
            {
                translate([braid_link_r * 0.5, 0, 0])
                rotate([-5, 5, 0])
                scale([1, 1, braid_link_z/braid_link_r])
                sphere_base(braid_link_r, roundness);
                translate([-braid_link_r * 0.5, 0, 0])
                rotate([5, -5, 0])
                scale([1, 1, braid_link_z/braid_link_r])
                sphere_base(braid_link_r, roundness);
            }
//        }
}
module braid_link_b()
{
    translate([0, 0, -braid_link_z * 2.25])
    {
//        for(z = [-1:2:1])
//        {
            translate([0, -beard_r, braid_link_z])// * z])
            {
                translate([braid_link_r * 0.5, 0, 0])
                rotate([5, 5, 0])
                scale([1, 1, braid_link_z/braid_link_r])
                sphere_base(braid_link_r, roundness);
                translate([-braid_link_r * 0.5, 0, 0])
                rotate([-5, -5, 0])
                scale([1, 1, braid_link_z/braid_link_r])
                sphere_base(braid_link_r, roundness);
            }
        }
//    }
    
}

module braid()
{  
    
    difference()
    {
        union()
        {
//            sphere_base(beard_r, roundness);
            
            for(x = [-1])
            {
                rotate([-15, 0, 114 * x])
                for(z = [-1:2:1])
                {
                    translate([0, 0, braid_link_z * z])
                    import("C:/Users/Doubl/OneDrive/Documents/OpenSCAD/Projects/gnome/gnome_simple_v2/gnome_simple_braid_link_v2.stl", convexity = 3);
                }
                rotate([-15, 0, 114 * x])
                for(z = [-2:2:2])
                {
                    import("C:/Users/Doubl/OneDrive/Documents/OpenSCAD/Projects/gnome/gnome_simple_v2/gnome_simple_braid_link_v2.stl", convexity = 3);
                }
            
            
//                //BOWs
//                rotate([-15, 0, 114 * x])
//                translate([0, 0, -braid_link_z * 3])
//                translate([0, -beard_r, braid_link_z * 0])
//                {
//    //                bow();
//                    import("C:/Users/Doubl/OneDrive/Documents/OpenSCAD/Projects/gnome/gnome_simple_v2/gnome_simple_bow_v2.stl", convexity = 3);
//                    translate([0, 0, -braid_link_z])
//                    scale([1, 0.75, 1.5])
//                    sphere_base(braid_link_r, roundness);
//                }
            }
//            translate([0, beard_r * 0.86, -beard_z * 0.45])
//            rotate([33, 0, 0])
//            scale([0.95, 0.75, 1])
//            difference()
//            {
//                cone_base(0, beard_r, beard_z, roundness);
//                translate([0, -5, 0])
//                cone_base(0, beard_r, beard_z, roundness);
//            }
        }
//        import("C:/Users/Doubl/OneDrive/Documents/OpenSCAD/Projects/gnome/gnome_simple_v2/gnome_simple_hair_negatives_v2.stl", convexity = 3);
//        hair_negatives();   
    }
    
    
    
}


module nose()
{   
    scale([1, 1, nose_rz/nose_r])
    sphere_base(nose_r, roundness);
}

module pants()
{
//    difference()
//    {
//        union()
//        {
//            translate([12, 0, -(body_h * 1 + foot_l * 0.60)])
//            feet();
//            mirror([1, 0, 0])
//            translate([12, 0, -(body_h * 1 + foot_l * 0.60)])
//            feet();
//        }
//        body();
//    
//        //Smooth bottoms of feed for rocking ability
//        //Maybe do the equivalent of this directly to each foot of feet()?
//        translate([0, 0, -(body_h * 1 + foot_l * 0)])
//        scale([1, 1.25, 0.6])
//        difference()
//        {
//            sphere_base(bum_r + 30, roundness);
//            sphere_base(bum_r + 6, roundness);
//            translate([0, 0, (bum_r + 12)/2])
//            cube_base(bum_r * 2.5, bum_r * 2.5, bum_r + 12);
//        }    
//    }
    
    
    
//    translate([0, 0, -body_h + bum_r - 2])
    translate([0, 0, -body_h * 0.75 * 0.5])
    difference()
    {
        sphere_base(bum_r, roundness);
        translate([0, 0, bum_r * 0.5])
        cube_base(bum_r * 2.5, bum_r * 2.5, bum_r);
//        translate([0, 0, -shaft_fudge_z + cube_allowance])
        
//        translate([0, 0, body_h * 0.75 * 0.5])
//        nut_and_bolt();
//        translate([0, 0, -(bolt_shaft_f_z - bolt_head_z * 2) * 0.5])
//        scale([1, 1, 2])
//        cylinder_base(bolt_head_r, bolt_head_z, roundness);
        
//        translate([0, 0, -(-body_h + bum_r - 2)])
//        body();//cone_base(bum_r, head_r, body_h, roundness);
    }
//    translate([0, 0, -body_h * 0.75 * 0.5])
//    translate([0, 0, -shaft_fudge_z + cube_allowance])
//    nut_and_bolt();
    
//    translate([0, 0, -(body_h * 0.5 + bum_r - peg_h * 0.5)])
//    peg();
}


module hat()
{
//    hat_thickness = 8;
    hat_base_r = 17;
    
    difference()
    {
        union()
        {
            cone_base(hat_base_r, hat_top_r, hat_top_h, roundness);
//            translate([0, 0, -(hat_top_h - hat_brim_h) * 0.5 - hat_brim_h * 0.15])
//            hat_brim();
            translate([0, 0, -(hat_top_h * 0.37 + rad_allowance * 1.20)])
            cone_base(hat_brim_r, hat_brim_r * 0.25, hat_top_h * 0.25, roundness);
//            translate([0, 0, -hat_top_h * 0.5 + hat_brim_h * 0.25])
//            cylinder_base(hat_brim_r, hat_brim_h/2, roundness);
        }
//        translate([0, 0, -bolt_shaft_f_z + nut_z])
//        nut_and_bolt();
    }
    
}

module ears()
{
    rotate([90, 0, 0])
    scale([1.5, 0.66, 1])
    cylinder_base(head_r, 4, roundness);
}

module head()
{
    difference()
    {
        union()
        {
            sphere_base(head_r, roundness);
            translate([0, head_r, 0])
            nose();
            ears();
        }
//        translate([0, 0, (beard_r * 2)])
//        hat();
//        translate([0, 0, -shaft_fudge_z + cube_allowance])
//        nut_and_bolt();
    }
    
}

module body()
{
    difference()
    {
        translate([0, 0, 0])
        cone_base(bum_r, head_r * 0.75, body_h * 0.75, roundness);
        
//        translate([0, 0, -shaft_fudge_z + cube_allowance])
//        nut_and_bolt();
        
//        translate([0, 0, (bolt_shaft_f_z + hat_top_h) * 0.5 - nut_z - beard_r * 2])
//        sphere_base(beard_r + rad_allowance, roundness);
//        translate([0, 0, -bolt_shaft_f_z * 0.5 + nut_z * 0.5])
//        nut_and_bolt();
    }
}

module feet()
{
    rotate([90, 0, 0])
    scale([1, 0.7, 1])
    {
        cone_base(toe_r, heel_r, foot_l, roundness);
        translate([0, 0, foot_l * 0.5])
        sphere_base(heel_r, roundness);
        translate([0, 0, -foot_l * 0.5])
        sphere_base(toe_r, roundness);
    }
//    translate([-toe_r * 0.2, -heel_r * 0.5, foot_l * 0.5])
//    rotate([0, -15, 0])
//    cylinder_base(foot_l * 0.4, foot_l, roundness);
}

module hat_brim()
{
    //    translate([0, 0, -hat_top_h * 0.5])
    rotate_extrude(convexity = 10, $fn = roundness)
    translate([hat_brim_r, 0, 0])
    circle(r = hat_brim_h * 0.35, $fn = roundness);
}

module wizard_hat()
{
    difference()
    {
        union()
        {
            difference()
            {
                hat();
                translate([0, 0, hat_top_h * 0.5])
                cylinder_base(hat_brim_r * 0.25, hat_top_h * 0.25 + 3, roundness);
            }
            translate([0, 0, hat_top_h * 0.5 - hat_brim_r * 0.25])
            sphere_base(hat_brim_r * 0.25, roundness);
            
            translate([0, 0, hat_top_h * 0.65])
            rotate([130, 0, 0])
            translate([0, -hat_brim_r * 0.40, hat_top_h * 0.40])
            cone_base(hat_brim_r * 0.20, 0, hat_top_h * 0.5, roundness);
        }    
        translate([0, 0, hat_top_h * 0.5 - hat_brim_r * 0.0])
        scale([0.70, 1, 1])
        sphere_base(hat_brim_r * 0.25, roundness);
    }
}

module witch_hat()
{
    difference()
    {
        union()
        {
            difference()
            {
                hat();
                translate([0, 0, hat_top_h * 0.5])
                cylinder_base(hat_brim_r * 0.25, hat_top_h * 0.25 + 3, roundness);
            }
            translate([0, 0, hat_top_h * 0.5 - hat_brim_r * 0.25])
            sphere_base(hat_brim_r * 0.25, roundness);
            
            translate([0, 0, hat_top_h * 0.65])
            rotate([130, 0, 0])
            translate([0, -hat_brim_r * 0.40, hat_top_h * 0.40])
            cone_base(hat_brim_r * 0.20, 0, hat_top_h * 0.5, roundness);
        }    
        translate([0, 0, hat_top_h * 0.5 - hat_brim_r * 0.0])
        scale([0.70, 1, 1])
        sphere_base(hat_brim_r * 0.25, roundness);
    }
    
    translate([0, 0, hat_brim_r * 0.098])
    {
        scale([1, 1.35, 1])
        hat_brim();
        scale([1, 1, 1])
        hat_brim();
    }
}

shoulder_r = head_r * 0.25;
arm_l      = body_h * 0.35;
hand_r     = shoulder_r * 1.5;

module arm()
{
    sphere_base(shoulder_r, roundness);
    translate([0, 0, -(arm_l * 0.5)])
    {
        cone_base(hand_r, shoulder_r, arm_l, roundness);
        translate([0, 0, -(arm_l * 0.5)])
        sphere_base(hand_r, roundness);
    }
}

module belt()
{
    belt_ir = bum_r + rad_allowance;
    belt_or = belt_ir + 2;
    belt_z  = 8;
    buckle_x = 20;
    buckle_y = 10;
    buckle_z = belt_z * 0.5;

    //The Belt
    difference()
    {
        cylinder_base(belt_or, belt_z, roundness);
        cylinder_base(belt_ir, belt_z + cube_allowance, roundness);
        
        for(rz = [-0:11])
        {
            rotate([0, 0, 10 * rz])
            translate([belt_or, 0, 0])
            rotate([0, 90, 0])
            cylinder_base(1, belt_or - belt_ir + cube_allowance, roundness);
        }
    }
    //The Mounting Disk
    difference()
    {
        cylinder_base(belt_ir, belt_z, roundness);
        translate([0, 0, -shaft_fudge_z + cube_allowance])
        nut_and_bolt();
        
        translate([0, 0, belt_z * 0.4])
        cube_base(belt_or * 2.1, belt_or * 2.1, belt_z * 0.5);
        translate([0, 0, -belt_z * 0.4])
        cube_base(belt_or * 2.1, belt_or * 2.1, belt_z * 0.5);
    }
    //The Buckle
    translate([0, bum_r + belt_z * 0.30, 0])
    {
        cube_rounded(buckle_x, buckle_z, buckle_y, belt_z/2);
//        difference()
//        {
//            cube_rounded(buckle_x, buckle_z, buckle_y, belt_z/2);
//            cube_rounded(buckle_x - 2, buckle_z + cube_allowance, buckle_y - 2, belt_z/2);
//        }
        translate([-buckle_x * 0.10, 0, 0])
        rotate([0, 90, ])
        {
//            cone_base(buckle_z/4, 1, buckle_x * 0.65, roundness);
            translate([0, 0, buckle_x * 0.65 * 0.5])
            sphere_base(1, roundness);
        }
        
    }
    
    rotate([0, 0, 130])
    translate([belt_or - 0.12, 0, 0])
    rotate([9.9, 90, 0])
    scale([1, 1.5, 1])
    cylinder_base(belt_z/2, (belt_or - belt_ir) * 0.5, roundness);
}

module z_head()
{
    translate([0, 0, (bolt_shaft_f_z + hat_top_h) * 0.5 - nut_z - beard_r * 2])
    difference()
    {
        union()
        {
            head();
            color("white")
            sphere_base(beard_r, roundness);
        }
        translate([0, 0, head_r * 2])
        cube_base(head_r * 4, head_r * 4, head_r * 3);

    }

    translate([-107.25, -127, 10])
    scale(.98)
    import("C:/Users/nilivingston/Documents/CAD/COGS320_2026/Brain cupcake - brain.stl");
}
/***************************************************************************/
/*****************************Assembly**************************************/
/***************************************************************************/

//color("grey")
//nut_and_bolt();

//scale(1)
//HAT
module hat_full()
{
    hat_top_h = hat_top_h * (2/3);
    top_flop_z = hat_brim_h * 3;
    top_flop_r = 8 + rad_allowance * 0.35;
    rotate([0, 0, 180])
    translate([0, 0, (bolt_shaft_f_z + hat_top_h) * 0.5 - nut_z])
    //scale([1, 1, 0.8])
    color("red")
    {
        
        difference()
        {
            hat();

            translate([0, 0, hat_top_h * 0.65 - top_flop_z/2])//1.5])
    //        cube_base(hat_brim_h * 5, hat_brim_h * 5, hat_brim_h * 10);
            cube_base(hat_brim_h * 5, hat_brim_h * 5, hat_brim_h * 5);
            
            translate([0, 0, hat_top_h * 0.5 - top_flop_z])
            rotate([60, 0, 0])
            translate([0, top_flop_r, 0])
            cylinder_base(0.6 * top_flop_r, top_flop_r * 2, roundness);
        }
        
        translate([0, 0, hat_top_h * 0.5 - top_flop_z])
        difference()
        {   
            sphere_base(top_flop_r, roundness);
            rotate([60, 0, 0])
            translate([0, top_flop_r, 0])
            cylinder_base(0.6 * top_flop_r, top_flop_r * 2, roundness);
        }

        difference()
        {
            translate([0, 0, hat_top_h * 0.5 - top_flop_z])
            rotate([50, 0, 0])
            translate([0, 0, -hat_top_h * 0.33])
            cone_base(0, top_flop_r, hat_top_h * 0.65, roundness);
            
            translate([0, 0, hat_top_h * 0.5 - top_flop_z])
            rotate([60, 0, 0])
            translate([0, top_flop_r, 0])
            cylinder_base(0.6 * top_flop_r, top_flop_r * 3, roundness);
        }
    }
}
//scale(1)
//color("white")
//translate([0, 0, (bolt_shaft_f_z + hat_top_h) * 0.5 - nut_z - beard_r * 2])
//beard();
//translate([0, 0, (bolt_shaft_f_z + hat_top_h) * 0.5 - nut_z - beard_r * 2])
//braid_link_a();
//braid_link_b();

////Aggregate Braids
//difference()
//{
//    union()
//    {
//        sphere_base(beard_r, roundness);
//        braid();
//        mirror([1, 0, 0])
//        braid();
//    }
//    hair_negatives();
//}

module slump_hat()
{
    base_sphere_r = hat_brim_r * 0.75;//8;
    z_translation = [0, 2, 4, 6, 8, 10, 12] * 2.25;

    difference()
    {
        for(z = [0:3])
        {
            translate([z_translation[z]* cos(15 * z), z_translation[z] * sin(15 * z), z_translation[z] * 0])
            {
                sphere_base(base_sphere_r - base_sphere_r * 0.13 * z, roundness);

            }
        }
        translate([- base_sphere_r * 0.5, 0, 0])
        cube_base(base_sphere_r, base_sphere_r * 2, base_sphere_r * 2);
        
        rotate([0, 90, 0])
        translate([0, 0, -(shaft_fudge_z) * 1.2 + cube_allowance])
        translate([0, 0, (bolt_shaft_f_z - nut_z) * 0.5])
    cylinder_base(nut_or, nut_z, 6);
    }

    
        //        nut_and_bolt();

    for(z = [4:6])
    {
        translate([z_translation[z]* cos(15 * z), z_translation[z] * sin(15 * z), z_translation[z] * 0])
        {
            sphere_base(base_sphere_r - base_sphere_r * 0.13 * z, roundness);

        }
    }
}
//bow();
//
//scale(1)
//color("pink")

//translate([0, 0, (bolt_shaft_f_z + hat_top_h) * 0.5 - nut_z - beard_r * 2])
//union()
//{
//    head();
//    color("white")
////    translate([0, 0, (bolt_shaft_f_z + hat_top_h) * 0.5 - nut_z - beard_r * 2])
//    sphere_base(beard_r, roundness);
//}


module fig_full(is_z)
{
    if(is_z)
    {
        z_head();
    }
    else
    {
        translate([0, 0, (bolt_shaft_f_z + hat_top_h) * 0.5 - nut_z - beard_r * 2])
        
        {
            head();
            sphere_base(beard_r, roundness);
        }
    }

    body();
    color("red")
    translate([head_r * 1.1, 0, hand_r])
    rotate([0, -25, 0])
    scale([0.75, 1, 1])
    arm();
    color("red")
    mirror([1, 0, 0])
    translate([head_r * 1.1, 0, hand_r])
    rotate([0, -25, 0])
    scale([0.75, 1, 1])
    arm();
    //PANTS
    scale(1)
    {
        color("blue")
        pants();

        difference()
        {
            color("blue")
            {
                rotate([-5, 15, 0])
                translate([0, 0, -body_h * 0.5 - bum_r * 0.6])
                feet();
                mirror([1, 0, 0])
                rotate([-5, 15, 0])
                translate([0, 0, -body_h * 0.5 - bum_r * 0.6])
                feet();
            }

            difference()
            {
                sphere_base(bolt_shaft_f_z, roundness);
                sphere_base(bolt_shaft_f_z-9, roundness);
                translate([0, 0, bolt_shaft_f_z/2])
            cube_base(bolt_shaft_f_z * 2, bolt_shaft_f_z * 2, bolt_shaft_f_z);
            }
            
        }
    }
}

color("cyan")
difference()
{
    
    fig_full(false);
    color("white")
    rotate([0, 25, 0])
    translate([-bum_r * 2.15, 0, 0])
    cube_base(bum_r * 4, bum_r * 3.5, bolt_shaft_f_z * 2);
}
color("green")
difference()
{
    
    fig_full(true);
    color("white")
    rotate([0, 25, 0])
    translate([bum_r * 1.85, 0, 0])
    cube_base(bum_r * 4, bum_r * 3.5, bolt_shaft_f_z * 2);
}
rotate([0, 0, 45])
color("yellow")
union()
{
    translate([0, 0, -bum_r * 3])
    rotate([0, 90, 0])
    cube_rounded(bum_r * 2, bum_r * 1.0, peg_r, peg_r * 1.5);
    translate([0, 0, -bum_r * 3])
    rotate([0, 90, 0])
    cube_rounded(bum_r * 1.0, bum_r * 2, peg_r, peg_r * 1.5);
}

translate([0, 0, -bum_r * 1.5])
rotate([0, 0, 135])
color("red")
union()
{
    translate([0, 0, -bum_r * 3])
    rotate([0, 90, 0])
    cube_rounded(bum_r * 2, bum_r * 1.0, peg_r, peg_r * 1.5);
    translate([0, 0, -bum_r * 3])
    rotate([0, 90, 0])
    cube_rounded(bum_r * 1.0, bum_r * 2, peg_r, peg_r * 1.5);
}
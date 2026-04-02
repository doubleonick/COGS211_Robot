include<foundational_modules.scad>

peg_h = 8;
peg_r = 2.5;

notch_x = 15 + cube_allowance;
notch_y = 15 + cube_allowance;
notch_z = 2 + cube_allowance;
notch_base_x = 10 + cube_allowance; 
notch_base_y = 10 + cube_allowance;
notch_base_z = 2 - cube_allowance;

adapter_x = peg_h * 3;
adapter_y = peg_h * 3;
adapter_z = peg_h * 3;
adapter_r = peg_h * 0.5;

module peg()
{
    cylinder_base(peg_r, peg_h, roundness);
}

module notch()
{
    cube_base(notch_x, notch_y, notch_z);
    translate([0, 0, (notch_z + notch_base_z) * 0.5])
    cube_base(notch_base_x, notch_y, notch_base_z);
}

module chton()
{
    cube_base(notch_x, notch_y, notch_z - cube_allowance);
    translate([0, 0, (notch_z + notch_base_z) * 0.5])
    cube_base(notch_base_x, notch_y, notch_base_z + cube_allowance);
}

module adapter_base()
{
    cube_rounded_full(adapter_x, adapter_y, adapter_z, adapter_r, roundness);
}

module gripper_adapter()
{
    difference()
    {
        translate([0, 0, adapter_z * 0.5 - notch_z * 0.5])
        adapter_base();
        
        notch();

    }
}

module camera_adapter()
{
    cylinder_base(5.75, 2 + cube_allowance, 6);
    translate([0, 0, (2 + cube_allowance + peg_h)/2])
    peg();
}


module gripper_mount()
{
    difference()
    {
        cube_base(notch_x + 4, notch_y, notch_z + notch_base_z + 2);
        translate([0, 0, (cube_allowance/2)])
        notch();
    }

    translate([0, 0, -(peg_h + notch_base_z/2 - 2)])
    difference()
    {
        
        cube_rounded(peg_h * 3, peg_h * 3, peg_h, peg_h, roundness);
        for(x = [0:1])
        {
            for(y = [-1:1])
            {
                translate([peg_h * x, peg_h * y, 0])
                peg();
            }
        }
        for(y = [-1:1])
        {
            translate([peg_h * -1, peg_h * y, 0])
            rotate([0, 90, 0])
            peg();
        }
    }
}


hinge_x = 6;
hinge_y = 40;
hinge_z = 13;
//NEED A MALE SIDED VERSION OF THIS FOR ATTACHING TO THE ROBOT
//ALSO NEED A VERSION THAT MELDS WITH THE CAMERA MOUNT IN
//COGS211_ER_v3_2026.
//gripper_mount();
//difference()
//{
//    translate([0, 0, hinge_z + 2.5])
//    sphere_base(hinge_y/2 + 2, roundness);
//    cube_base(hinge_x, hinge_y, hinge_z);
//}
//translate([0, 0, 30 + hinge_z/1 + 2])
//{
//    cone_base((hinge_y/2+2), (hinge_y/2+2) * 0.9, 60, roundness); 
//    translate([0, 0, (hinge_y/2+2) * 0.9 * 1.5])
//    sphere_base((hinge_y/2+2) * 0.9, roundness);
//}

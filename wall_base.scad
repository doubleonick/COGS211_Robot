include<foundational_modules.scad>

wall_stand_x = 50;
wall_stand_y = 4.75;
wall_stand_z = 10;
holder_x = wall_stand_x;
holder_y = wall_stand_y + 6;
holder_z = wall_stand_z + 2;
outer_edge = 50;

module wall_segment()
{
    
    difference()
    {
        union()
        {
            translate([0, -holder_y/2, 0])
            cube_base(holder_x, holder_y, holder_z);
            
        

            rotate([0, 90, 0])
            translate([0, 0, -wall_stand_x/2])
            linear_extrude(wall_stand_x)
            polygon([[0, 0], [holder_z, 0], [holder_z, -outer_edge]], [[0, 1, 2]]);
        }
        translate([0, -holder_y/2, 1])
        cube_base(wall_stand_x, wall_stand_y, wall_stand_z);
    }
}

//translate([0, (wall_stand_x + holder_y/2)/2-holder_y/2, 0])
module corner_segment()
{
    difference()
    {
        translate([0, outer_edge/2, 0])
        wall_segment();

        rotate([0, 0, 45])
        translate([-sqrt((outer_edge)^2 * 2)/2, 0, -wall_stand_z + 1])
        //translate([10, 0, 0])
        cube_base(sqrt((outer_edge)^2 * 2), sqrt((outer_edge)^2 * 2), wall_stand_z + 20);
    }
}

module double_segment()
{
    translate([0, outer_edge, 0])
    wall_segment();
    mirror([0, 1, 0])
    wall_segment();
}

module outer_corner()
{
    corner_segment();
    mirror([1, 1, 0])
    corner_segment();
}

module inner_corner()
{

    difference()
    {
        translate([outer_edge/2 - 11, 0, 0])
        wall_segment();

        rotate([0, 0, -45])
        translate([-sqrt((outer_edge)^2 * 2)/2, 0, -wall_stand_z + 1])
        //translate([10, 0, 0])
        cube_base(sqrt((outer_edge)^2 * 2), sqrt((outer_edge)^2 * 2), wall_stand_z + 20);
    }

    rotate([0, 0, -90])
    difference()
    {
        translate([-(outer_edge/2 - 11), 0, 0])
        wall_segment();

        rotate([0, 0, 45])
        translate([sqrt((outer_edge)^2 * 2)/2, 0, -wall_stand_z + 1])
        //translate([10, 0, 0])
        cube_base(sqrt((outer_edge)^2 * 2), sqrt((outer_edge)^2 * 2), wall_stand_z + 20);
    }
}

//inner_corner();
difference()
{
    union()
    {
        translate([0, -outer_edge/2, 0])
        double_segment();
        rotate([0, 0, -90])
        translate([0, outer_edge/2, 0])
        wall_segment();
    }

    translate([0, -(outer_edge/2 - holder_y/2), 1])
    cube_base(wall_stand_x + wall_stand_y * 2, wall_stand_y, wall_stand_z);
    translate([0, (outer_edge/2 - holder_y/2), 1])
    cube_base(wall_stand_x + wall_stand_y * 2, wall_stand_y, wall_stand_z);
    rotate([0, 0, 90])
    {
        translate([0, -(outer_edge/2 - holder_y/2), 1])
        cube_base(wall_stand_x + wall_stand_y * 2, wall_stand_y, wall_stand_z);
//        translate([0, (outer_edge/2 - holder_y/2), 1])
//        cube_base(wall_stand_x + wall_stand_y * 2, wall_stand_y, wall_stand_z);
    }
}

$fn = 100;
nothing = 0.025;

module vespa()
{
    translate([1.5, 75, 0])
    mirror([0, 1, 0])
    import("vespa_repaired.stl", center=true);
}

module vespa_bbox()
{
    cube([45, 76, 20]);
}

module vespa_half()
{
    difference()
    {
        union()
        {
            vespa();
            // Additional support structure
            translate([15, 20, 1.5])
            rotate([0, 0, -45])
            cube([10, 4, 3], center=true);
        }
        mirror([1, 0, 0]) vespa_bbox();
        mirror([0, 0, 1]) vespa_bbox();
    }
}

module vespa_assembled()
{
    rotate([0, -90, 0])
    union()
    {
        translate([0, 0, -nothing])
        vespa_half();
        translate([0, 0, nothing])
        mirror([0, 0, 1])
        vespa_half();
    }
}

vespa_half();
//vespa_assembled();

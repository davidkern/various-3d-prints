// An under-mirror shelf for my camper bathroom.
// Modify and share under GPL version 3 or later.

eps = 0.1;

width = 100;
length = 250;
height = 50;
thickness = 3;
front_radius = 380;
front_height = 30;
back_length = 200;
back_height = 40;

bottom_voronoi_width = 80;
bottom_voronoi_length = 220;


difference() {
    cube([length, width, height]);

    // inside
    translate([thickness, thickness, thickness])
        cube([length - 2*thickness, width - 2*thickness, height - thickness + eps]);

    // front
    translate([length/2, 0, front_radius + front_height])
    rotate([90, 0, 0])
        cylinder(h = 3 * thickness, r = front_radius, center = true, $fa = 5);

    // back
    translate([length/2, width - thickness, back_height])
        cube([back_length, 3*thickness, height], center=true);

    // bottom voronoi
    translate([length/2, width/2, 0])
    intersection() {
        linear_extrude(3 * thickness, center = true)
        random_voronoi(n = 128, nuclei = false, thickness = 3, round = 6, min = 0,
            max = 400, seed = 44, center=true);

        cube([bottom_voronoi_length, bottom_voronoi_width, 3 * thickness], center = true);
    }
}

// Voronoi code below copied from Felipe Sanches' project repo.

// (c)2013 Felipe Sanches <juca@members.fsf.org>
// licensed under the terms of the GNU GPL version 3 (or later)

function normalize(v) = v / (sqrt(v[0] * v[0] + v[1] * v[1]));

//
// The voronoi() function generates a 2D surface, which can be provided to
// a) linear_extrude() to produce a 3D object
// b) intersection() to restrict it to a a specified shape -- see voronoi_polygon.scad
//
// Parameters:
//   points (required) ... nuclei coordinates (array of [x, y] pairs)
//   L                 ... the radius of the "world" (the pattern is built within this circle)
//   thickness         ... the thickness of the lines between cells
//   round             ... the radius applied to corners (fillet in CAD terms)
//   nuclei (bool)     ... show nuclei sites
//
// These parameters need to be kept more or less in proportion to each other, and to the distance
// apart of points in the point_set. If one or the other parameter is increased or decreased too
// much, you'll get no output.
//
module voronoi(points, L = 200, thickness = 1, round = 6, nuclei = true) {
	for (p = points) {
		difference() {
			minkowski() {
				intersection_for(p1 = points){
					if (p != p1) {
						angle = 90 + atan2(p[1] - p1[1], p[0] - p1[0]);

						translate((p + p1) / 2 - normalize(p1 - p) * (thickness + round))
						rotate([0, 0, angle])
						translate([-L, -L])
						square([2 * L, L]);
					}
				}
				circle(r = round, $fn = 20);
			}
			if (nuclei)
				translate(p) circle(r = 1, $fn = 20);
		}
	}
}

module random_voronoi(n = 20, nuclei = true, L = 200, thickness = 1, round = 6, min = 0, max = 100, seed = undef, center = false) {
	seed = seed == undef ? rands(0, 100, 1)[0] : seed;
	echo("Seed", seed);

	// Generate points.
	x = rands(min, max, n, seed);
	y = rands(min, max, n, seed + 1);
	points = [ for (i = [0 : n - 1]) [x[i], y[i]] ];
        
	// Center Voronoi.
	offset_x = center ? -(max(x) - min(x)) / 2 : 0;
	offset_y = center ? -(max(y) - min(y)) / 2 : 0;
	translate([offset_x, offset_y])
    
	voronoi(points, L = L, thickness = thickness, round = round, nuclei = nuclei);
}

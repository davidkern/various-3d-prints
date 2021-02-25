eps = 0.001;

// element visiblity
ENABLE_BP = true;
ENABLE_IO = true;
ENABLE_GPU = true;

// colors
BP_COLOR = "DarkGreen";
BP_OPACITY = 0.3;
IO_COLOR = "DarkGreen";
IO_OPACITY = 0.3;
GPU_COLOR = "Black";
GPU_OPACITY = 0.3;

/****************************************************
 * Backplane
 ****************************************************/
 
// dimensions
BP_x0 = 196;
BP_x1 = 205;
BP_y0 = 13;
BP_y1 = 39;
BP_HOLE_DIAMETER = 2.9;
BP_THICKNESS = 1.6;

// holes
HOLE_A = [5, 32];
HOLE_B = [5, 20];
HOLE_C = [5, 5];
HOLE_D = [67, 32];
HOLE_E = [77, 5];
HOLE_F = [199, 32];
HOLE_G = [199, 20];
HOLE_H = [190, 5];

// points
p0 = [0, 0];
p1 = [0, BP_y1];
p6 = [BP_x1, BP_y1];
p7 = [BP_x1, BP_y0];
p8 = [BP_x0, BP_y0];
p9 = [BP_x0, 0];

module bp_hole(center) {
    translate(center) circle(d=BP_HOLE_DIAMETER);
}

if(ENABLE_BP)
color(BP_COLOR, BP_OPACITY)
linear_extrude(BP_THICKNESS)
difference() {
    polygon([p0, p1, p6, p7, p8, p9]);
    bp_hole(HOLE_A);
    bp_hole(HOLE_B);
    bp_hole(HOLE_C);
    bp_hole(HOLE_D);
    bp_hole(HOLE_E);
    bp_hole(HOLE_F);
    bp_hole(HOLE_G);
    bp_hole(HOLE_H);    
}

/****************************************************
 * I/O Board
 ****************************************************/

// dimensions
IO_ORIGIN = [236, 9, -10];
IO_ROTATION = [90, 0, 180];
IO_x0 = 39;
IO_x1 = 47;
IO_x2 = 53;
IO_x3 = 55;
IO_x4 = 108;
IO_x5 = 133;
IO_y0 = 15;
IO_y1 = 20;
IO_y2 = 28;
IO_y3 = 59;
IO_y4 = 126;
IO_HOLE_DIAMETER = 2.9;
IO_THICKNESS = 1.6;

// holes
HOLE_I = [19, 5];
HOLE_J = [16, 38];
HOLE_K = [11, 122];

// points
p10 = [0, 0];
p11 = [0, IO_y4];
p12 = [IO_x1, IO_y4];
p13 = [IO_x1, IO_y3];
p14 = [IO_x5, IO_y3];
p15 = [IO_x5, IO_y2];
p16 = [IO_x4, IO_y2];
p17 = [IO_x4, IO_y0];
p18 = [IO_x3, IO_y0];
p19 = [IO_x3, IO_y2];
p20 = [IO_x2, IO_y2];
p21 = [IO_x2, IO_y1];
p22 = [IO_x0, IO_y1];
p23 = [IO_x0, 0];

module io_hole(center) {
    translate(center) circle(d=IO_HOLE_DIAMETER);
}

if(ENABLE_IO)
    color(IO_COLOR, IO_OPACITY)
    translate(IO_ORIGIN)
    rotate(IO_ROTATION)
    linear_extrude(IO_THICKNESS, center=true)
    difference() {
        polygon([
            p10, p11, p12, p13,
            p14, p15, p16, p17,
            p18, p19, p20, p21,
            p22, p23]);
        io_hole(HOLE_I);
        io_hole(HOLE_J);
        io_hole(HOLE_K);
    }

/****************************************************
 * GPU
 ****************************************************/

// dimensions
GPU_ORIGIN = [236, 23, 4.5];
GPU_ROTATION = [90, 0, 180];
GPU_x0 = 17;
GPU_x1 = 32;
GPU_x2 = 141;
GPU_x3 = 265;
GPU_y0 = 13;
GPU_y1 = 112;
GPU_BOARD_THICKNESS = 1.6;
GPU_BACKPLATE_THICKNESS = 3;
GPU_BACKPLATE_OFFSET = GPU_BOARD_THICKNESS/2 + GPU_BACKPLATE_THICKNESS - eps;
GPU_BRACKET_THICKNESS = 1;
GPU_BRACKET_ROTATION = [0, 90, 0];
GPU_BRACKET_TRANSLATION = [-eps, -15, 37];

GPU_BKT_x0 = 4;
GPU_BKT_x1 = 14;
GPU_BKT_x2 = 19;
GPU_BKT_x3 = 24;
GPU_BKT_x4 = 34;
GPU_BKT_x5 = 37;
GPU_BKT_x6 = 39;
GPU_BKT_y0 = 7;
GPU_BKT_y1 = 11;
GPU_BKT_y2 = 20;
GPU_BKT_y3 = 113;
GPU_BKT_y4 = 121;

// points
p24 = [0, 0];
p25 = [0, GPU_y1];
p26 = [GPU_x3, GPU_y1];
p27 = [GPU_x3, GPU_y0];
p28 = [GPU_x2, GPU_y0];
p29 = [GPU_x2, 0];
p30 = [GPU_x1, 0];
p31 = [GPU_x1, GPU_y0];
p32 = [GPU_x0, GPU_y0];
p33 = [GPU_x0, 0];
p34 = [0, GPU_y0];

p35 = [0, GPU_BKT_y1];
p36 = [0, GPU_BKT_y4];
//p37 = [GPU_BKT_x, GPU_BKT_y];
//p38 = [GPU_BKT_x, GPU_BKT_y];
p39 = [GPU_BKT_x5, GPU_BKT_y4];
p39a = [GPU_BKT_x5, GPU_BKT_y3];
p39b = [GPU_BKT_x6, GPU_BKT_y3];
p40 = [GPU_BKT_x6, GPU_BKT_y2];
p41 = [GPU_BKT_x5, GPU_BKT_y2];
p42 = [GPU_BKT_x5, GPU_BKT_y1];
p43 = [GPU_BKT_x4, GPU_BKT_y0];
p44 = [GPU_BKT_x4, 0];
p45 = [GPU_BKT_x3, 0];
p46 = [GPU_BKT_x3, GPU_BKT_y0];
p47 = [GPU_BKT_x2, GPU_BKT_y1];
p48 = [GPU_BKT_x1, GPU_BKT_y0];
p49 = [GPU_BKT_x1, 0];
p50 = [GPU_BKT_x0, 0];
p51 = [GPU_BKT_x0, GPU_BKT_y0];

module gpu_card() {
    linear_extrude(GPU_BOARD_THICKNESS, center=true)
    polygon([
        p24, p25, p26, p27,
        p28, p29, p30, p31,
        p32, p33]);
}

module gpu_backplate() {
    linear_extrude(GPU_BACKPLATE_THICKNESS)
    polygon([
        p34, p25, p26, p27]);
}

module gpu_bracket() {
    translate(GPU_BRACKET_TRANSLATION)
    rotate(GPU_BRACKET_ROTATION)
    linear_extrude(GPU_BRACKET_THICKNESS)
    polygon([
        p35, p36, p39, p39a,
        p39b, p40, p41, p42,
        p43, p44, p45, p46,
        p47, p48, p49, p50,
        p51
    ]);
}
    
if(ENABLE_GPU)
    color(GPU_COLOR, GPU_OPACITY)
    translate(GPU_ORIGIN)
    rotate(GPU_ROTATION)
    union() {
        gpu_card();
        translate([0, 0, -GPU_BACKPLATE_OFFSET]) gpu_backplate();
        gpu_bracket();
    }

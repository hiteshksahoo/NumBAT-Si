// Template mesh geometry file for a single suspended inclusion.
// Inclusion can be circular/elliptical (default), or square/rectangular.

d = 1; // grating period
d_in_nm = 100;
dy_in_nm = 50;
dy = dy_in_nm/d_in_nm;
a1 = 20;
a1y = 10;
radius1 = (a1/(2*d_in_nm))*d;
radius1y = (a1y/(2*d_in_nm))*d;
a2 = 20;
radius2 = (a2/(2*d_in_nm))*d;
radius2y = radius1y;
s1y = 10;
slab1y = (s1y/(2*d_in_nm))*d;
c1y = 10;
cov1y = (c1y/(2*d_in_nm))*d;


lc = 0; // 0.501 0.201 0.0701;
lc2 = lc/1; // waveguide core
lc3 = lc/1; // waveguide clading

hy = dy; // Thickness: square profile => hy=d
hx = 0.;


Point(1) = {0, 0, 0, lc};
Point(2) = {-hx, -hy, 0, lc};
Point(3) = {-hx+d, -hy, 0, lc};
Point(4) = {d, 0, 0,lc};
// bottom slab
Point(5) = {-hx, -hy+slab1y, 0, lc};
Point(6) = {-hx+d, -hy+slab1y, 0, lc};
// slot
Point(7) = {-hx+d/2+radius1, -hy+slab1y, 0, lc2};
Point(8) = {-hx+d/2-radius1, -hy+slab1y, 0, lc2};
Point(9) = {-hx+d/2+radius1, -hy+slab1y+2*radius1y, 0, lc2};
Point(10) = {-hx+d/2-radius1, -hy+slab1y+2*radius1y, 0, lc2};
// surroundings
Point(11) = {-hx+d/2+radius1+2*radius2, -hy+slab1y, 0, lc3};
Point(12) = {-hx+d/2-radius1-2*radius2, -hy+slab1y, 0, lc3};
Point(13) = {-hx+d/2+radius1+2*radius2, -hy+slab1y+2*radius2y, 0, lc3};
Point(14) = {-hx+d/2-radius1-2*radius2, -hy+slab1y+2*radius2y, 0, lc3};
// cover
Point(23) = {-hx+d/2+radius1+2*radius2, -hy+slab1y+2*radius2y+2*cov1y, 0, lc3};
Point(24) = {-hx+d/2-radius1-2*radius2, -hy+slab1y+2*radius2y+2*cov1y, 0, lc3};

Line(1) = {1, 4};
Line(2) = {4, 6};
Line(3) = {6, 3};
Line(4) = {3, 2};
Line(5) = {2, 5};
Line(6) = {5, 1};
Line(7) = {5, 12};
Line(8) = {12, 8};
Line(9) = {8, 7};
Line(10) = {7, 11};
Line(11) = {11, 6};
Line(12) = {11, 13};
Line(13) = {13, 9};
Line(14) = {9, 10};
Line(15) = {10, 14};
Line(16) = {14, 12};
Line(17) = {8, 10};
Line(18) = {9, 7};
Line Loop(21) = {7, 8, 9, 10, 11, 3, 4, 5};
Plane Surface(22) = {21};
Line Loop(23) = {16, 8, 17, 15};
Plane Surface(24) = {23};
Line Loop(25) = {14, -17, 9, -18};
Plane Surface(26) = {25};
Line Loop(27) = {13, 18, 10, 12};
Plane Surface(28) = {27};
Physical Line(29) = {6, 5};
Physical Line(30) = {4};
Physical Line(31) = {3, 2};
Physical Line(32) = {1};
Line(33) = {14, 24};
Line(34) = {24, 23};
Line(35) = {23, 13};
Line Loop(36) = {7, -16, 33, 34, 35, -12, 11, -2, -1, -6};
Plane Surface(37) = {36};
Line Loop(38) = {15, 33, 34, 35, 13, 14};
Plane Surface(39) = {38};

Physical Surface(1) = {37};
Physical Surface(2) = {26};
Physical Surface(3) = {22};
Physical Surface(4) = {28, 24};
Physical Surface(5) = {39};
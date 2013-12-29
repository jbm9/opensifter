use <holefield.scad>;


$fn = 30;

siftHoleDia = 12; // 11mm holes

wallT = 4;

chamberOD = 75.5;
chamberODTop = 90;
chamberID = chamberOD-2*wallT;

chamberH = 75;

r0 = siftHoleDia+wallT-2;
r1 = 2*r0-2;
r2 = r0+ siftHoleDia+wallT-2.5;

difference() {
  difference() {
    //    cylinder(r=chamberOD/2, chamberH);
    //translate( [0,0,wallT]) cylinder(r=chamberID/2, chamberH);
    cylinder(chamberH, chamberOD/2, chamberODTop/2, $fn=100);
    translate( [0,0,wallT]) cylinder(chamberH, chamberOD/2-wallT, chamberODTop/2-wallT, $fn=100);

  }

  intersection() {

    translate(-1*[chamberOD, chamberOD+siftHoleDia, 1]/2) 
      holefield(12,1, chamberOD, chamberOD, wallT+1, 20);
    translate([0,0,-1]) cylinder(r=chamberID/2, h=wallT+2);
  }


  /*  translate([0,0,-0.05])
  union() {
    cylinder(r=siftHoleDia/2, h=wallT+0.1);
    for (theta = [0:6]) {
      translate(r0*[cos(60*theta), sin(60*theta),0])
	cylinder(r = siftHoleDia/2, h=wallT+0.1);


      translate(r1*[cos(30+60*theta), sin(30+60*theta),0])
	cylinder(r = siftHoleDia/2, h=wallT+0.1);

      translate(r2*[cos(60*theta), sin(60*theta),0])
	cylinder(r = siftHoleDia/2, h=wallT+0.1);


    }

  }
  */

}

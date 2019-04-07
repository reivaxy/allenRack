
x = 10;
y = 40;
z = 1;

supportX = 2;
supportZ = 10; 
topOffset = 3;
$fn = 80;

spacingY = 8;
startY = 4;

allenRack();

module allenRack() {
  difference() {
    union() {
      support();
      translate([10, 0, 0])
        support();
    }
    translate([0, startY, supportZ*2/3 - 0.6]) {
      rotate([0, 90, 0]) {
        cylinder(d=3.1, h = supportZ * 3);
      }
    }
    translate([0, startY + spacingY, supportZ*2/3 - 0.6]) {
      rotate([0, 90, 0]) {
        cylinder(d=3.1, h = supportZ * 3);
      }
    }
    translate([0, startY + spacingY * 2, supportZ*2/3 - 0.6]) {
      rotate([0, 90, 0]) {
        cylinder(d=1.9, h = supportZ * 3);
      }
    }
    translate([0, startY + spacingY * 3, supportZ*2/3 - 0.6]) {
      rotate([0, 90, 0]) {
        cylinder(d=1.9, h = supportZ * 3);
      }
    }
    translate([0, startY + spacingY * 4, supportZ*2/3 - 0.6]) {
      rotate([0, 90, 0]) {
        cylinder(d=1.9, h = supportZ * 3);
      }
    }
  }
}

module support() {  
  cube([x, y, z]);
  translate([topOffset, 0, 0])
    cube([supportX, y, supportZ]);
  translate([topOffset - supportX, 0, z])
    roundedInside(supportX, y);
  translate([topOffset + 2*supportX, y, z])
    rotate(180, [0, 0, 1])
      roundedInside(supportX, y);
}


module roundedInside(side, length) {
  difference() {
    cube([side, length, side]);
    translate([0, -1, side])
      rotate(-90, [1, 0, 0])
        cylinder(d=side*2, h=length + 2, $fn=80);
  }
  
}
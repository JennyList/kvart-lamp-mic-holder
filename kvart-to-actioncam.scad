/*
Action camera mount for Ikea Kvart lamp, and holder for Logitech gaming microphone
Jenny List 2023
CC-BY-SA 4.0

ActionCamMountLobe() is a lobe component for building action cam mounts

KvartToActionCam() is the part that fits the Ikea Kvart lamp stem and converts it to action cam
It probably fits lots of other lamps too.

GamingMicHolder() is a simple mic holder for the Logitech gaming mic that has an action cam mount.

You will need support over the bed for the action cam lobes on the mic holder.

*/

module ActionCamMountLobe(){
    difference(){
        union(){
            cylinder(3.0,7.25,7.25, $fn=45);
            translate([-7.25,-9,0]) cube([14.5,9,3.0]);
        }
        cylinder(3.0,2.5,2.5, $fn=45);  
    }
    
}

module KvartToActionCam(){
    difference(){
        cylinder(25 ,11,11, $fn=45); //main cylinder
        cylinder(20,5,5, $fn=45);  //space for shaft
        translate([0,0,20])cylinder(5,5,1, $fn=45);  //cone for supportless printing
        translate([-7.1,-12.5,7.5]) cube([14.2,25,5.5]);  //Slot for nut
    }
    translate([0,1.5,34]) rotate([90,0,0]) ActionCamMountLobe();
    translate([0,7.5,34]) rotate([90,0,0]) ActionCamMountLobe();
    translate([0,-4.5,34]) rotate([90,0,0]) ActionCamMountLobe();
    
    //Pin up the centre for joint if no nut & bolt is used
    cylinder(20,2.45,2.45, $fn=45);
    cylinder(2,4,4, $fn=45);
}

module GamingMicHolder(){
    difference(){
        union(){
            cylinder(20,19.15,18.25, $fn=45, true); //outer ring
            translate([12,0,0]) cube([15,15,15],true); //mount for lobes
        }
        cylinder(85,17.125,15.125, $fn=45, true); //mic body. I measured the radius at 2 points 85mm apart.
        translate([-15,0,0]) cube([10,10,25],true); //slot
    }
    translate([28.5,4.5,0]) rotate([90,90,0]) ActionCamMountLobe();
    translate([28.5,-1.4,0]) rotate([90,90,0]) ActionCamMountLobe();
}

translate([0,0,10]) GamingMicHolder();
KvartToActionCam();
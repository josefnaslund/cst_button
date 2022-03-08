// Rev 3. Pretty good.
// There is a bit too much space beneath the switch lugs.
// There could be some texture on the top button

rad=140;
height=30;
width=15;
switchWidth=5.9;
buttonTopSupport=2;
topCut=1;
buttonBottomCut=14;
btnLength=13;
trackWall = 3;


difference(){

    // draw cylinder
    translate([0,-(rad-height),0], $fn=120)
        cylinder(h=width,r1=rad, r2=rad+3);
        
    // remove left half
    translate([-(rad+3),-rad*2+height-3,0])
    cube([rad+3,rad*2+6,width]);
    
    // remove bottom quarter
    translate([0,-rad*2+height-3,0])
    cube([rad+3, rad*2-height+3,width]);
    
    // remove for button

    translate([0,height-topCut,trackWall])
    cube([btnLength, (topCut+3), width-4.5]);

    // leave support for button
    // cut out button hole
    rotate([-2,0,0])
    translate([0, height-(topCut+buttonTopSupport+switchWidth), trackWall])
    cube([btnLength,switchWidth,width-4]);
    
    // leave support for button
    translate([0, 0, trackWall])
    cube([btnLength,height-buttonBottomCut, width-5]);
    
    // cut off tail
    tail=70;
    translate([tail,0,0])
    cube([23,15,width]);
    
    // cut out "spring"
    translate([btnLength, 0, trackWall])
    cube([40, height+3, 10.5]);
    
    // separate clicking area spring
    translate([0,0,width-3])
    cube([switchWidth+47,height,1.5]);
    
    outerWall = 2;
    // remove outer side part diagonal
    translate([0, -(rad-10), width-outerWall])
    cylinder(h=2,r1=rad,r2=rad, $fn=120);
    
    // spring holes - reducing stifness?
    //back
    translate([45,17.5,12])
    cylinder(h=10, r=4, $fn=30);
    // middle
    translate([33,21.5,11])
    cylinder(h=10, r=3.5, $fn=39);
    // front
    translate([21,23.5,10])
    cylinder(h=10, r=3, $fn=30);
 
 // remove some on inside
 translate([13, 30, 11.71])
rotate([90,0,0])
cylinder(h=22, r=1.8, $fn=30);
    
 
}
// ADD BUTTONPRESSER
 rotate([-2,0,0])
 translate([2, 22, width-1.5])
cube([10,4,2]);

*rotate([90,0,90])
*cylinder(h=10, r=1.2, $fn=20);

// add stiffeners next to button

*translate([0,13,width])
*cube([10,19.6,0.3]);

translate([0,13,width])
cube([15,19,0.3]);



// add three more layer next to button for "texture"
translate([3.5,17,width+0.3])
cube([1.5,15,0.5]);

translate([6.5,17,width+0.3])
cube([1.5,15,0.5]);

translate([9.5,17,width+0.3])
cube([1.5,15,0.5]);


// adding a top button?

for (i = [0 : 7]){
// first add angled connector
translate(
    [0.3+i*1, 
    1.1+height + 0.5 - i*0.15, 
    5]
    )
rotate([7,0,0])
cube([3,2,9]);
// then add a circtular button
translate(
    [2.5+i*1, 
    height+5.5 -i*0.15,
    5.37])
rotate([7,0,0])
cylinder(h=2 - i*0.15, r1=4.10, r2=4.10, $fn=100);
}
// square button alternative
*translate([0, height+0.5,6])
*cube([5,5,2]);

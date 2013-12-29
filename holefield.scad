module holefield(holeD, borderW, width, height, depth, fn) {
  // we want to center up the centermost row here...

  rowH = (holeD+borderW)*sin(60);
  pairW = holeD+borderW;

  midX = width/2;
  midY = height/2;

  nX = (ceil(width/pairW)+2);
  nY = (ceil(height/rowH))/2;

  baseX = midX - nX/2*pairW;
  baseY = midY - nY*rowH;
  


  intersection() {
    cube([width, height, depth]);

    translate([baseX, baseY, 0])
      union() {

    for (x = [0:nX]) {
      for (y = [0:nY]) {

    translate([x*pairW, rowH*y*2, 0]) cylinder(r=holeD/2, h=depth+1, $fn=fn);
    translate([x*pairW+pairW/2, rowH*(y*2+1), 0]) cylinder(r=holeD/2, h=depth+1, $fn = fn);
      }
    }


    }
  }


}



    holefield(2, 1, 10, 10,5, 10);

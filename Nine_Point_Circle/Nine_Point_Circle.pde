Wheel wa, wb, wc;
Triangle triangle;
int dispType = 0;

void setup() {
  //fullScreen();
  size(500, 500);
  float offx = (width-height)/2;
  wa = new Wheel(offx+height/3, height/3, height/12);
  wb = new Wheel(offx+height/3, height/3*2, height/12);
  wc = new Wheel(offx+height/3*2, height/3, height/12);
  triangle = new Triangle();
  strokeJoin(ROUND);
  strokeWeight(1);
  textSize(10);
}

void draw() {
  background(255);
  wa.update();
  wb.update();
  wc.update();
  triangle.setVertices(wa.getPos(), wb.getPos(), wc.getPos());
  wa.show();
  wb.show();
  wc.show();
  triangle.show();
  PVector[] pendFoots = triangle.getPendFoots();
  PVector H = triangle.getOrthoC(false);//orthocenter
  marker(H, "orthocenter(H)");
  marker(pendFoots[0], "footA");
  marker(pendFoots[1], "footB");
  marker(pendFoots[2], "footC");
  markerWRing(circleThreePoints(pendFoots[0], pendFoots[1], pendFoots[2]), "9 point circle");
  marker(PVector.add(triangle.A, triangle.B).div(2), "midAB");
  marker(PVector.add(triangle.B, triangle.C).div(2), "midBC");
  marker(PVector.add(triangle.C, triangle.A).div(2), "midCA");
  marker(PVector.add(triangle.A, H).div(2), "midAH");
  marker(PVector.add(triangle.B, H).div(2), "midBH");
  marker(PVector.add(triangle.C, H).div(2), "midCH");
}

void mousePressed(){
  dispType++;
  if(dispType >= 6){
    dispType = 0;
  }
}

Wheel wa, wb, wc;
Triangle triangle;
int dispType = 0;

void setup() {
  fullScreen();
  //size(500, 500);
  float offx = (width-height)/2;
  wa = new Wheel(offx+height/3, height/3, height/12);
  wb = new Wheel(offx+height/3, height/3*2, height/12);
  wc = new Wheel(offx+height/3*2, height/3, height/12);
  triangle = new Triangle();
  strokeJoin(ROUND);
  strokeWeight(10);
  textSize(100);
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
  noFill();
  switch(dispType){
    case 0:
      marker(triangle.getCentroid(), "centroid");
      break;
    case 1:
      markerWRing(triangle.getCircumC(), "circumcenter");
      break;
    case 2:
      markerWRing(triangle.getInC(), "incenter");
      break;
    case 3:
      marker(triangle.getOrthoC(true), "orthocenter");
      break;
    case 4:
      PVector[] excenters = triangle.getExC();
      markerWRing(excenters[0], "excenterA");
      markerWRing(excenters[1], "excenterB");
      markerWRing(excenters[2], "excenterC");
      triangle.showExtensionEdge();
      break;
    case 5://show all centers
      marker(triangle.getCentroid(), "centroid");
      marker(triangle.getCircumC(), "circumcenter");
      marker(triangle.getInC(), "incenter");
      marker(triangle.getOrthoC(false), "orthocenter");
      PVector[] excenters_ = triangle.getExC();
      markerWRing(excenters_[0], "excenterA");
      markerWRing(excenters_[1], "excenterB");
      markerWRing(excenters_[2], "excenterC");
      triangle.showExtensionEdge();
      break;
  }
}

void mousePressed(){
  dispType++;
  if(dispType >= 6){
    dispType = 0;
  }
}

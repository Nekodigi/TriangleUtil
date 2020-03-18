float r = 500;
Triangle triangle = new Triangle(r);
float pointSW = 50;//pointStrokeWeight
float lineSW = 10;//lineStrokeWeight
boolean renderSphere = false;

void setup(){
  //size(500, 500, P3D);
  fullScreen(P3D);
  triangle.calcCircum();
}

void draw(){
  stroke(0);
  background(255);
  noFill();
  lights();
  translate(width/2, height/2);
  rotateX((float)frameCount/500);
  rotateY((float)frameCount/500);
  rotateZ((float)frameCount/500);
  triangle.show();
  stroke(255, 0, 0);
  point(triangle.circumC, pointSW);
  if(renderSphere){
  noStroke();
  fill(255, 100);
  sphere(triangle.circumC, triangle.circumR);
  }
}

void keyPressed(){
  if(key == 's'){
    renderSphere = !renderSphere;
  }
  if(key == 'r'){
    triangle = new Triangle(r);
    triangle.calcCircum();
  }
}
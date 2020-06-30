float calcSlope(PVector a, PVector b){
  return (b.y-a.y)/(b.x-a.x);
}

PVector calcIntersect(float slope1, float off1, float slope2, float off2){//line defined by slope and offset from y
  float x = (off2-off1)/(slope1-slope2);
  float y = slope1*x+off1;
  return new PVector(x, y);
}

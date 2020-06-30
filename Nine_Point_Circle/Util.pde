float calcSlope(PVector a, PVector b){
  return (b.y-a.y)/(b.x-a.x);
}

PVector calcIntersect(float slope1, float off1, float slope2, float off2){//line defined by slope and offset from y
  float x = (off2-off1)/(slope1-slope2);
  float y = slope1*x+off1;
  return new PVector(x, y);
}

PVector circleThreePoints(PVector a, PVector b, PVector c){
  PVector ta = a.copy(), tb = b.copy(), tc = c.copy();
  if(a.x == b.x || a.y == b.y){
    tc = b;
    tb = c;
  }
  
  float ma = (tb.y - ta.y) / (tb.x - ta.x);
  float mb = (tc.y - tb.y) / (tc.x - tb.x);
  
  float x = (ma * mb * (ta.y - tc.y) + mb * (ta.x + tb.x) - ma * (tb.x + tc.x)) / (2 * (mb - ma));
  float y = -1.0 / ma * (x - (ta.x + tb.x) / 2.0) + (ta.y + tb.y) / 2.0;
  //(x, y)=pos z=radius
  PVector o = new PVector(x, y);
  o.z = PVector.dist(o, a);
  return o;
}

class Triangle{
  PVector A, B, C;
  
  void setVertices(PVector A, PVector B, PVector C){
    this.A = A;
    this.B = B;
    this.C = C;
  }
  
  //visualize
  
  void show(){
    triangle(A.x, A.y, B.x, B.y, C.x, C.y);
    marker(A, "A");
    marker(B, "B");
    marker(C, "C");
  }
  
  void showExtensionEdge(){//use for visualize
    float ABm = calcSlope(A, B);
    float BCm = calcSlope(B, C);
    float CAm = calcSlope(C, A);
    float b1 = A.y - A.x*ABm;
    float b2 = B.y - B.x*BCm;
    float b3 = C.y - C.x*CAm;
      line(0, b1, width, b1+width*ABm);//show edtension edge
      line(0, b2, width, b2+width*BCm);
      line(0, b3, width, b3+width*CAm);
  }
  
  PVector[] getPendFoots(){//get all perpendicular foot
    float ABm = calcSlope(A, B);
    float BCm = calcSlope(B, C);
    float CAm = calcSlope(C, A);
    float b1 = A.y - A.x*ABm;
    float b2 = B.y - B.x*BCm;
    float b3 = C.y - C.x*CAm; 
    float b4 = C.y + C.x/ABm;//y offset of CH Line
    float b5 = A.y + A.x/BCm;//y offset of AH Line 
    float b6 = B.y + B.x/CAm;//y offset of BH Line
    PVector[] results = new PVector[3];
    //intersection of BC AH
    results[0] = calcIntersect(BCm, b2, -1./BCm, b5);
    //intersection of CA BH
    results[1] = calcIntersect(CAm, b3, -1./CAm, b6);
    //intersection of AB CH
    results[2] = calcIntersect(ABm, b1, -1./ABm, b4);
    return results;
  }
  
  //based on this site https://tutors.com/math-tutors/geometry-help/how-to-find-orthocenter-of-a-triangle#how-find-orthocenter-triangle
  PVector getOrthoC(boolean visualize){//get ortho center 
    float ABm = calcSlope(A, B);
    float BCm = calcSlope(B, C);
    float b1 = C.y + C.x/ABm;
    float b2 = A.y + A.x/BCm; 
    if(visualize){
      line(0, b1, width, b1-width/ABm);//show perpendicular
      line(0, b2, width, b2-width/BCm);
    }
    float x = (b2-b1)/(-1./ABm+1./BCm);
    float y = -x/ABm + b1;
    return new PVector(x, y);
  }
}

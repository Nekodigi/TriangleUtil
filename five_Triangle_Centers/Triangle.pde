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
  
  //calculate 5 center of triangle
  
  //based on this site https://brilliant.org/wiki/triangles-centroid/
  PVector getCentroid(){//get center of gravity 
    return PVector.add(A, B).add(C).div(3);
  }
  
  //based on this site https://stackoverflow.com/questions/56224824/how-do-i-find-the-circumcenter-of-the-triangle-using-python-without-external-lib
  PVector getCircumC(){//get circum center with Radius (z is radius)
    float d = 2 * (A.x * (B.y - C.y) + B.x * (C.y - A.y) + C.x * (A.y - B.y));
    float ux = ((A.x * A.x + A.y * A.y) * (B.y - C.y) + (B.x * B.x + B.y * B.y) * (C.y - A.y) + (C.x * C.x + C.y * C.y) * (A.y - B.y)) / d;
    float uy = ((A.x * A.x + A.y * A.y) * (C.x - B.x) + (B.x * B.x + B.y * B.y) * (A.x - C.x) + (C.x * C.x + C.y * C.y) * (B.x - A.x)) / d;
    PVector cc = new PVector(ux, uy);//circum center 
    cc.z = PVector.dist(A, cc);//use z as radius
    return cc;
  }
  
  //based on this site https://en.wikipedia.org/wiki/Incenter
  PVector getInC(){//get inner center 
    float a = PVector.dist(B, C);
    float b = PVector.dist(C, A);
    float c = PVector.dist(A, B);
    PVector result = PVector.mult(A, a).add(PVector.mult(B, b)).add(PVector.mult(C, c)).div(a + b + c);
    //based on this cite https://en.wikipedia.org/wiki/Incircle_and_excircles_of_a_triangle
    float s = (a + b + c)/2;
    result.z = sqrt(s*(s-a)*(s-b)*(s-c))/s;//use z as radius
    //result.z = sqrt((b+c-a)*(c+a-b)*(a+b-c)/(a+b+c))/2;//use z as radius
    return result;
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
    return calcIntersect(-1./ABm, b1, -1./BCm, b2);
  }
  
  PVector[] getExC(){//based on this site https://math.stackexchange.com/questions/2885076/finding-the-excenter-of-a-triangle
    float a = PVector.dist(B, C);
    float b = PVector.dist(C, A);
    float c = PVector.dist(A, B);
    PVector[] results = new PVector[3];
    float s = (a + b + c)/2;
    results[0] = PVector.mult(A, -a).add(PVector.mult(B, b)).add(PVector.mult(C, c)).div(-a + b + c);
    results[0].z = sqrt(s*(s - b)*(s - c)/(s - a));//use z as radius
    results[1] = PVector.mult(A, a).add(PVector.mult(B, -b)).add(PVector.mult(C, c)).div(a - b + c);
    results[1].z = sqrt(s*(s - c)*(s - a)/(s - b));//use z as radius
    results[2] = PVector.mult(A, a).add(PVector.mult(B, b)).add(PVector.mult(C, -c)).div(a + b - c);
    results[2].z = sqrt(s*(s - a)*(s - b)/(s - c));//use z as radius
    return results;
  }
}

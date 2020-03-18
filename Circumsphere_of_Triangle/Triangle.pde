class Triangle{
  PVector A, B, C;
  PVector circumC;
  float circumR;
  
  Triangle(float r){
    float range = r;
    A = new PVector(0, -r, 0).add(randomVector(range));
    B = new PVector(-sqrt(3)/2*r, r/2, 0).add(randomVector(range));
    C = new PVector(sqrt(3)/2*r, r/2, 0).add(randomVector(range));
  }
  
  void calcCircum(){//based on this site https://gamedev.stackexchange.com/questions/60630/how-do-i-find-the-circumcenter-of-a-triangle-in-3d
    PVector ac = PVector.sub(C, A);
    PVector ab = PVector.sub(B, A);
    float ablen2 = sqrDist(A, B);//squared distance between A, B
    float aclen2 = sqrDist(A, C);//squared distance between A, C
    PVector abXac = ab.cross(ac);
    PVector toCircumC = abXac.cross(ab).mult(sqrNorm(ac)).add(ac.cross(abXac).mult(sqrNorm(ab))).div(2.0*sqrNorm(abXac));
    circumR = toCircumC.mag();
    circumC = toCircumC.add(A);
  }
  
  void show(){
    polygonWithVertex(A, B, C);
  }
}
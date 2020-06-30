class Wheel {
  PVector c;//center of wheel
  float r, theta;

  Wheel(float x, float y, float r) {
    this.c = new PVector(x, y);
    this.r = r;
    theta = random(TWO_PI);
  }

  void update() {
    theta += 0.005;
  }

  PVector getPos() {//get current position of wheel
    return PVector.fromAngle(theta).mult(r).add(c);
  }

  void show() {
    ellipse(c.x, c.y, r*2, r*2);
    marker(getPos());
  }
}

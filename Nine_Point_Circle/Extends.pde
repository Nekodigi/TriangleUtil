void marker(PVector p, String str){
  marker(p);
  fill(0);
  text(str, p.x, p.y);
  fill(255);
}

void marker(PVector p){
  ellipse(p.x, p.y, 10, 10);
}

void markerWRing(PVector p, String str){//marker with ring given r
  noFill();
  ellipse(p.x, p.y, p.z*2, p.z*2);
  fill(255);
  marker(p, str);
}

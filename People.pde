void makePeople() {
  for (int i=0; i<peoples.length; i=i+1) {
    peoples[i]=new people();
    peoples[i].x=int(random(100));
    peoples[i].y=int(random(100));
    peoples[i].xSpeed=int(random(6))-3;
    peoples[i].ySpeed=int(random(6))-3;
    peoples[i].s=40;
    while (peoples[i].xSpeed==0 && peoples[i].ySpeed==0 || peoples[i].xSpeed==0 || peoples[i].ySpeed==0) {
      peoples[i].xSpeed=int(random(6))-3;
      peoples[i].ySpeed=int(random(6))-3;
    }
  }
}

void movePeople() {
  for (int i=0; i<peoples.length; i=i+1) {
    peoples[i].x=peoples[i].x+peoples[i].xSpeed;
    if (peoples[i].x>width || peoples[i].x<0) peoples[i].xSpeed=peoples[i].xSpeed*-1;
    peoples[i].y=peoples[i].y+peoples[i].ySpeed;
    if (peoples[i].y>height || peoples[i].y<0) peoples[i].ySpeed=peoples[i].ySpeed*-1;
    fill(0,0,500);
    ellipse(peoples[i].x, peoples[i].y, peoples[i].s, peoples[i].s);
    fill(0);
    text(i,peoples[i].x, peoples[i].y);
  }
}

void makeAliens() {
  for (int i=0; i<aliens.length; i=i+1) {
    aliens[i]=new alien();
    aliens[i].x=width*5/8+int(random(width*3/8));
    aliens[i].y=int(random(height));
    aliens[i].xSpeed=int(random(6))-3;
    aliens[i].ySpeed=int(random(6))-3;
    while (aliens[i].xSpeed==0 && aliens[i].ySpeed==0 || aliens[i].xSpeed==0 || aliens[i].ySpeed==0) {
      aliens[i].xSpeed=int(random(6))-3;
      aliens[i].ySpeed=int(random(6))-3;
    }
    aliens[i].s=30;
  }
}

void moveAliens() {
  for (int i=0; i<aliens.length; i=i+1) {
    aliens[i].x=aliens[i].x+aliens[i].xSpeed;
    if (aliens[i].x<width*5/8 || aliens[i].x>width) aliens[i].xSpeed=aliens[i].xSpeed*-1;
    aliens[i].y=aliens[i].y+aliens[i].ySpeed;
    if (aliens[i].y>height || aliens[i].y<0) aliens[i].ySpeed=aliens[i].ySpeed*-1;
    fill(0,255,0);
    ellipse(aliens[i].x, aliens[i].y, aliens[i].s, aliens[i].s);
    fill(0);
    text(i,aliens[i].x, aliens[i].y);
  }
}

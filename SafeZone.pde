void makeSafeZone() {
  for (int i=0; i<safeZones.length; i=i+1) {
    safeZones[i]=new safeZone();
    safeZones[i].x=100; 
    safeZones[i].y=100; 
    safeZones[i].xSpeed=3; 
    safeZones[i].ySpeed=3; 
    safeZones[i].s=200;
  }
}

void moveSafeZone() {
  for (int i=0; i<safeZones.length; i=i+1) {
    safeZones[i].x=safeZones[i].x+safeZones[i].xSpeed;
    if (safeZones[i].x>width || safeZones[i].x<0) safeZones[i].xSpeed=safeZones[i].xSpeed*-1;
    safeZones[i].y=safeZones[i].y+safeZones[i].ySpeed;
    if (safeZones[i].y>height || safeZones[i].y<0) safeZones[i].ySpeed=safeZones[i].ySpeed*-1;
    fill(0);
    ellipse(safeZones[i].x, safeZones[i].y, safeZones[i].s, safeZones[i].s);
  }
}

boolean inSafeZone(int x, int y) {
  for (int i=0; i<safeZones.length; i=i+1) {
      if (dist(safeZones[i].x, safeZones[i].y, x, y) < safeZones[i].s) {
        return true;
      }
    }
  return false;
} 

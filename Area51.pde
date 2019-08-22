class alien {
  int x, y, xSpeed, ySpeed, s;
}

alien[] aliens=new alien[10];

class agent {
  int x, y, xSpeed, ySpeed, s;
}

agent[] agents=new agent[5];

class people {
  int x, y, xSpeed, ySpeed, s;
}

people[] peoples=new people[3];

class safeZone {
  int x, y, xSpeed, ySpeed, s;
}

safeZone[] safeZones=new safeZone[1];

void setup() { 
  frameRate(20);
  fullScreen();
  newLevel();
}

void draw() {
  background(225);
  moveSafeZone();
  drawArea51();
  moveAgents();
  moveAliens();
  movePeople();
}

void keyPressed() {
  if (key == 'w' || key == 'W' ) {
    peoples[i].xSpeed=0;
    peoples[i].ySpeed=-7;
  }
  if (key == 's' || key == 'S' ) {
    peoples[i].xSpeed=0;
    peoples[i].ySpeed=7;
  }
  if (key == 'd' || key == 'D' ) {
    peoples[i].xSpeed=-7;
    peoples[i].ySpeed=0;
  }
  if (key == 'a' || key == 'A' ) {
    peoples[i].xSpeed=7;
    peoples[i].ySpeed=0;
  }
} 

void newLevel() {
  makeAgents();
  makeAliens();
  makePeople();
  makeSafeZone();
}

void killInteruders() {
}

void trackPerson() {
  for (int i=0; i<agents.length; i=i+1) {
    //closest.p=0; (dist(safeZones[i].x, safeZones[i].y, x, y) < safeZones[i].s);
    for (int j=0; j<peoples.length; j=j+1) {
      // if (inSafeZone(peoples[j].x, peoples[j].y)==false){
      /*     
       } else {
       if they are the closest player, get agent to follow.
       */
    }
  }
}

void discoverAliens() {
}

void drawArea51() {
  fill(0);
  rect(width*5/8, 0, width*3/8, height);
}

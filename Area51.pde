int closestPersonIndex=0;
int closestDistance=2000;
int selectedPerson=0;

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

people[] peoples=new people[1];

class safeZone {
  int x, y, xSpeed, ySpeed, s;
}

safeZone[] safeZones=new safeZone[1];

void setup() { 
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
  trackPerson();
  killInteruders();
  discoverAliens();
}

void keyPressed() {
  if (key==CODED) {
    if (keyCode== LEFT) {
      peoples[selectedPerson].xSpeed =-1;
    } else if (keyCode==RIGHT) {
      peoples[selectedPerson].xSpeed = 1;
    } else if (keyCode==UP) {
      peoples[selectedPerson].ySpeed =-1;
    } else if (keyCode==DOWN) {
      peoples[selectedPerson].ySpeed = 1;
    }
  } else {   
    if (key=='0' || key=='1' || key=='2' || key=='3' || key=='4'||key=='5'||key=='6'||key=='7'||key=='8'||key=='9') {
      selectedPerson = key-'0'; //minus the ascii value
      println(selectedPerson);
    }
  }
}

void newLevel() {
  makeAgents();
  makeAliens();
  makePeople();
  makeSafeZone();
}

boolean agentTouchPerson(people p, agent a) {
  if (dist(p.x, p.y, a.x, a.y) < p.s/2+a.s/2) {
    return true;
  } else return false;
}

boolean personTouchAlien(people p, alien a) {
  if (dist(p.x, p.y, a.x, a.y) < p.s/2+a.s/2) {
    return true;
  } else return false;
}



void killInteruders() {
  for (int i=0; i<peoples.length; i=i+1) {
    for (int j=0; j<agents.length; j=j+1) {
      if (agentTouchPerson(peoples[i], agents[j]) == true) {
        peoples[i].x=2000;
        print("aaaa");
      }
    }
  }
}

void trackPerson() {
  for (int i=0; i<agents.length; i=i+1) {
    closestDistance = 2000;
    closestPersonIndex=0;
    for (int j=0; j<peoples.length; j=j+1) {
      if (inSafeZone(peoples[j].x, peoples[j].y)==false) {
        if ((dist(peoples[j].x, peoples[j].y, agents[i].x, agents[i].y))<closestDistance) {
          closestDistance=int(dist(peoples[j].x, peoples[j].y, agents[i].x, agents[i].y));
          closestPersonIndex=j;
          if (peoples[j].x < agents[i].x) {
            agents[i].x=agents[i].x*-1;
          } else {
            agents[i].x=agents[i].x*1;
          }
          if (peoples[j].y < agents[i].y) {
            agents[i].y=agents[i].y*-1;
          } else {
            agents[i].y=agents[i].y*1;
          }
        }
        text(closestPersonIndex, agents[i].x, agents[i].y+10);
      }
    }
  }
}

    void discoverAliens() {
      for (int i=0; i<peoples.length; i=i+1) {
        for (int j=0; j<aliens.length; j=j+1) {
          if (personTouchAlien(peoples[i], aliens[j]) == true) {
            aliens[j].x=2000;
            print("bbb");
          }
        }
      }
    }

    void drawArea51() {
      fill(0);
      rect(width*5/8, 0, width*3/8, height);
    }

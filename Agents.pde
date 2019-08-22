void makeAgents() {
  for (int i=0; i<agents.length; i=i+1) {
    agents[i]=new agent();
    agents[i].x=width/2+int(random(width*3/8));
    agents[i].y=int(random(height));
    agents[i].xSpeed=int(random(6))-3; //change 3
    agents[i].ySpeed=int(random(6))-3; //change 3
    while (agents[i].xSpeed==0 && agents[i].ySpeed==0 || agents[i].xSpeed==0 || agents[i].ySpeed==0) {
      agents[i].xSpeed=int(random(6))-5;
      agents[i].ySpeed=int(random(6))-5;
    }
    agents[i].s=50;
  }
}

void moveAgents() {
  for (int i=0; i<agents.length; i=i+1) {
    agents[i].x=agents[i].x+agents[i].xSpeed;
    if (agents[i].x>width || agents[i].x<0) agents[i].xSpeed=agents[i].xSpeed*-1;
    agents[i].y=agents[i].y+agents[i].ySpeed;
    if (agents[i].y>height || agents[i].y<0) agents[i].ySpeed=agents[i].ySpeed*-1;
    fill(500,0,0);
    ellipse(agents[i].x, agents[i].y, agents[i].s, agents[i].s);
    text(i,agents[i].x, agents[i].y);
  }
}

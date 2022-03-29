class pathfinder {
  PVector location;
  PVector velocity;
  float  weight;
  pathfinder() {
    location = new PVector(mouseX, mouseY); 
    velocity = new PVector(0,0);
    weight = 30;
  }
  pathfinder(pathfinder parent) {
    location = parent.location.get();
    velocity = parent.velocity.get();
    float area = PI*sq(parent.weight/2);
    float newWeight = sqrt(area/2.5/PI)*2;
    weight = newWeight;
    parent.weight = newWeight;
  }
  void update() {
    if (weight> 0.5) {
      location.add(velocity);
      PVector branch = new PVector(random(-1, 1)*.3, random(-1, 1)*.3);
      velocity.add(branch);
      velocity.normalize();
      if (random(0, 1) < 0.03) {
        paths = (pathfinder[]) append(paths, new pathfinder(this));
      }
    }
  }
}

pathfinder[] paths;

void setup() {
  size(1400, 300);
  background(100);  
  stroke(0,255,0, 50);
  smooth();
  paths = new pathfinder[1];
  paths[0] = new pathfinder();
}

void draw() {
  for (int i=0;i<paths.length; i++) {
    PVector loc = paths[i].location;
    PVector vel = paths[i].velocity;
    float  wei = paths[i].weight;
    strokeWeight(wei);
    line(loc.x, loc.y, loc.x+vel.x, loc.y+vel.y); 
    paths[i].update();
  }
}
void mousePressed() {
if (mouseButton == LEFT || mouseButton == LEFT) {
  background(100);
  paths = new pathfinder[1];
  paths[0] = new pathfinder();
}
else { //save("Random_process.png");
}
}

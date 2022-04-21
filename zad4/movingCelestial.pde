class MovingCelestial extends Celestial {
  
  // Orbit radius, orbiting speed, orbit squish, random start rotation
  float orbit, speed, squish, start;
  
  MovingCelestial(float radius, int points, color fill, float orbit, float squish, float speed) {
    super(radius, points, fill);
    this.orbit = orbit;
    this.squish = squish;
    this.speed = speed;
    start = random(-10, 10);
  }
  
  void drawCelestial (float time) {
    
    // Calculate parameters
    float rotation = speed * time + start;
    float distance = orbit + cos(rotation*2) * squish;
    float distance_max = orbit + squish;
    float distance_min = orbit - squish;
    
    
    
    // Draw orbit
    //drawOrbit();
    
    // Draw celestial
    pushMatrix();
    rotate(rotation);
    translate(0, distance);
    super.drawCelestial(time);
    popMatrix();
  }
  
  void drawOrbit () {
    
    pushStyle();
    fill(#ffffff);
    stroke(#ffffff);
    //beginShape();
    //vertex(0, 0);
    //vertex(0, 100);
    //vertex(50, 50);
    //endShape();
    
    beginShape();
    for(float i=0; i<PI*2; i+=0.1) {
      float distance = orbit + cos(i*2) * squish;
      pushMatrix();
      rotate(i);
      point(0, distance);
      popMatrix();
    }
    endShape();
    popStyle();
  }
  
}

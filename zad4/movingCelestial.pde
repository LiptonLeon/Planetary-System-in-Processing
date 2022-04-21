class MovingCelestial extends Celestial {
  
  // Orbit radius, orbiting speed, orbit squish, random start rotation
  float orbit, baseSpeed, squish;
  
  // Keep celestial rotation and distance
  float rotation, distance, speed;
  
  MovingCelestial(float radius, int points, color fill, PImage texture, float orbit, float squish, float baseSpeed) {
    super(radius, points, fill, texture);
    this.orbit = orbit;
    this.squish = squish;
    this.baseSpeed = baseSpeed;
    this.rotation = random(-10, 10);
    this.distance = orbit + cos(rotation*2) * squish;
  }
  
  void drawCelestial (float delta) {
    
    // Calculate parameters
    rotation += speed * delta;
    distance = orbit + cos(rotation*2) * squish;
    
    // Speed depends on distance
    speed = baseSpeed - 0.9 * (baseSpeed * distance / (orbit + squish));
    
    // Draw orbit
    drawOrbit();
    
    // Draw celestial
    pushMatrix();
    rotate(rotation);
    translate(0, distance);
    super.drawCelestial(delta);
    popMatrix();
  }
  
  void drawOrbit () {
    
    pushStyle();
    fill(#888888);
    stroke(0, 0);
    float steps = orbit/3;
    beginShape();
    for(float i=0; i<PI*2; i+=PI/steps) {
      pushMatrix();
      rotate(i);
      rect(0, orbit + cos(i*2) * squish - 2, 4, 2);
      popMatrix();
    }
    endShape();
    popStyle();
  }
  
}

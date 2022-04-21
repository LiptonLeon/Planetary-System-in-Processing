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
  
  // Call every frame
  void update (float delta) {
    
    // Calculate parameters
    rotation += speed * delta;
    distance = calculateDistance(rotation);
    
    // Speed depends on distance
    speed = baseSpeed - 0.9 * (baseSpeed * distance / (orbit + squish));
    
    // Draw orbit
    drawOrbit();
    
    // Draw celestial
    pushMatrix();
    rotate(rotation);
    translate(0, distance);
    super.update(delta);
    popMatrix();
  }
  
  void drawOrbit () {
    pushMatrix();
    pushStyle();
    beginShape();
    
    fill(0, 0);
    stroke(#222222);
    for (int i = 0; i <= int(orbit); i++) {
      float angle = TWO_PI * (float)i / orbit;
      vertex(sin(angle) * calculateDistance(angle), cos(angle) * calculateDistance(angle));
    }
    
    endShape();
    popStyle();
    popMatrix();
  }
  
  // Orbit's shape is ellipse
  // Formula: https://math.stackexchange.com/questions/432902/how-to-get-the-radius-of-an-ellipse-at-a-specific-angle-by-knowing-its-semi-majo
  float calculateDistance (float angle) {
    float a = orbit + squish;
    float b = orbit - squish;
    return a * b / sqrt(a*a * sin(angle)*sin(angle) + b*b * cos(angle)*cos(angle));
  }
  
}

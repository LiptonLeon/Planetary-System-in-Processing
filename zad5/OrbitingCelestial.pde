class OrbitingCelestial extends Celestial {
  
  // Orbit radius, orbiting speed, orbit squish, random start rotation, orbit tilt
  float orbit, baseSpeed, squish, tilt;
  
  // Keep celestial rotation and speed
  float rotation, speed;
  
  OrbitingCelestial(PShape shape, float orbit, float squish, float tilt, float baseSpeed) {
    super(shape);
    this.orbit = orbit;
    this.squish = squish;
    this.baseSpeed = baseSpeed;
    this.tilt = tilt;
    this.rotation = random(-10, 10);
  }
  
  // Call every frame
  void update(float delta) {
    
    // Calculate parameters
    rotation += speed * delta;
    float distance = calculateDistance(rotation);
    
    // Speed depends on distance
    speed = baseSpeed - 0.9 * (baseSpeed * distance / (orbit + squish));
    
    // Draw celestial
    pushMatrix();
    rotateX(tilt);
    drawOrbit();
    rotate(rotation);
    translate(0, distance);
    rotate(rotation);
    super.update(delta);
    
    popMatrix();
  }
  
  void drawOrbit() {
    pushStyle();
    beginShape();
    
    noFill();
    stroke(#222222);
    for (int i = 0; i <= int(orbit * 2); i++) {
      float angle = TWO_PI * (float)i / (orbit * 2);
      vertex(sin(angle) * calculateDistance(angle), cos(angle) * calculateDistance(angle));
    }
    endShape();
    popStyle();
  }
  
  // Orbit's shape is ellipse
  // Formula: https://math.stackexchange.com/questions/432902/how-to-get-the-radius-of-an-ellipse-at-a-specific-angle-by-knowing-its-semi-majo
  float calculateDistance(float angle) {
    float a = orbit + squish;
    float b = orbit - squish;
    return a * b / sqrt(a*a * sin(angle)*sin(angle) + b*b * cos(angle)*cos(angle));
  }
  
}

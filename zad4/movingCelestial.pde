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
  
  void draw_celestial (float time) {
    
    // Calculate parameters
    float rotation = speed * time + start;
    float distance = orbit + cos(rotation*2) * squish;
    float distance_max = orbit + squish;
    float distance_min = orbit - squish;
    
    // Draw orbit
    fill(0, 0, 0, 0);
    stroke(#ffffff, 20);
    ellipse(0, 0, distance_min * 2, distance_max * 2);
    stroke(0, 0, 0, 0);
    
    // Draw celestial
    pushMatrix();
    rotate(rotation);
    translate(0, distance );
    super.draw_celestial(time);
    popMatrix();
  }
  
}

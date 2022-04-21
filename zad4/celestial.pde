class Celestial {
 
  // Celestial radius
  float radius;
  
  // Amout of vertexes
  int points;
  
  color fill;
  List<Celestial> satellites;
  
  Celestial (float radius, int points, color fill) {
    this.radius = radius;
    this.points = points;
    this.fill = fill;
    satellites = new ArrayList<Celestial>();
  }
  
  void add_satellite (Celestial satellite) {
    satellites.add(satellite);
  }
  
  void draw_celestial (float time) {
    
    // Draw celestial
    pushStyle();
    fill(fill);
    pushMatrix();
    scale(radius);
    drawCircle(points);
    popStyle();
    popMatrix();
    
    // Draw sattelites
    for (Celestial satellite : satellites) {
      satellite.draw_celestial(time);
    }
  }
  
  // Draw circle using vertexes
  void drawCircle(int steps) {
    beginShape();
    for (int i = 0; i < steps; ++i)
      vertex(cos(TWO_PI * (float)i / float(steps)), sin(TWO_PI * (float)i / float(steps)));
    endShape();
  }
}

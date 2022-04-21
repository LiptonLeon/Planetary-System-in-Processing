class Celestial implements Dynamic {
 
  float radius;
  int points;
  color fill;
  PImage texture;
  List<Celestial> satellites;
  
  Celestial(float radius, int points, color fill, PImage texture) {
    this.radius = radius;
    this.points = points;
    this.fill = fill;
    this.texture = texture;
    satellites = new ArrayList<Celestial>();
  }
  
  void addSatellite(Celestial satellite) {
    satellites.add(satellite);
  }
  
  void update(float time) {
    
    // Draw celestial
    stroke(0, 0, 0, 0);
    if (texture != null) {
      drawTexture();
    } else {
      drawCircle(points, radius);
    }
    
    // Draw sattelites
    for (Celestial satellite : satellites) {
      satellite.update(time);
    }
  }
  
  // Draws circle using vertexes
  void drawCircle(int steps, float radius) {
    pushMatrix();
    pushStyle();
    scale(radius);
    beginShape();
    fill(fill);
    for (int i = 0; i < steps; ++i)
      vertex(cos(TWO_PI * (float)i / float(steps)), sin(TWO_PI * (float)i / float(steps)));
    endShape();
    popStyle();
    popMatrix();
  }
  
  void drawTexture() {
    pushMatrix();
    float scale = radius / texture.width * 2;
    translate(-texture.width * scale /2, -texture.width * scale /2);
    scale(scale);
    pushStyle();
    tint(fill);
    image(texture, 0, 0);
    popStyle();
    popMatrix();
  }
}

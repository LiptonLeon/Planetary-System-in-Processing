class Celestial implements Updateable {
 
  float radius;
  int points;
  color fill;
  PImage texture;
  List<Celestial> satellites;
  
  Celestial(float radius, int points, color fill, PImage texture) {
    this.radius = radius;
    this.fill = fill;
    this.texture = texture;
    
    pushMatrix();
    pushStyle();
    
    tint(fill);
    sphereDetail(25);
    sphere(radius * 3);
    
    popStyle();
    popMatrix();
    
    satellites = new ArrayList<Celestial>();
  }
  
  void addSatellite(Celestial satellite) {
    satellites.add(satellite);
  }
  
  void update(float time) {
    
    // Draw celestial
    noStroke();
    if (texture != null)
      drawTexture();
    else
      drawCircle();

    // Draw sattelites
    for (Celestial satellite : satellites) {
      satellite.update(time);
    }
  }
  
  // Draws untextured circle
  void drawCircle() {
    pushMatrix();
    pushStyle();
    scale(radius);
    beginShape();
    fill(fill);
    for (int i = 0; i < points; ++i) {
      float cos_itd = cos(TWO_PI * (float)i / points);
      float sin_itd = sin(TWO_PI * (float)i / points);
      vertex(cos_itd, sin_itd);
    }
    endShape();
    popStyle();
    popMatrix();
  }
  
  // Draws textured circle (worked faster than sprites during testing)
  void drawTexture() {   
    pushMatrix();
    pushStyle();
    beginShape();
    tint(fill);
    texture(texture);
    for (int i = 0; i < points; ++i) {
      float cos_itd = cos(TWO_PI * (float)i / points);
      float sin_itd = sin(TWO_PI * (float)i / points);
      vertex(cos_itd * radius, sin_itd * radius, cos_itd * texture.width/2 + texture.width/2, sin_itd * texture.height/2 + texture.height/2);
    }
    endShape();
    popStyle();
    popMatrix();
  }
}

class Celestial extends Node {
 
  PShape shape;
  
  color fill = 255;
  PImage texture;
  color emission = 0;
  float shininess = 0;
  
  Celestial(PShape shape) {
    super();
    this.shape = shape;
  }
  
  void setMaterial(color emission, float shininess) {
    this.emission = emission;
    this.shininess = shininess;
    pushStyle();
    emissive(emission);
    shininess(shininess);
    popStyle();
  }
  
  void addSatellite(Celestial satellite) {
    children.add(satellite);
  }
  
  void update(float time) {
    
    pushMatrix();
    pushStyle();
    /*
    fill(fill);
    texture(texture);
    sphereDetail(points);
    sphere(radius);*/
    
    rotateX(-PI/2);
    emissive(emission);
    shininess(shininess);
    shape(shape);
    
    popStyle();
    popMatrix();

    // Draw sattelites
    for (Celestial satellite : satellites) {
      satellite.update(time);
    }
  }
  
}

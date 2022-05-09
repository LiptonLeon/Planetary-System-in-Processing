class Celestial extends Node {
 
  PShape shape;
  
  color fill = 255;
  PImage texture;
  color emission = 0;
  float shininess = 0;
  color specular;
  
  Celestial(PShape shape, color fill, String texture) {
    super();
    this.shape = shape;
    this.fill = fill;
    this.texture = loadImage(texture);
  }
  
  void setMaterial(color emission, float shininess, color specular) {
    this.emission = emission;
    this.shininess = shininess;
    this.specular = specular;
  }
  
  void addSatellite(Celestial satellite) {
    children.add(satellite);
  }
  
  void update(float time) {
    
    // Draw sattelites
    for (Node child : children) {
      child.update(time);
    }
    
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

  }
  
}
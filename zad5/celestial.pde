class Celestial extends Node {
 
  PShape shape;
  
  color fill = 255;
  PImage texture;
  color emission = 0;
  float shininess = 0;
  color specular = 0;
  
  Celestial(PShape shape, color fill, String texture) {
    super();
    this.shape = shape;
    this.fill = fill;
    this.texture = loadImage(texture);
  }
  
  Celestial(PShape shape, color fill) {
    super();
    this.shape = shape;
    this.fill = fill;
    this.texture = null;
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
    
    // Apply fill and texture
    rotateX(-PI/2);
    fill(fill);
    if(texture != null) 
      texture(texture);
    
    // Apply material
    emissive(emission);
    shininess(shininess);
    specular(specular);
    
    // Draw celestial
    shape(shape);
    
    popStyle();
    popMatrix();

  }
  
}
